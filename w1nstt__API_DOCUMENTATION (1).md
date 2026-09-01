# AppCake Backend — Complete API Reference Guide

> **Route Prefix Note**: In this backend, all API routes are mounted under `/api/v1` in `src/app.js` (`app.use("/api/v1", allRouter)`).
> 
> **Base URL Variable**:
> - **Local Development**: `http://localhost:8002/api/v1`
> - **Dev Tunnels / Production**: `https://jpb8m13w-8002.inc1.devtunnels.ms/api/v1`
> - **Postman Environment Variable**: `{{baseUrl}}` = `http://localhost:8002/api/v1`

---

## Table of Contents
1. [Authentication & Onboarding (`/auth`)](#1-authentication--onboarding)
2. [User Profile & Preferences (`/user`)](#2-user-profile--preferences)
3. [Friend & Social Features (`/friend`)](#3-friend--social-features)
4. [Meals & Calorie Tracking (`/meal`)](#4-meals--calorie-tracking)
5. [Consistency & Progress Tracking (`/consistency`)](#5-consistency--progress-tracking)
6. [Goal Management (`/goal`)](#6-goal-management)
7. [Settings, Security & Support (`/settings`)](#7-settings-security--support)
8. [Frequently Asked Questions (`/faq`)](#8-frequently-asked-questions)
9. [Notifications (`/notification`)](#9-notifications)
10. [Admin & Dashboard Management (`/dashboard`)](#10-admin--dashboard-management)

---

## 1. Authentication & Onboarding

### 1.1 Register New User
- **Route**: `POST {{baseUrl}}/auth/register`
- **Auth**: Public
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "name": "John Doe",
  "email": "john.doe@example.com",
  "password": "Password123!",
  "confirmPassword": "Password123!"
}
```
- **Success Response (201 Created)**:
```json
{
  "statusCode": 201,
  "success": true,
  "message": "Account created successfully",
  "data": {
    "user": {
      "name": "John Doe",
      "email": "john.doe@example.com"
    },
    "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
  }
}
```

---

### 1.2 Login User
- **Route**: `POST {{baseUrl}}/auth/login`
- **Auth**: Public
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "email": "john.doe@example.com",
  "password": "Password123!"
}
```
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Log in successful",
  "data": {
    "user": {
      "_id": "66d3f820c741e95642a8b111",
      "name": "John Doe",
      "email": "john.doe@example.com"
    },
    "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
  }
}
```

---

### 1.3 Send Email Verification OTP
- **Route**: `POST {{baseUrl}}/auth/send-email-otp`
- **Auth**: Public
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "email": "john.doe@example.com"
}
```
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Check your email",
  "data": {
    "email": "john.doe@example.com"
  }
}
```

---

### 1.4 Verify Email OTP
- **Route**: `POST {{baseUrl}}/auth/check-email-otp`
- **Auth**: Public
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "email": "john.doe@example.com",
  "otp": "123456"
}
```
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Email verified successfully",
  "data": {
    "isVerified": true
  }
}
```

---

### 1.5 Forgot Password (Request OTP)
- **Route**: `POST {{baseUrl}}/auth/forget-password`
- **Auth**: Public
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "email": "john.doe@example.com"
}
```
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Check your email"
}
```

---

### 1.6 Forgot Password — Verify OTP
- **Route**: `POST {{baseUrl}}/auth/forget-password-check-otp`
- **Auth**: Public
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "email": "john.doe@example.com",
  "otp": "123456"
}
```
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "forget password otp verified successfully",
  "data": {
    "email": "john.doe@example.com",
    "activationToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
  }
}
```

---

### 1.7 Reset Password
- **Route**: `PATCH {{baseUrl}}/auth/reset-password`
- **Auth**: Public
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "newPassword": "NewSecurePassword123!",
  "confirmPassword": "NewSecurePassword123!"
}
```
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Password has been reset successfully."
}
```

---

### 1.8 Admin Registration
- **Route**: `POST {{baseUrl}}/auth/admin-register`
- **Auth**: Public
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "name": "Super Admin",
  "email": "admin@appcake.com",
  "password": "AdminPassword123!",
  "role": "Super Admin"
}
```
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Admin added successfully",
  "data": {
    "_id": "66d3f820c741e95642a8b999",
    "name": "Super Admin",
    "email": "admin@appcake.com",
    "role": "Super Admin"
  }
}
```

---

### 1.9 Admin Login
- **Route**: `POST {{baseUrl}}/auth/admin-login`
- **Auth**: Public
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "email": "admin@appcake.com",
  "password": "AdminPassword123!"
}
```
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Admin logged In successfully",
  "data": {
    "admin": {
      "_id": "66d3f820c741e95642a8b999",
      "name": "Super Admin",
      "email": "admin@appcake.com",
      "role": "Super Admin"
    },
    "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
  }
}
```

---

## 2. User Profile & Preferences

### 2.1 Get Current User Profile Details
- **Route**: `GET {{baseUrl}}/user/user-detail`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "User details got successfully",
  "data": {
    "_id": "66d3f820c741e95642a8b111",
    "name": "John Doe",
    "firstName": "John",
    "lastName": "Doe",
    "email": "john.doe@example.com",
    "gender": "Male",
    "age": 28,
    "height": 178,
    "activityLevel": "Active",
    "foodVibe": "None",
    "mainGoal": "Loose_Weight",
    "result": "Life_Style_Change",
    "training": "3-4_sessions/week",
    "image": "uploads/profile-image/john-1725192800.jpg",
    "profile_image": "uploads/profile-image/john-1725192800.jpg",
    "weight": 75.5,
    "calorie": 2200,
    "subscriptionPlan": null,
    "isTwoFactor": false
  }
}
```

---

### 2.2 Register & Complete User Profile (Onboarding Flow)
- **Route**: `PATCH {{baseUrl}}/user/complete-profile`
- **Auth**: Public
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "firstName": "John",
  "lastName": "Doe",
  "email": "john.doe@example.com",
  "password": "Password123!",
  "age": 28,
  "gender": "Male",
  "height": 178,
  "weight": 75.5,
  "activityLevel": "Active",
  "foodVibe": "None",
  "mainGoal": "Loose_Weight",
  "result": "Life_Style_Change",
  "training": "3-4_sessions/week"
}
```
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "User registration & profile completion successful!",
  "data": {
    "user": {
      "_id": "66d3f820c741e95642a8b111",
      "name": "John Doe",
      "email": "john.doe@example.com"
    },
    "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
  }
}
```

---

### 2.3 Update User Profile (With Avatar Upload)
- **Route**: `PATCH {{baseUrl}}/user/update-profile`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Body Format**: `multipart/form-data`
- **Form Data Fields**:
  - `profile_image` *(File, optional)*: Image file (`.png`, `.jpg`, `.jpeg`)
  - `firstName` *(Text, optional)*: `"John"`
  - `lastName` *(Text, optional)*: `"Doe"`
  - `age` *(Number, optional)*: `29`
  - `gender` *(Text, optional)*: `"Male"` | `"Female"`
  - `height` *(Number, optional)*: `178`
  - `activityLevel` *(Text, optional)*: `"Sedentary"` | `"Light"` | `"Active"` | `"Very_Active"`
  - `foodVibe` *(Text, optional)*: `"None"` | `"Vegetarian"` | `"Vegan"` | `"Dairy_Free"`
  - `mainGoal` *(Text, optional)*: `"Loose_Weight"` | `"Gain_Weight"` | `"Body_Recamp"`
  - `result` *(Text, optional)*: `"Fast_As_Possible"` | `"Slow_But_Sustainable"` | `"Life_Style_Change"`
  - `training` *(Text, optional)*: `"1-2_sessions/week"` | `"3-4_sessions/week"` | `"5+_sessions/week"`
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "User updated successfully",
  "data": {
    "_id": "66d3f820c741e95642a8b111",
    "name": "John Doe",
    "profile_image": "uploads/profile-image/john-1725193000.jpg"
  }
}
```

---

## 3. Friend & Social Features

### 3.1 Get Friend Suggestions
- **Route**: `GET {{baseUrl}}/friend/get-friend-suggestions`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Query Parameters**:
  - `page` *(optional, default 1)*: Page number
  - `limit` *(optional, default 20)*: Page limit
  - `search` *(optional)*: Search candidate users by name
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Friend suggestions retrieved successfully",
  "meta": {
    "page": 1,
    "limit": 20,
    "total": 1,
    "totalPage": 1
  },
  "data": [
    {
      "_id": "66d3f820c741e95642a8b341",
      "userId": "66d3f820c741e95642a8b341",
      "friendId": "66d3f820c741e95642a8b341",
      "name": "Sarah Connor",
      "firstName": "Sarah",
      "lastName": "Connor",
      "email": "sarah@example.com",
      "gender": "Female",
      "age": 27,
      "height": 165,
      "activityLevel": "Active",
      "foodVibe": "Vegetarian",
      "mainGoal": "Loose_Weight",
      "result": "Slow_But_Sustainable",
      "training": "3-4_sessions/week",
      "image": "uploads/profile-image/sarah.jpg",
      "profile_image": "uploads/profile-image/sarah.jpg",
      "createdAt": "2026-08-25T10:15:30.000Z"
    }
  ]
}
```

---

### 3.2 Send Friend Request
- **Route**: `POST {{baseUrl}}/friend/add-friend`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "receiverId": "66d3f820c741e95642a8b341"
}
```
- **Success Response (201 Created)**:
```json
{
  "statusCode": 201,
  "success": true,
  "message": "Sent friend request",
  "data": {
    "_id": "66d482bf4f1a2345bc789055",
    "sender": "66d3f820c741e95642a8b111",
    "receiver": "66d3f820c741e95642a8b341",
    "status": "Pending",
    "createdAt": "2026-09-01T12:00:00.000Z"
  }
}
```

---

### 3.3 Search Friends / Users
- **Route**: `GET {{baseUrl}}/friend/search-friend?searchName=sarah`
- **Auth**: Public
- **Query Parameters**:
  - `searchName` *(required)*: Name search string
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Searched friends successfully",
  "data": [
    {
      "_id": "66d3f820c741e95642a8b341",
      "name": "Sarah Connor",
      "mainGoal": "Loose_Weight",
      "profile_image": "uploads/profile-image/sarah.jpg"
    }
  ]
}
```

---

### 3.4 Get All Friends List
- **Route**: `GET {{baseUrl}}/friend/get-all-friend`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "All friends retrieved successfully",
  "data": [
    {
      "friendId": "66d3f820c741e95642a8b341",
      "name": "Sarah Connor",
      "mainGoal": "Loose_Weight",
      "image": "uploads/profile-image/sarah.jpg",
      "percentage": 85
    }
  ]
}
```

---

### 3.5 Get Friend Details
- **Route**: `GET {{baseUrl}}/friend/friend-detail/:userId`
- **Auth**: Public
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Got friend detail",
  "data": {
    "details": {
      "_id": "66d3f820c741e95642a8b341",
      "name": "Sarah Connor",
      "mainGoal": "Loose_Weight",
      "consistency": [
        {
          "completed": 85,
          "createdAt": "2026-09-01T00:00:00.000Z"
        }
      ]
    },
    "images": [
      {
        "_id": "66d3f820c741e95642a8b349",
        "url": "uploads/profile-image/sarah-progress-1.jpg",
        "createdAt": "2026-09-01T08:00:00.000Z"
      }
    ]
  }
}
```

---

### 3.6 Get All Friend Requests (Pending)
- **Route**: `GET {{baseUrl}}/friend/get-all-friend-request`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "All friends request retrieved successfully",
  "data": [
    {
      "senderId": "66d3f820c741e95642a8b341",
      "name": "Sarah Connor",
      "mainGoal": "Loose_Weight",
      "image": "uploads/profile-image/sarah.jpg",
      "createdAt": "2026-09-01T10:00:00.000Z"
    }
  ]
}
```

---

### 3.7 Accept Friend Request
- **Route**: `PATCH {{baseUrl}}/friend/accept-request`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "friendId": "66d3f820c741e95642a8b341"
}
```
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Friend request accepted successfully",
  "data": {
    "_id": "66d482bf4f1a2345bc789055",
    "sender": "66d3f820c741e95642a8b341",
    "receiver": "66d3f820c741e95642a8b111",
    "status": "Accepted"
  }
}
```

---

### 3.8 Reject Friend Request
- **Route**: `PATCH {{baseUrl}}/friend/reject-request`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "friendId": "66d3f820c741e95642a8b341"
}
```
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Rejected friend request",
  "data": {
    "_id": "66d482bf4f1a2345bc789055",
    "sender": "66d3f820c741e95642a8b341",
    "receiver": "66d3f820c741e95642a8b111",
    "status": "Rejected"
  }
}
```

---

### 3.9 Unfriend / Remove Friend
- **Route**: `DELETE {{baseUrl}}/friend/make-unfriend/:friendId`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Unfriended successfully",
  "data": {
    "_id": "66d482bf4f1a2345bc789055"
  }
}
```

---

## 4. Meals & Calorie Tracking

### 4.1 Get User Custom Meals
- **Route**: `GET {{baseUrl}}/meal/get-custom-meal`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Query Parameters**:
  - `mealType` *(optional)*: `"Breakfast"` | `"Lunch"` | `"Dinner"` | `"Snack"` | `"Other"`
  - `search` *(optional)*: Filter by meal title
  - `page` *(optional, default 1)*: Page number
  - `limit` *(optional, default 20)*: Page limit
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Custom meals retrieved successfully",
  "meta": {
    "page": 1,
    "limit": 20,
    "total": 1,
    "totalPage": 1
  },
  "data": [
    {
      "_id": "66d482bf4f1a2345bc789012",
      "user": "66d3f820c741e95642a8b111",
      "name": "Grilled Chicken & Quinoa Bowl",
      "mealType": "Lunch",
      "calorie": 520,
      "protein": 45,
      "carb": 50,
      "fat": 14,
      "image": "uploads/profile-image/chicken-1725192830.jpg",
      "prepTime": "20 mins",
      "ingredients": [
        "200g Chicken Breast",
        "100g Cooked Quinoa",
        "1 cup Steamed Broccoli",
        "1 tbsp Olive Oil"
      ],
      "instructions": "Grill the chicken, boil quinoa, steam broccoli, and mix together with olive oil.",
      "createdAt": "2026-09-01T12:28:00.000Z",
      "updatedAt": "2026-09-01T12:28:00.000Z"
    }
  ]
}
```

---

### 4.2 Add New Custom Meal
- **Route**: `POST {{baseUrl}}/meal/add-custom-meal`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Body Format**: `application/json` OR `multipart/form-data` (with file field `image`)
- **Body Payload**:
```json
{
  "name": "Peanut Butter Banana Protein Oats",
  "mealType": "Breakfast",
  "calorie": 430,
  "protein": 30,
  "carb": 55,
  "fat": 11,
  "prepTime": "10 mins",
  "ingredients": [
    "60g Rolled Oats",
    "1 scoop Whey Protein",
    "1 Banana",
    "1 tbsp Peanut Butter"
  ],
  "instructions": "Cook oats with water, stir in protein powder, and top with banana and peanut butter."
}
```
- **Success Response (201 Created)**:
```json
{
  "statusCode": 201,
  "success": true,
  "message": "Custom meal added successfully",
  "data": {
    "_id": "66d482bf4f1a2345bc789013",
    "user": "66d3f820c741e95642a8b111",
    "name": "Peanut Butter Banana Protein Oats",
    "mealType": "Breakfast",
    "calorie": 430,
    "protein": 30,
    "carb": 55,
    "fat": 11,
    "image": "",
    "prepTime": "10 mins",
    "ingredients": [
      "60g Rolled Oats",
      "1 scoop Whey Protein",
      "1 Banana",
      "1 tbsp Peanut Butter"
    ],
    "instructions": "Cook oats with water, stir in protein powder, and top with banana and peanut butter.",
    "createdAt": "2026-09-01T12:35:00.000Z"
  }
}
```

---

### 4.3 Update Custom Meal
- **Route**: `PATCH {{baseUrl}}/meal/update-custom-meal/:mealId`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Body Format**: `application/json` OR `multipart/form-data`
- **Body Payload**:
```json
{
  "name": "Updated Chicken Quinoa Bowl",
  "calorie": 550,
  "protein": 48
}
```
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Custom meal updated successfully",
  "data": {
    "_id": "66d482bf4f1a2345bc789012",
    "name": "Updated Chicken Quinoa Bowl",
    "calorie": 550,
    "protein": 48
  }
}
```

---

### 4.4 Delete Custom Meal
- **Route**: `DELETE {{baseUrl}}/meal/delete-custom-meal/:mealId`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Custom meal deleted successfully",
  "data": {
    "_id": "66d482bf4f1a2345bc789012"
  }
}
```

---

### 4.5 Log Consumed Meal (Ate Meal)
- **Route**: `PATCH {{baseUrl}}/meal/ate-meal`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "consumedCalorie": 520,
  "consumedProtein": 45,
  "consumedCarb": 50,
  "consumedFat": 14
}
```
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "You have eaten successfully.",
  "data": {
    "_id": "66d3f820c741e95642a8b777",
    "user": "66d3f820c741e95642a8b111",
    "calorieGoal": 2200,
    "consumedCalorie": 1420,
    "consumedProtein": 95,
    "consumedCarb": 130,
    "consumedFat": 38,
    "percentage": 65
  }
}
```

---

### 4.6 Swap Meal
- **Route**: `GET {{baseUrl}}/meal/swap-meal`
- **Auth**: Public
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Meal swapped successfully",
  "data": {}
}
```

---

### 4.7 Filter Meals
- **Route**: `GET {{baseUrl}}/meal/filter-meal`
- **Auth**: Public
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Meal filtered succesfully",
  "data": {}
}
```

---

## 5. Consistency & Progress Tracking

### 5.1 Get User Consistency Details
- **Route**: `GET {{baseUrl}}/consistency/user-consistency-details`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Consistency details retrieved successfully",
  "data": {
    "todayCompleted": {
      "percentage": 65
    },
    "consistency": [
      {
        "completed": 85,
        "createdAt": "2026-08-30T10:00:00.000Z"
      },
      {
        "completed": 70,
        "createdAt": "2026-08-31T10:00:00.000Z"
      }
    ],
    "friendsData": [
      {
        "userId": "66d3f820c741e95642a8b341",
        "name": "Sarah Connor",
        "percentage": 90,
        "image": "uploads/profile-image/sarah.jpg"
      }
    ]
  }
}
```

---

### 5.2 Add User Weight Log
- **Route**: `POST {{baseUrl}}/consistency/add-user-weight`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "weight": 74.8
}
```
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Weight added successfully",
  "data": {
    "_id": "66d482bf4f1a2345bc789099",
    "user": "66d3f820c741e95642a8b111",
    "weight": 74.8,
    "createdAt": "2026-09-01T08:00:00.000Z"
  }
}
```

---

### 5.3 Get User Weight History
- **Route**: `GET {{baseUrl}}/consistency/get-user-weight`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Weight details retrieved successfully",
  "data": [
    {
      "_id": "66d482bf4f1a2345bc789099",
      "weight": 74.8,
      "createdAt": "2026-09-01T08:00:00.000Z"
    },
    {
      "_id": "66d482bf4f1a2345bc789098",
      "weight": 75.5,
      "createdAt": "2026-08-25T08:00:00.000Z"
    }
  ]
}
```

---

### 5.4 Add User Progress Image
- **Route**: `POST {{baseUrl}}/consistency/add-user-image`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Body Format**: `multipart/form-data`
- **Form Data Fields**:
  - `profile-image` *(File, required)*: Progress photo
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Image added successfully",
  "data": {
    "_id": "66d482bf4f1a2345bc789100",
    "user": "66d3f820c741e95642a8b111",
    "url": "uploads/profile-image/progress-1725193200.jpg",
    "createdAt": "2026-09-01T12:40:00.000Z"
  }
}
```

---

### 5.5 Get User Progress Images
- **Route**: `GET {{baseUrl}}/consistency/get-user-image`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Image details retrieved successfully",
  "data": [
    {
      "_id": "66d482bf4f1a2345bc789100",
      "url": "uploads/profile-image/progress-1725193200.jpg",
      "createdAt": "2026-09-01T12:40:00.000Z"
    }
  ]
}
```

---

## 6. Goal Management

### 6.1 Create New Custom Goal
- **Route**: `POST {{baseUrl}}/goal/create-new-goal`
- **Auth**: Public
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "userId": "66d3f820c741e95642a8b111",
  "title": "Drink 3 Liters of Water Daily"
}
```
- **Success Response (201 Created)**:
```json
{
  "statusCode": 201,
  "success": true,
  "message": "New goal created successfully",
  "data": {
    "_id": "66d482bf4f1a2345bc789201",
    "user": "66d3f820c741e95642a8b111",
    "title": "Drink 3 Liters of Water Daily",
    "isCompleted": false,
    "createdAt": "2026-09-01T12:00:00.000Z"
  }
}
```

---

### 6.2 Get All Goals for Current User
- **Route**: `GET {{baseUrl}}/goal/get-all-goal`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "retrieve all goal successfully",
  "data": [
    {
      "_id": "66d482bf4f1a2345bc789201",
      "title": "Drink 3 Liters of Water Daily",
      "isCompleted": false,
      "createdAt": "2026-09-01T12:00:00.000Z"
    },
    {
      "_id": "66d482bf4f1a2345bc789202",
      "title": "10,000 Steps Daily",
      "isCompleted": true,
      "createdAt": "2026-09-01T12:00:00.000Z"
    }
  ]
}
```

---

### 6.3 Mark Goal as Completed
- **Route**: `PATCH {{baseUrl}}/goal/mark-goal-completed`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "goalId": "66d482bf4f1a2345bc789201"
}
```
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Goal marked as completed successfully",
  "data": {
    "completedPercentage": 100,
    "updatedGoal": {
      "_id": "66d482bf4f1a2345bc789201",
      "isCompleted": true
    }
  }
}
```

---

### 6.4 Update Goal Title
- **Route**: `PATCH {{baseUrl}}/goal/update-goal`
- **Auth**: Public
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "goalId": "66d482bf4f1a2345bc789201",
  "title": "Drink 3.5 Liters of Water Daily"
}
```
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Goal updated successfully",
  "data": {
    "_id": "66d482bf4f1a2345bc789201",
    "title": "Drink 3.5 Liters of Water Daily"
  }
}
```

---

### 6.5 Delete Goal
- **Route**: `DELETE {{baseUrl}}/goal/delete-goal/:goalId`
- **Auth**: Public
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Goal deleted successfully",
  "data": {
    "_id": "66d482bf4f1a2345bc789201"
  }
}
```

---

### 6.6 Change Primary Fitness Goal Type
- **Route**: `PATCH {{baseUrl}}/goal/change-goal-type`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "mainGoal": "Body_Recamp"
}
```
*(Options: `"Loose_Weight"`, `"Gain_Weight"`, `"Body_Recamp"`)*
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Goal type changed successfully",
  "data": {
    "mainGoal": "Body_Recamp"
  }
}
```

---

### 6.7 Get Completed Goal Percentage
- **Route**: `GET {{baseUrl}}/goal/completed-goal-percentage`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Goal percentage retrieved successfully",
  "data": {
    "totalGoals": 4,
    "completedGoals": 3,
    "percentage": 75
  }
}
```

---

## 7. Settings, Security & Support

### 7.1 Change Password
- **Route**: `PATCH {{baseUrl}}/settings/change-password`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "oldPassword": "Password123!",
  "newPassword": "NewPassword456!",
  "confirmPassword": "NewPassword456!"
}
```
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Password changed successfully"
}
```

---

### 7.2 Delete My Account
- **Route**: `DELETE {{baseUrl}}/settings/delete-account`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "password": "Password123!"
}
```
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Account deleted successfully"
}
```

---

### 7.3 Get Terms and Conditions
- **Route**: `GET {{baseUrl}}/settings/get-terms`
- **Auth**: Public
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Terms and conditions got successfully",
  "data": {
    "_id": "66d3f820c741e95642a8b301",
    "description": "Welcome to AppCake. By using our fitness and calorie tracking application..."
  }
}
```

---

### 7.4 Update Terms and Conditions (Admin)
- **Route**: `PATCH {{baseUrl}}/settings/update-terms`
- **Auth**: Public
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "description": "Updated terms and conditions content here..."
}
```
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Terms and condition updated successfully",
  "data": {
    "description": "Updated terms and conditions content here..."
  }
}
```

---

### 7.5 Get Privacy Policy
- **Route**: `GET {{baseUrl}}/settings/get-privacy`
- **Auth**: Public
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Privacy policy got successfully",
  "data": {
    "_id": "66d3f820c741e95642a8b302",
    "description": "At AppCake, we are committed to protecting your privacy and health data..."
  }
}
```

---

### 7.6 Update Privacy Policy (Admin)
- **Route**: `PATCH {{baseUrl}}/settings/update-privacy`
- **Auth**: Public
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "description": "Updated privacy policy content here..."
}
```
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Privacy policy updated successfully",
  "data": {
    "description": "Updated privacy policy content here..."
  }
}
```

---

### 7.7 Send Customer Support Email
- **Route**: `POST {{baseUrl}}/settings/send-support-email`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "subject": "Issue with Calorie Calculation",
  "message": "My daily calorie percentage does not update after logging my breakfast."
}
```
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Support email sent successfully"
}
```

---

### 7.8 Get Support Email Configuration
- **Route**: `GET {{baseUrl}}/settings/get-support-email`
- **Auth**: Public
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Support email retrieved successfully",
  "data": {
    "email": "support@appcake.com"
  }
}
```

---

### 7.9 Set Support Email Configuration (Admin)
- **Route**: `PATCH {{baseUrl}}/settings/set-support-email`
- **Auth**: Public
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "email": "help@appcake.com"
}
```
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Support email updated successfully",
  "data": {
    "email": "help@appcake.com"
  }
}
```

---

### 7.10 Report a Problem / Bug
- **Route**: `POST {{baseUrl}}/settings/report-problem`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "subject": "Screen freezing on meal swap",
  "description": "When clicking swap meal repeatedly, the app stops responding."
}
```
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Problem reported successfully",
  "data": {
    "_id": "66d482bf4f1a2345bc789333",
    "user": "66d3f820c741e95642a8b111",
    "subject": "Screen freezing on meal swap",
    "description": "When clicking swap meal repeatedly, the app stops responding.",
    "isSolved": false,
    "createdAt": "2026-09-01T12:00:00.000Z"
  }
}
```

---

### 7.11 Get All Reported Problems (Admin)
- **Route**: `GET {{baseUrl}}/settings/get-all-report`
- **Auth**: Public
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "All reports retrieved successfully",
  "data": [
    {
      "_id": "66d482bf4f1a2345bc789333",
      "subject": "Screen freezing on meal swap",
      "isSolved": false,
      "createdAt": "2026-09-01T12:00:00.000Z"
    }
  ]
}
```

---

### 7.12 Mark Problem Report (Solved / Unsolved)
- **Route**: `PATCH {{baseUrl}}/settings/mark-report`
- **Auth**: Public
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "reportId": "66d482bf4f1a2345bc789333",
  "isSolved": true
}
```
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Report status updated successfully",
  "data": {
    "_id": "66d482bf4f1a2345bc789333",
    "isSolved": true
  }
}
```

---

### 7.13 Two-Factor Authentication — Add Recovery Email
- **Route**: `POST {{baseUrl}}/settings/add-recovery-email`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "email": "john.doe@example.com",
  "recoveryEmail": "john.recovery@example.com"
}
```
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "OTP sent to recovery email",
  "data": {
    "recoveryEmail": "john.recovery@example.com"
  }
}
```

---

### 7.14 Two-Factor Authentication — Verify Recovery Email OTP
- **Route**: `POST {{baseUrl}}/settings/check-recovery-email-otp`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "email": "john.doe@example.com",
  "otp": "123456"
}
```
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Recovery email verified successfully"
}
```

---

### 7.15 Two-Factor Authentication — Activate / Deactivate 2FA
- **Route**: `POST {{baseUrl}}/settings/activate-two-factor`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "isTwoFactor": true
}
```
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Two factor authentication status updated successfully",
  "data": {
    "isTwoFactor": true
  }
}
```

---

## 8. Frequently Asked Questions

### 8.1 Get All FAQs
- **Route**: `GET {{baseUrl}}/faq/get-all-faq`
- **Auth**: Public
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "FAQs retrieved successfully",
  "data": [
    {
      "_id": "66d3f820c741e95642a8b401",
      "question": "How are my daily calories calculated?",
      "answer": "Calories are calculated using the Mifflin-St Jeor equation based on your age, weight, height, and activity level.",
      "createdAt": "2026-08-20T10:00:00.000Z"
    },
    {
      "_id": "66d3f820c741e95642a8b402",
      "question": "Can I swap a suggested meal?",
      "answer": "Yes, tap the swap button on any meal card to get an alternate option matching your target macros.",
      "createdAt": "2026-08-20T10:00:00.000Z"
    }
  ]
}
```

---

### 8.2 Create New FAQ (Admin)
- **Route**: `POST {{baseUrl}}/faq/create-faq`
- **Auth**: Public
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "question": "How do I add friends in AppCake?",
  "answer": "Go to the Community screen, tap Add Friend, and browse through friend suggestions or search by name."
}
```
- **Success Response (201 Created)**:
```json
{
  "statusCode": 201,
  "success": true,
  "message": "FAQ created successfully",
  "data": {
    "_id": "66d482bf4f1a2345bc789405",
    "question": "How do I add friends in AppCake?",
    "answer": "Go to the Community screen, tap Add Friend, and browse through friend suggestions or search by name."
  }
}
```

---

### 8.3 Update FAQ (Admin)
- **Route**: `PATCH {{baseUrl}}/faq/update-faq`
- **Auth**: Public
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "faqId": "66d482bf4f1a2345bc789405",
  "question": "How do I connect with friends in AppCake?",
  "answer": "Navigate to the Community tab, tap Add Friend, and view recommendations."
}
```
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "FAQ updated successfully",
  "data": {
    "_id": "66d482bf4f1a2345bc789405",
    "question": "How do I connect with friends in AppCake?",
    "answer": "Navigate to the Community tab, tap Add Friend, and view recommendations."
  }
}
```

---

### 8.4 Delete FAQ (Admin)
- **Route**: `DELETE {{baseUrl}}/faq/delete-faq/:faqId`
- **Auth**: Public
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "FAQ deleted successfully",
  "data": {
    "_id": "66d482bf4f1a2345bc789405"
  }
}
```

---

## 9. Notifications

### 9.1 Get All Notifications
- **Route**: `GET {{baseUrl}}/notification/get-all-notification`
- **Auth**: `Bearer <USER_JWT_TOKEN>`
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Notifications retrieved successfully",
  "data": [
    {
      "_id": "66d482bf4f1a2345bc789501",
      "user": "66d3f820c741e95642a8b111",
      "title": "Friend Request Accepted!",
      "message": "Sarah Connor accepted your friend request.",
      "isRead": false,
      "createdAt": "2026-09-01T11:30:00.000Z"
    },
    {
      "_id": "66d482bf4f1a2345bc789502",
      "user": "66d3f820c741e95642a8b111",
      "title": "Daily Goal Milestone",
      "message": "You completed 100% of your daily calorie goal today!",
      "isRead": true,
      "createdAt": "2026-08-31T20:00:00.000Z"
    }
  ]
}
```

---

### 9.2 Delete Notification
- **Route**: `DELETE {{baseUrl}}/notification/delete-notification/:notificationId`
- **Auth**: Public
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Notification deleted successfully",
  "data": {
    "_id": "66d482bf4f1a2345bc789501"
  }
}
```

---

## 10. Admin & Dashboard Management

### 10.1 Get Dashboard Overview Stats
- **Route**: `GET {{baseUrl}}/dashboard/dashboard-data`
- **Auth**: Public
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Dashboard data retrieved successfully",
  "data": {
    "totalUsers": 1250,
    "activeUsers": 840,
    "totalMealsLogged": 45200,
    "totalFriendsConnected": 1920
  }
}
```

---

### 10.2 Block / Unblock User
- **Route**: `POST {{baseUrl}}/dashboard/block-user`
- **Auth**: Public
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "userId": "66d3f820c741e95642a8b111"
}
```
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "User blocked successfully",
  "data": {
    "_id": "66d3f820c741e95642a8b111",
    "isBlocked": true
  }
}
```

---

### 10.3 Add New Admin
- **Route**: `POST {{baseUrl}}/dashboard/add-admin`
- **Auth**: `Bearer <SUPER_ADMIN_JWT_TOKEN>`
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "name": "Alex Smith",
  "email": "alex.admin@appcake.com",
  "password": "SecurePassword123!",
  "role": "Admin"
}
```
- **Success Response (201 Created)**:
```json
{
  "statusCode": 201,
  "success": true,
  "message": "Admin added successfully",
  "data": {
    "_id": "66d482bf4f1a2345bc789601",
    "name": "Alex Smith",
    "email": "alex.admin@appcake.com",
    "role": "Admin"
  }
}
```

---

### 10.4 Update Admin Profile Picture
- **Route**: `PATCH {{baseUrl}}/dashboard/update-admin-profile`
- **Auth**: Public
- **Body Format**: `multipart/form-data`
- **Form Data Fields**:
  - `admin-image` *(File, optional)*: Image file
  - `name` *(Text, optional)*: Admin full name
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Admin profile updated successfully",
  "data": {
    "image": "uploads/admin-image/admin-1725193400.jpg"
  }
}
```

---

### 10.5 Delete Admin
- **Route**: `DELETE {{baseUrl}}/dashboard/delete-admin/:adminId`
- **Auth**: `Bearer <SUPER_ADMIN_JWT_TOKEN>`
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Admin deleted successfully",
  "data": {
    "_id": "66d482bf4f1a2345bc789601"
  }
}
```

---

### 10.6 Get All Admins
- **Route**: `GET {{baseUrl}}/dashboard/get-all-admin`
- **Auth**: Public
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "All admins retrieved successfully",
  "data": [
    {
      "_id": "66d482bf4f1a2345bc789601",
      "name": "Alex Smith",
      "email": "alex.admin@appcake.com",
      "role": "Admin"
    }
  ]
}
```

---

### 10.7 Get All App Users
- **Route**: `GET {{baseUrl}}/dashboard/get-all-user`
- **Auth**: Public
- **Query Parameters**:
  - `page` *(optional)*: Page number
  - `limit` *(optional)*: Page limit
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "All users retrieved successfully",
  "data": [
    {
      "_id": "66d3f820c741e95642a8b111",
      "name": "John Doe",
      "email": "john.doe@example.com",
      "mainGoal": "Loose_Weight",
      "isBlocked": false,
      "createdAt": "2026-08-20T10:00:00.000Z"
    }
  ]
}
```

---

### 10.8 Search Users (Admin)
- **Route**: `GET {{baseUrl}}/dashboard/search-user?search=john`
- **Auth**: Public
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Users searched successfully",
  "data": [
    {
      "_id": "66d3f820c741e95642a8b111",
      "name": "John Doe",
      "email": "john.doe@example.com"
    }
  ]
}
```

---

### 10.9 Get Single User Details (Admin)
- **Route**: `GET {{baseUrl}}/dashboard/get-single-user/:userId`
- **Auth**: Public
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "User details retrieved successfully",
  "data": {
    "_id": "66d3f820c741e95642a8b111",
    "name": "John Doe",
    "email": "john.doe@example.com",
    "age": 28,
    "gender": "Male",
    "height": 178,
    "mainGoal": "Loose_Weight",
    "activityLevel": "Active",
    "foodVibe": "None",
    "isBlocked": false
  }
}
```

---

### 10.10 Admin Change Password
- **Route**: `PATCH {{baseUrl}}/dashboard/admin-change-password`
- **Auth**: `Bearer <USER_JWT_TOKEN>` (or Admin Token)
- **Headers**: `Content-Type: application/json`
- **Body Payload**:
```json
{
  "oldPassword": "AdminPassword123!",
  "newPassword": "NewAdminPassword456!",
  "confirmPassword": "NewAdminPassword456!"
}
```
- **Success Response (200 OK)**:
```json
{
  "statusCode": 200,
  "success": true,
  "message": "Admin password changed successfully"
}
```
