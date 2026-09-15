// lib/features/custom_meals/presentation/screens/custom_meals_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/route_paths.dart';
import '../../domain/entities/custom_meal.dart';
import '../controllers/custom_meals_state.dart';
import '../providers/custom_meals_provider.dart';
import '../widgets/custom_meal_card.dart';

class CustomMealsScreen extends ConsumerStatefulWidget {
  const CustomMealsScreen({super.key});

  @override
  ConsumerState<CustomMealsScreen> createState() => _CustomMealsScreenState();
}

class _CustomMealsScreenState extends ConsumerState<CustomMealsScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  static const _mealTypes = <String>[
    'Breakfast',
    'Lunch',
    'Dinner',
    'Snack',
    'Other',
  ];

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);

    Future.microtask(() {
      ref.read(customMealsControllerProvider.notifier).loadMeals(refresh: true);
    });
  }

  void _onScroll() {
    if (!_scrollController.hasClients) {
      return;
    }

    final position = _scrollController.position;

    if (position.pixels >= position.maxScrollExtent - 300) {
      ref.read(customMealsControllerProvider.notifier).loadMore();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(customMealsControllerProvider);

    ref.listen<CustomMealsState>(customMealsControllerProvider, (
      previous,
      next,
    ) {
      if (!mounted) {
        return;
      }

      if (next.errorMessage != null &&
          next.errorMessage != previous?.errorMessage) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.errorMessage!)));
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('My Meals')),
      body: _buildBody(state),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _onAddMeal,
        icon: const Icon(Icons.add),
        label: const Text('Add Meal'),
      ),
    );
  }

  Widget _buildBody(CustomMealsState state) {
    if (state.isLoading && state.meals.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return RefreshIndicator(
      onRefresh: () {
        return ref.read(customMealsControllerProvider.notifier).refresh();
      },
      child: CustomScrollView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: _buildHeader()),
          SliverToBoxAdapter(child: _buildFilters(state)),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          if (state.meals.isEmpty)
            SliverFillRemaining(hasScrollBody: false, child: _buildEmptyState())
          else
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 110),
              sliver: SliverList.separated(
                itemCount: state.meals.length + (state.isLoadingMore ? 1 : 0),
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  if (index >= state.meals.length) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  final meal = state.meals[index];

                  return CustomMealCard(
                    meal: meal,
                    isDeleting:
                        state.processingMealId == meal.id && state.isDeleting,
                    onTap: () => _onMealTap(meal),
                    onEdit: () => _onEditMeal(meal),
                    onDelete: () => _onDeleteMeal(meal),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your custom meals',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Manage the meals you have created and saved.',
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _searchController,
            textInputAction: TextInputAction.search,
            onChanged: (value) {
              ref.read(customMealsControllerProvider.notifier).search(value);
            },
            decoration: InputDecoration(
              hintText: 'Search meals',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _searchController.text.isEmpty
                  ? null
                  : IconButton(
                      onPressed: () {
                        _searchController.clear();
                        ref
                            .read(customMealsControllerProvider.notifier)
                            .search('');
                        setState(() {});
                      },
                      icon: const Icon(Icons.clear),
                    ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters(CustomMealsState state) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return SizedBox(
      height: 44,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: _mealTypes.length + 1,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final value = index == 0 ? null : _mealTypes[index - 1];

          final selected = state.selectedMealType == value;

          return FilterChip(
            selected: selected,
            label: Text(value ?? 'All'),
            avatar: value == null
                ? const Icon(Icons.restaurant_menu_outlined, size: 17)
                : null,
            onSelected: (_) {
              ref
                  .read(customMealsControllerProvider.notifier)
                  .filterByMealType(value);
            },
            selectedColor: colors.primaryContainer,
            checkmarkColor: colors.onPrimaryContainer,
            labelStyle: TextStyle(
              color: selected ? colors.onPrimaryContainer : colors.onSurface,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final state = ref.read(customMealsControllerProvider);

    final hasFilters =
        state.search.trim().isNotEmpty || state.selectedMealType != null;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              hasFilters
                  ? Icons.search_off_rounded
                  : Icons.restaurant_menu_outlined,
              size: 56,
              color: colors.primary,
            ),
            const SizedBox(height: 16),
            Text(
              hasFilters ? 'No meals found' : 'No custom meals yet',
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              hasFilters
                  ? 'Try a different search or meal type.'
                  : 'Create your first custom meal to see it here.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            if (!hasFilters) ...[
              const SizedBox(height: 20),
              FilledButton.icon(
                onPressed: _onAddMeal,
                icon: const Icon(Icons.add),
                label: const Text('Create Meal'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // Update the TODO methods inside CustomMealsScreen

  void _onAddMeal() {
    context.pushNamed(AppRoutes.addCustomMeal);
  }

  void _onMealTap(CustomMeal meal) {
    context.pushNamed(AppRoutes.customMealDetails, extra: meal);
  }

  void _onEditMeal(CustomMeal meal) {
    context.pushNamed(AppRoutes.editCustomMeal, extra: meal);
  }

  Future<void> _onDeleteMeal(CustomMeal meal) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        final theme = Theme.of(context);

        return AlertDialog(
          title: const Text('Delete meal?'),
          content: Text('Are you sure you want to delete "${meal.name}"?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Cancel'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: theme.colorScheme.error,
                foregroundColor: theme.colorScheme.onError,
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );

    if (confirmed != true || !mounted) {
      return;
    }

    await ref.read(customMealsControllerProvider.notifier).removeMeal(meal.id);
  }
}
