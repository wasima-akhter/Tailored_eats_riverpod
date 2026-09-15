import '../../domain/entities/custom_meal.dart';

class CustomMealsState {
  final List<CustomMeal> meals;

  final bool isLoading;
  final bool isLoadingMore;
  final bool isSubmitting;
  final bool isDeleting;

  final String? errorMessage;

  final int page;
  final int totalPage;
  final bool hasMore;

  final String? selectedMealType;
  final String search;

  final String? processingMealId;

  const CustomMealsState({
    this.meals = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.isSubmitting = false,
    this.isDeleting = false,
    this.errorMessage,
    this.page = 1,
    this.totalPage = 1,
    this.hasMore = false,
    this.selectedMealType,
    this.search = '',
    this.processingMealId,
  });

  CustomMealsState copyWith({
    List<CustomMeal>? meals,
    bool? isLoading,
    bool? isLoadingMore,
    bool? isSubmitting,
    bool? isDeleting,
    String? errorMessage,
    bool clearError = false,
    int? page,
    int? totalPage,
    bool? hasMore,
    String? selectedMealType,
    bool clearMealType = false,
    String? search,
    String? processingMealId,
    bool clearProcessingMealId = false,
  }) {
    return CustomMealsState(
      meals: meals ?? this.meals,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isDeleting: isDeleting ?? this.isDeleting,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      page: page ?? this.page,
      totalPage: totalPage ?? this.totalPage,
      hasMore: hasMore ?? this.hasMore,
      selectedMealType: clearMealType
          ? null
          : selectedMealType ?? this.selectedMealType,
      search: search ?? this.search,
      processingMealId: clearProcessingMealId
          ? null
          : processingMealId ?? this.processingMealId,
    );
  }
}
