# TailordEats — Food Recipe Generator

UK-focused AI nutrition planner and recipe generator. It collects a user profile, calculates
daily calorie/macro targets (Mifflin–St Jeor + activity/exercise multipliers), generates
British-style meals with a fine-tuned OpenAI model, attaches real food photography from
Unsplash, and stores everything in MongoDB Atlas.

---

## 1. Project Description

### What it does

| Area | Description |
|---|---|
| **Profile & macros** | 12-screen signup collects gender, age, weight, height, activity level, dietary preference, goal and pace. `config.py` computes BMR → maintenance → target calories → macro split → per-meal split. |
| **Meal generation** | `app.py` (`MealGenerator`) prompts a fine-tuned model for UK meals with full ingredient-level macros, instructions, cost in GBP, prep/cook times and allergens. Limited to **one generation per meal type, per user, per day**. |
| **Images** | `images.py` fetches a *unique* food photo per recipe from the Unsplash Search API, cached in MongoDB so the same dish never costs a second API call. |
| **Persistence** | MongoDB stores generated meals, favorites, eaten-meal logs, user profiles, generation limits and the image cache. |
| **Recommendations** | Endpoints for personalised feeds, "similar to this recipe", time-of-day suggestions and taste preference analysis. |

### Tech stack

- **API**: FastAPI + Uvicorn (`api.py`)
- **AI**: OpenAI Chat Completions — model `ft:gpt-4o-mini-2024-07-18:tailored-eats:tailordeats:DDMd8ULa`
- **Images**: Unsplash `GET https://api.unsplash.com/search/photos`
- **Database**: MongoDB Atlas (`pymongo`), database `TailordEats`
- **Auth**: email + bcrypt-hashed password (no tokens/sessions — see §6)
- **Nutrition data**: embedded CoFID 2021 table + UK price/template data in `data.py`

### File map

| File | Purpose |
|---|---|
| `api.py` | FastAPI app — all HTTP endpoints, Pydantic models, enums, response middleware |
| `app.py` | `MealGenerator` — prompt building, OpenAI calls, validation, CLI workflow |
| `config.py` | BMR/TDEE/macro math, Plan A/B meal splits, `calculate_full_plan()` |
| `db.py` | MongoDB collections and all read/write helpers |
| `images.py` | Unsplash search, per-meal image cache, duplicate avoidance |
| `data.py` | CoFID 2021 nutrition table, UK prices, recipe templates |
| `openapi.yaml` | Static OpenAPI spec (may lag behind `api.py`) |
| `TailordEats.postman_collection.json` | Postman collection, `baseUrl` variable |
| `start.bat` | Windows launcher for the Uvicorn server |

### MongoDB collections

| Collection | Contents |
|---|---|
| `all_meals` | Every generated meal, one flat document per meal |
| `favorites` | Meals the user hearted |
| `users` | Profiles + calculations + daily/meal macro targets |
| `eaten_meals` | "I ate this" log, one document per eaten meal per day |
| `generation_log` | One doc per `user_id + meal_type + date` — enforces the daily limit |
| `image_cache` | `meal_name → image_url` map |

### Setup

```bash
python -m venv .venv && .venv\Scripts\activate && pip install -r requirements.txt
```

`.env` in the project root:

```
OPENAI_API_KEY=sk-...
MONGODB_URI=mongodb+srv://...
UNSPLASH_ACCESS_KEY=...
DAILY_LIMIT_ENABLED=true      # set to false to bypass the 1-per-day generation cap while testing
```

Run:

```bash
python -m uvicorn api:app --host 0.0.0.0 --port 8000 --reload
```

Interactive docs: `http://localhost:8000/docs`

---

## 2. Base URL & Conventions

| | |
|---|---|
| **Local base URL** | `http://localhost:8000` |
| **LAN base URL** (Postman `{{baseUrl}}`) | `http://10.10.20.11:8000` |
| **Swagger UI** | `/docs` |
| **ReDoc** | `/redoc` |
| **OpenAPI JSON** | `/openapi.json` |
| **CORS** | `allow_origins=["*"]`, all methods, all headers, credentials allowed |

### Request headers

| Header | Value | When |
|---|---|---|
| `Content-Type` | `application/json` | Every request with a JSON body (`POST /signup`, `POST /login`, `POST /favorite/add`, `DELETE /favorite/remove`, `POST /ate-this`) |
| `Accept` | `application/json` | Optional; JSON is always returned |

> **There is no `Authorization` header.** The API has no tokens or sessions. The caller identifies
> the user by passing their email as `user_id` in the query string or JSON body on every call.

### Response headers

| Header | Value |
|---|---|
| `content-type` | `application/json` |

A middleware (`standardize_json_response`) intercepts every JSON response except `/docs`,
`/redoc` and `/openapi.json`, re-serialises it and drops the original `content-length`.

### Response envelope

**Success** — any dict response with status < 400 gets `"success": true` injected if absent:

```json
{
  "success": true,
  "...": "endpoint-specific fields"
}
```

**Error** — every `HTTPException`, validation error, MongoDB error and unhandled exception:

```json
{
  "success": false,
  "status_code": 404,
  "message": "User not found",
  "details": null
}
```

`details` is present only when the detail is not a plain string — notably `422` responses,
where it carries the Pydantic error list.

### Status codes used

| Code | Meaning |
|---|---|
| `200` | OK |
| `400` | Email already registered / invalid timezone |
| `401` | Invalid password |
| `404` | User, recipe or favorite not found |
| `422` | Request validation failed (`details` holds the field errors) |
| `429` | Daily generation limit already used for this meal type |
| `500` | Generation failed / password missing from profile / unhandled error |
| `503` | MongoDB connection failure |

### Enum values (dropdowns)

| Field | Allowed values |
|---|---|
| `gender` | `male`, `female` |
| `activity_level` | `sedentary`, `light`, `active`, `very_active` |
| `dietary` | `none`, `vegetarian`, `vegan`, `dairy_free` |
| `goal` | `lose_weight`, `gain_weight`, `body_recomp` |
| `pace` | `slow_sustainable`, `lifestyle_change` |
| `gym_sessions` | `1-2 sessions/week`, `3-4 sessions/week`, `5+ sessions/week` |
| `meal_type` | `breakfast`, `lunch`, `dinner`, `snacks` |
| `macro` (filter) | `high_protein`, `balanced`, `low_carbs` |

---

## 3. Endpoint Reference

### Endpoint index

| # | Method | Path | Tag |
|---|---|---|---|
| 0 | GET | `/` | Health |
| 1 | POST | `/signup` | Auth |
| 2 | POST | `/login` | Auth |
| 3 | GET | `/generate/{meal_type}` | Meals |
| 4 | GET | `/meals` | Meals |
| 5 | GET | `/meal-suggestions` | Meals |
| 6 | GET | `/meal/{recipe_name}` | Meals |
| 7 | POST | `/favorite/add` | Favorites |
| 8 | DELETE | `/favorite/remove` | Favorites |
| 9 | GET | `/favorites` | Favorites |
| 10 | POST | `/ate-this` | Tracking |
| 11 | GET | `/eaten-today` | Tracking |
| 12 | GET | `/profile/{user_id}` | Profile |
| 13 | GET | `/home/{user_id}` | Profile |
| 14 | GET | `/preferences/{user_id}` | Recommendations |
| 15 | GET | `/recommendations/{user_id}` | Recommendations |
| 16 | GET | `/suggestions/{meal_type}` | Recommendations |
| 17 | GET | `/similar/{recipe_name}` | Recommendations |
| 18 | GET | `/for-you/{user_id}` | Recommendations |

---

### 0. `GET /` — Health check

**Headers:** none. **Payload:** none.

**Response `200`**
```json
{ "status": "ok", "api": "TailordEats", "version": "2.0", "success": true }
```

---

### 1. `POST /signup`

Creates the account, computes the full nutrition plan and stores it in `users`.
The password is bcrypt-hashed before storage.

**Headers:** `Content-Type: application/json`

**Payload**
```json
{
  "first_name": "Raihan",
  "last_name": "Ahmed",
  "email": "raihan@gmail.com",
  "password": "123456",
  "gender": "male",
  "age": 26,
  "weight_kg": 73,
  "height_cm": 178,
  "activity_level": "light",
  "dietary": "none",
  "goal": "body_recomp",
  "pace": "slow_sustainable",
  "gym_sessions": "3-4 sessions/week"
}
```

| Field | Type | Constraint |
|---|---|---|
| `first_name`, `last_name`, `email`, `password` | string | required |
| `gender` | enum | `male` / `female` |
| `age` | int | 11–80 |
| `weight_kg` | float | 30–200 |
| `height_cm` | float | 100–230 |
| `activity_level` | enum | mapped to daily steps: sedentary 2000, light 4500, active 8000, very_active 12000 |
| `dietary` | enum | default `none` |
| `goal`, `pace` | enum | required |
| `gym_sessions` | enum | mapped to sessions/week: 2, 4 or 6 |

**Response `200`**
```json
{
  "success": true,
  "message": "Account created successfully!",
  "user_id": "raihan@gmail.com",
  "profile_id": "66c1f0a3e4b0f2a1c8d9e123",
  "daily_targets": {
    "calories": 2610,
    "protein_g": 161,
    "carbs_g": 318,
    "fat_g": 76,
    "protein_kcal": 644,
    "carbs_kcal": 1279,
    "fat_kcal": 688
  },
  "meal_targets": {
    "breakfast": { "calories": 653, "protein_g": 40, "carbs_g": 80, "fat_g": 19 },
    "lunch":     { "calories": 783, "protein_g": 48, "carbs_g": 95, "fat_g": 23 },
    "dinner":    { "calories": 913, "protein_g": 56, "carbs_g": 111, "fat_g": 27 },
    "snacks":    { "calories": 261, "protein_g": 16, "carbs_g": 32, "fat_g": 8 }
  }
}
```

**Meal split rule** — chosen automatically from total daily calories:
- **Plan A** (≤ 3,000 kcal, 4 meals): breakfast 25% · lunch 30% · dinner 35% · snacks 10%
- **Plan B** (> 3,000 kcal, 5 meals): breakfast 25% · lunch 20% · dinner 25% · supper 25% · snacks 10%

Rounding drift is corrected on the largest meal so the meal totals stay within ±50 kcal of the daily target.

**Errors:** `400` email already registered · `422` validation · `503` DB down

---

### 2. `POST /login`

**Headers:** `Content-Type: application/json`

**Payload**
```json
{ "email": "raihan@gmail.com", "password": "123456" }
```

**Response `200`**
```json
{
  "success": true,
  "user_id": "raihan@gmail.com",
  "user_info": { "first_name": "Raihan", "last_name": "Ahmed" },
  "daily_targets": { "calories": 2610, "protein_g": 161, "carbs_g": 318, "fat_g": 76 },
  "meal_targets": { "breakfast": { "...": "..." } }
}
```

No token is issued — reuse `user_id` (the email) on subsequent calls.

**Errors:** `404` user not found · `401` invalid password · `500` password missing from profile

---

### 3. `GET /generate/{meal_type}`

Generates new meals with the fine-tuned model, attaches Unsplash images, saves them to
`all_meals` and records the daily-limit marker.

**Path:** `meal_type` — `breakfast` | `lunch` | `dinner` | `snacks`

**Query**

| Param | Type | Default | Constraint |
|---|---|---|---|
| `user_id` | string | — | required, user email |
| `num_meals` | int | `10` | 1–100 |

**Headers:** none. **Payload:** none.

**Calorie bands enforced per meal type**

| Meal type | min kcal | max kcal |
|---|---|---|
| breakfast | 200 | 500 |
| lunch | 400 | 800 |
| dinner | 400 | 900 |
| snacks | 100 | 300 |

`GET /generate/breakfast?user_id=raihan@gmail.com&num_meals=10`

**Response `200`**
```json
{
  "success": true,
  "meal_type": "breakfast",
  "user_id": "raihan@gmail.com",
  "count": 10,
  "saved": 10,
  "calorie_range": { "min": 200, "max": 500 },
  "meals": [ { "...": "see Meal object below" } ]
}
```

**Errors:** `429` already generated this meal type today · `500` generation failed · `503` DB down

> The daily limit is checked *before* the OpenAI call so a blocked request costs nothing.
> Set `DAILY_LIMIT_ENABLED=false` in `.env` to disable it during testing.

#### Meal object

Every meal returned by `/generate`, `/meals`, `/meal-suggestions`, `/recommendations`,
`/suggestions`, `/similar` and `/for-you` uses this shape:

```json
{
  "id": 1,
  "meal_name": "Smoked Salmon and Scrambled Eggs on Sourdough",
  "meal_type": "breakfast",
  "macro_profile": "high_protein",
  "cuisine": "British",
  "description": "Creamy scrambled eggs with cold-smoked salmon on toasted sourdough.",
  "calories_kcal": 452,
  "protein_g": 32.5,
  "carbs_g": 28.0,
  "fat_g": 23.4,
  "prep_time_minutes": 5,
  "cook_time_minutes": 8,
  "total_time_minutes": 13,
  "cost_gbp": 3.45,
  "difficulty": "easy",
  "ingredients": [
    { "item": "Free-range eggs, beaten", "quantity": "2 medium (110g)",
      "calories": 156, "protein_g": 13.2, "carbs_g": 0.8, "fat_g": 11.1 }
  ],
  "instructions": ["Step 1 ...", "Step 2 ..."],
  "tips": "Take the pan off the heat while the eggs are still slightly wet.",
  "storage": "Best eaten immediately; do not reheat.",
  "dietary_tags": ["high_protein"],
  "allergens": ["egg", "fish", "gluten"],
  "image_url": "https://images.unsplash.com/photo-...?w=800&q=80",
  "user_id": "raihan@gmail.com",
  "data_source": "cofid_2021",
  "is_favorite": false,
  "created_at": "2026-09-05T08:14:22.115Z"
}
```

`macro_profile` distribution across a batch is roughly 60% `balanced`, 20% `high_protein`,
20% `low_carbs`. `meal_name` is sanitised to letters, numbers, spaces and apostrophes so it is
URL-safe for `/meal/{recipe_name}`. Fields `user_id`, `data_source`, `is_favorite` and
`created_at` are added by `db.save_meals_flat()` on write.

---

### 4. `GET /meals`

Paged, filtered list from either `all_meals` or `favorites`.

**Query**

| Param | Type | Default | Notes |
|---|---|---|---|
| `user_id` | string | — | required |
| `meal_type` | enum | none | `breakfast` / `lunch` / `dinner` / `snacks` |
| `source` | string | `all` | `all` or `favorites` |
| `price_min` / `price_max` | float | none | filters `cost_gbp` |
| `time_min` / `time_max` | int | none | filters `total_time_minutes` |
| `macro` | string | none | `high_protein` / `balanced` / `low_carbs` |
| `limit` | int | `50` | 1–200 |
| `skip` | int | `0` | ≥ 0 |

`GET /meals?user_id=raihan@gmail.com&meal_type=lunch&source=all&price_min=2&price_max=8&time_min=10&time_max=30&macro=balanced&limit=20&skip=0`

**Response `200`**
```json
{
  "success": true,
  "source": "all",
  "meal_type": "lunch",
  "total": 137,
  "returned": 20,
  "meals": [ { "...": "Meal object" } ]
}
```

`total` is the unfiltered count for that user + meal type; `returned` is the size of this page.
Results are sorted newest-first (`created_at` desc, or `favorited_at` desc for favorites).

---

### 5. `GET /meal-suggestions`

Picks a meal type from the wall-clock hour in the given timezone and returns meals of that type.

**Query**

| Param | Type | Default | Notes |
|---|---|---|---|
| `user_id` | string | — | required |
| `tz` | string | `Asia/Dhaka` | IANA timezone name |
| `hour` | int | none | 0–23, overrides the clock for testing |
| `limit` | int | `10` | 1–50 |

**Time windows**

| Window | Meal type |
|---|---|
| 00:00–09:59 | breakfast |
| 10:00–14:59 | lunch |
| 15:00–16:59 | snacks |
| 17:00–23:59 | dinner |

**Response `200`**
```json
{
  "success": true,
  "timezone": "Asia/Dhaka",
  "current_time": "2026-09-05T08:31:07+06:00",
  "hour_24": 8,
  "meal_type": "breakfast",
  "window": { "start": "00:00", "end": "09:59" },
  "suggestions": [ { "...": "Meal object" } ]
}
```

**Errors:** `400` invalid timezone

---

### 6. `GET /meal/{recipe_name}`

Full recipe detail plus the favorite flag. Match on `meal_name` is exact but case-insensitive.

**Path:** `recipe_name` — URL-encode it (`Chicken%20Tikka%20Masala`)
**Query:** `user_id` (required)

**Response `200`**
```json
{
  "success": true,
  "recipe_name": "Chicken Tikka Masala",
  "description": "Marinated chicken in a spiced tomato and cream sauce.",
  "cuisine": "British Indian",
  "meal_type": "dinner",
  "macro_profile": "high_protein",
  "calories_kcal": 720,
  "protein_g": 48.0,
  "carbs_g": 62.0,
  "fat_g": 28.0,
  "fiber_g": 6.0,
  "ingredients": [ { "item": "...", "quantity": "...", "calories": 0, "protein_g": 0, "carbs_g": 0, "fat_g": 0 } ],
  "instructions": ["..."],
  "prep_time_minutes": 20,
  "cook_time_minutes": 35,
  "total_time_minutes": 55,
  "cost_gbp": 4.10,
  "image_url": "https://images.unsplash.com/photo-...",
  "is_favorite": true
}
```

**Errors:** `404` meal not found for this user

---

### 7. `POST /favorite/add`

**Headers:** `Content-Type: application/json`

**Payload**
```json
{
  "user_id": "raihan@gmail.com",
  "meal_type": "breakfast",
  "recipe_name": "Avocado Toast"
}
```

**Response `200` (new)**
```json
{
  "success": true,
  "message": "Added to favorites",
  "recipe_name": "Avocado Toast",
  "meal_type": "breakfast",
  "favorite_id": "66c1f2b7e4b0f2a1c8d9e456",
  "is_favorite": true
}
```

**Response `200` (already favorited)** — same shape, `message: "Recipe already in favorites"`, no `favorite_id`.

**Errors:** `404` recipe not found in that meal type for this user

---

### 8. `DELETE /favorite/remove`

**Headers:** `Content-Type: application/json`
**Payload sent in the request body** (note: a body on `DELETE` — some HTTP clients need this enabled explicitly).

```json
{ "user_id": "raihan@gmail.com", "recipe_name": "Avocado Toast" }
```

**Response `200`**
```json
{
  "success": true,
  "message": "Removed from favorites",
  "recipe_name": "Avocado Toast",
  "removed": true,
  "is_favorite": false
}
```

**Errors:** `404` recipe not in favorites

---

### 9. `GET /favorites`

**Query:** `user_id` (required)

**Response `200`**
```json
{
  "success": true,
  "user_id": "raihan@gmail.com",
  "total_favorites": 7,
  "counts": { "breakfast": 2, "lunch": 1, "dinner": 3, "snacks": 1 },
  "favorites": {
    "breakfast": [
      {
        "recipe_name": "Avocado Toast",
        "calories_kcal": 380,
        "protein_g": 12,
        "carbs_g": 38,
        "fat_g": 20,
        "prep_time_minutes": 10,
        "cost_gbp": 2.20,
        "macro_profile": "balanced",
        "cuisine": "British"
      }
    ],
    "lunch": [], "dinner": [], "snacks": []
  }
}
```

This is a summary view — call `/meal/{recipe_name}` for the full recipe.

---

### 10. `POST /ate-this`

Logs a meal against today's UTC date, copying the full recipe document into `eaten_meals`.

**Headers:** `Content-Type: application/json`

**Payload**
```json
{
  "user_id": "raihan@gmail.com",
  "meal_type": "breakfast",
  "recipe_name": "Avocado Toast"
}
```

**Response `200`**
```json
{
  "success": true,
  "date": "2026-09-05",
  "id": "66c1f4c1e4b0f2a1c8d9e789",
  "message": "Tracked: Avocado Toast",
  "meal_type": "breakfast",
  "recipe_name": "Avocado Toast",
  "nutrition_added": { "calories_kcal": 380, "protein_g": 12, "carbs_g": 38, "fat_g": 20 }
}
```

**Errors:** `404` recipe not found in that meal type

---

### 11. `GET /eaten-today`

**Query:** `user_id` (required). The date is always today in **UTC**.

**Response `200`**
```json
{
  "success": true,
  "date": "2026-09-05",
  "meals_count": 2,
  "meals": [
    { "recipe_name": "Avocado Toast", "meal_type": "breakfast",
      "calories_kcal": 380, "protein_g": 12, "carbs_g": 38, "fat_g": 20 }
  ],
  "totals":        { "calories_kcal": 1100, "protein_g": 60, "carbs_g": 120, "fat_g": 42 },
  "remaining":     { "calories_kcal": 1510, "protein_g": 101, "carbs_g": 198, "fat_g": 34 },
  "daily_targets": { "calories_kcal": 2610, "protein_g": 161, "carbs_g": 318, "fat_g": 76 }
}
```

If the user has no profile, targets fall back to 2000 kcal / 150 P / 200 C / 70 F.
`remaining` can go negative.

---

### 12. `GET /profile/{user_id}`

**Path:** `user_id` — the user's email (URL-encode the `@` as `%40` if the client requires it).

**Response `200`**
```json
{
  "success": true,
  "user_id": "raihan@gmail.com",
  "user_info": { "first_name": "Raihan", "last_name": "Ahmed", "email": "raihan@gmail.com" },
  "profile": {
    "gender": "male", "age": 26,
    "weight_kg": 73, "weight_lbs": 161,
    "height_cm": 178, "daily_steps": 4500,
    "gym_sessions": 4, "goal": "body_recomp",
    "pace": "slow_sustainable", "dietary": "none", "num_meals": 4
  },
  "daily_macros": { "calories": 2610, "protein_g": 161, "carbs_g": 318, "fat_g": 76,
                    "protein_kcal": 644, "carbs_kcal": 1279, "fat_kcal": 688 },
  "meal_targets": { "breakfast": { "...": "..." } },
  "calculations": {
    "bmr": 1729,
    "activity": { "name": "light", "multiplier": 0.15, "description": "..." },
    "exercise": { "name": "moderate", "multiplier": 0.20, "description": "..." },
    "maintenance": 2334,
    "goal_adjustment": 276,
    "total_multiplier": 1.35,
    "meal_plan": "A"
  }
}
```

The password hash is never returned. **Errors:** `404` user not found

---

### 13. `GET /home/{user_id}`

Everything the Home screen needs in one call.

**Response `200`**
```json
{
  "success": true,
  "user": { "first_name": "Raihan", "goal": "Body Recomp" },
  "daily_targets": { "calories": 2610, "protein_g": 161, "carbs_g": 318, "fat_g": 76 },
  "today": {
    "eaten":     { "calories": 1100, "protein_g": 60, "carbs_g": 120, "fat_g": 42 },
    "remaining": { "calories": 1510, "protein_g": 101, "carbs_g": 198, "fat_g": 34 },
    "meals_eaten": 2
  },
  "stats": { "total_meals": 137, "favorites": 7 }
}
```

**Errors:** `404` user not found

---

### 14. `GET /preferences/{user_id}`

Analyses favorites and eaten meals to infer taste.

**Response `200` (enough data)**
```json
{
  "success": true,
  "user_id": "raihan@gmail.com",
  "has_data": true,
  "total_favorites": 7,
  "total_eaten": 24,
  "preferences": {
    "cuisines":       [ { "name": "British Indian", "count": 9 } ],
    "proteins":       [ { "name": "chicken", "count": 12 } ],
    "macro_profiles": [ { "name": "high_protein", "count": 15 } ]
  },
  "summary": {
    "favorite_cuisine": "British Indian",
    "favorite_protein": "chicken",
    "preferred_macro": "high_protein"
  }
}
```

**Response `200` (not enough data)**
```json
{
  "success": true,
  "has_data": false,
  "message": "Not enough data yet. Keep using the app - favorite meals and track what you eat!",
  "tip": "After 5-10 favorites and eaten meals, we'll understand your taste."
}
```

---

### 15. `GET /recommendations/{user_id}`

**Query:** `meal_type` (optional enum), `limit` (default `10`, 1–50)

**Response `200`**
```json
{
  "success": true,
  "user_id": "raihan@gmail.com",
  "meal_type": "dinner",
  "has_preferences": true,
  "user_preferences": { "...": "same shape as /preferences" },
  "recommendations": {
    "similar":  { "description": "Meals matching your taste", "count": 6, "meals": [] },
    "discover": { "description": "New meals to try",          "count": 4, "meals": [] }
  }
}
```

---

### 16. `GET /suggestions/{meal_type}`

"What should I eat for X?" — factors in today's intake and remaining calories.

**Path:** `meal_type` enum. **Query:** `user_id` (required), `limit` (default `5`, 1–20)

**Response `200`**
```json
{
  "success": true,
  "user_id": "raihan@gmail.com",
  "meal_type": "breakfast",
  "calorie_target": 653,
  "today_status": { "meals_eaten": 1, "calories_consumed": 380, "calories_remaining": 2230 },
  "suggestions": [ { "...": "Meal object" } ]
}
```

---

### 17. `GET /similar/{recipe_name}`

**Path:** `recipe_name`, URL-encoded. **Query:** `user_id` (required), `limit` (default `5`, 1–20)

Matches on cuisine, macro profile, similar calories and the same meal type.

**Response `200`**
```json
{
  "success": true,
  "reference_meal": "Chicken Tikka Masala",
  "count": 5,
  "similar_meals": [ { "...": "Meal object" } ]
}
```

If the reference meal exists but nothing matches, `similar_meals` is `[]` with a
`message` field instead of `count`. **Errors:** `404` reference recipe not found

---

### 18. `GET /for-you/{user_id}`

Mixed personalised feed: ~60% similar, ~30% discover, ~10% favorites, shuffled.

**Query:** `limit` (default `20`, 1–50)

**Response `200`**
```json
{
  "success": true,
  "user_id": "raihan@gmail.com",
  "has_preferences": true,
  "feed_count": 20,
  "feed_breakdown": { "similar": 12, "discover": 6, "favorites": 2 },
  "feed": [
    {
      "...": "Meal object",
      "position": 1,
      "recommendation_type": "similar | discover | favorite",
      "recommendation_reason": "One of your favorites"
    }
  ]
}
```

---

## 4. External APIs Consumed

### OpenAI Chat Completions

| | |
|---|---|
| **URL** | `POST https://api.openai.com/v1/chat/completions` (via the `openai` Python SDK) |
| **Headers** | `Authorization: Bearer $OPENAI_API_KEY`, `Content-Type: application/json` — set by the SDK |
| **Model** | `ft:gpt-4o-mini-2024-07-18:tailored-eats:tailordeats:DDMd8ULa` |
| **Payload** | `model`, `messages` (system prompt carrying the strict JSON recipe schema + a user prompt like `x10 breakfast calories:200-500`), plus generation params |
| **Response** | JSON only — `{ "meals": [ ... ] }` in the strict schema shown in the Meal object above. `app.py` parses it, validates that ingredient macros sum to the meal totals (±5 kcal), de-duplicates against recent meal names and sanitises `meal_name`. |

### Unsplash Search

| | |
|---|---|
| **URL** | `GET https://api.unsplash.com/search/photos` |
| **Headers** | `Authorization: Client-ID $UNSPLASH_ACCESS_KEY` |
| **Query params** | `query`, `per_page=10`, `orientation=squarish`, `content_filter=high` |
| **Timeout** | 6 seconds |
| **Response used** | `results[].urls.regular` |
| **Fallback** | `https://images.unsplash.com/photo-1495521821757-a1efb6729352?w=800&q=80` |

Query widening ladder — tried in order until one returns results:
1. `meal_name + cuisine`
2. meal name with trailing numbers stripped
3. meal name with numbers *and* filler words stripped
4. `cuisine + meal_type`
5. `meal_type food`

`403` (rate limit — 50 req/hour on a demo key), network errors and a missing key all fail
silently and yield the default image, so meal generation is never blocked.

---

## 5. Quick cURL Reference

```bash
curl -X POST http://localhost:8000/signup -H "Content-Type: application/json" -d '{"first_name":"Raihan","last_name":"Ahmed","email":"raihan@gmail.com","password":"123456","gender":"male","age":26,"weight_kg":73,"height_cm":178,"activity_level":"light","dietary":"none","goal":"body_recomp","pace":"slow_sustainable","gym_sessions":"3-4 sessions/week"}'
```

```bash
curl -X POST http://localhost:8000/login -H "Content-Type: application/json" -d '{"email":"raihan@gmail.com","password":"123456"}'
```

```bash
curl "http://localhost:8000/generate/breakfast?user_id=raihan@gmail.com&num_meals=10"
```

```bash
curl "http://localhost:8000/meals?user_id=raihan@gmail.com&meal_type=lunch&source=all&price_max=8&time_max=30&macro=balanced&limit=20"
```

```bash
curl -X POST http://localhost:8000/favorite/add -H "Content-Type: application/json" -d '{"user_id":"raihan@gmail.com","meal_type":"breakfast","recipe_name":"Avocado Toast"}'
```

```bash
curl -X DELETE http://localhost:8000/favorite/remove -H "Content-Type: application/json" -d '{"user_id":"raihan@gmail.com","recipe_name":"Avocado Toast"}'
```

```bash
curl -X POST http://localhost:8000/ate-this -H "Content-Type: application/json" -d '{"user_id":"raihan@gmail.com","meal_type":"breakfast","recipe_name":"Avocado Toast"}'
```

```bash
curl "http://localhost:8000/eaten-today?user_id=raihan@gmail.com"
```

---

## 6. Known Gaps & Notes

- **No authentication layer.** Any caller who knows an email can read and write that user's
  data. There are no tokens, sessions or per-client rate limits. Do not expose this API
  publicly as-is.
- **Recommendation endpoints depend on missing DB helpers.** `/preferences/{user_id}`,
  `/recommendations/{user_id}`, `/suggestions/{meal_type}`, `/similar/{recipe_name}` and
  `/for-you/{user_id}` call `db.analyze_user_preferences()`, `db.get_recommended_meals()`,
  `db.get_meal_suggestions()` and `db.get_similar_to_meal()`, none of which are defined in
  `db.py`. Until they are implemented, those five endpoints return `500` from the unhandled
  exception handler. The request/response shapes documented above are what `api.py` intends
  to return.
- **Mixed date bases.** Tracking (`/ate-this`, `/eaten-today`) and the generation limit use
  **UTC** dates, while `/meal-suggestions` uses the caller's timezone. Near midnight these
  can disagree.
- **`.env` is committed to the repo** and contains a live MongoDB URI. Rotate those
  credentials and add `.env` to `.gitignore`.
- **`openapi.yaml` may be stale** — the live spec at `/openapi.json` is generated from
  `api.py` and is authoritative.
- **Legacy plaintext passwords** are still accepted: `verify_password()` falls back to a
  string comparison when the stored value is not a valid bcrypt hash.
- **`fiber_g` is only surfaced by `/meal/{recipe_name}`**, which defaults it to `0`; the
  generator's schema does not produce it.
