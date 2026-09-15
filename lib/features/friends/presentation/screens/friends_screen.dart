import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/route_paths.dart';
import '../controllers/friends_state.dart';
import '../providers/friends_provider.dart';
import '../widgets/friend_card.dart';
import '../widgets/friend_request_card.dart';
import '../widgets/friend_suggestion_card.dart';

class FriendsScreen extends ConsumerStatefulWidget {
  const FriendsScreen({super.key});

  @override
  ConsumerState<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends ConsumerState<FriendsScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final TextEditingController _searchController;
  late final ScrollController _suggestionsScrollController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);

    _searchController = TextEditingController();

    _suggestionsScrollController = ScrollController()
      ..addListener(_onSuggestionsScroll);

    Future.microtask(_loadInitialData);
  }

  Future<void> _loadInitialData() async {
    final controller = ref.read(friendsControllerProvider.notifier);

    await Future.wait([
      controller.loadSuggestions(),
      controller.loadFriends(),
      controller.loadFriendRequests(),
    ]);
  }

  void _onSuggestionsScroll() {
    if (!_suggestionsScrollController.hasClients) {
      return;
    }

    final position = _suggestionsScrollController.position;

    if (position.pixels >= position.maxScrollExtent - 300) {
      ref
          .read(friendsControllerProvider.notifier)
          .loadSuggestions(loadMore: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(friendsControllerProvider);

    ref.listen<FriendsState>(friendsControllerProvider, (previous, next) {
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
      appBar: AppBar(
        title: const Text('Friends'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            const Tab(text: 'Suggestions'),
            Tab(text: 'Friends (${state.friends.length})'),
            Tab(text: 'Requests (${state.requests.length})'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildSuggestions(state),
          _buildFriends(state),
          _buildRequests(state),
        ],
      ),
    );
  }

  Widget _buildSuggestions(FriendsState state) {
    return RefreshIndicator(
      onRefresh: () {
        return ref.read(friendsControllerProvider.notifier).loadSuggestions();
      },
      child: CustomScrollView(
        controller: _suggestionsScrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  ref.read(friendsControllerProvider.notifier).search(value);
                },
                decoration: InputDecoration(
                  hintText: 'Search friends',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _searchController.text.isEmpty
                      ? null
                      : IconButton(
                          onPressed: () {
                            _searchController.clear();

                            ref
                                .read(friendsControllerProvider.notifier)
                                .search('');

                            setState(() {});
                          },
                          icon: const Icon(Icons.clear),
                        ),
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
          ),
          if (state.status == FriendsStatus.loading &&
              state.suggestions.isEmpty)
            const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            )
          else if (state.suggestions.isEmpty)
            const SliverFillRemaining(
              child: Center(child: Text('No friend suggestions found')),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              sliver: SliverList.separated(
                itemCount:
                    state.suggestions.length + (state.isLoadingMore ? 1 : 0),
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  if (index >= state.suggestions.length) {
                    return const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  final suggestion = state.suggestions[index];

                  return FriendSuggestionCard(
                    suggestion: suggestion,
                    isLoading: state.sendingRequestId == suggestion.userId,
                    onAdd: () async {
                      await ref
                          .read(friendsControllerProvider.notifier)
                          .sendFriendRequest(receiverId: suggestion.userId);
                    },
                    onTap: () {
                      // Navigation to detail can be connected here.

                      context.pushNamed(
                        AppRoutes.friendDetail,
                        pathParameters: {'userId': suggestion.userId},
                      );
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFriends(FriendsState state) {
    return RefreshIndicator(
      onRefresh: () {
        return ref.read(friendsControllerProvider.notifier).loadFriends();
      },
      child: state.isLoadingFriends && state.friends.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : state.friends.isEmpty
          ? ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: const [
                SizedBox(height: 250),
                Center(child: Text('No friends yet')),
              ],
            )
          : ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: state.friends.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final friend = state.friends[index];

                return FriendCard(
                  friend: friend,
                  isUnfriending: state.unfriendingId == friend.friendId,
                  onTap: () {
                    // Navigation to detail can be connected here.

                    context.pushNamed(
                      AppRoutes.friendDetail,
                      pathParameters: {'userId': friend.friendId},
                    );
                  },
                  onUnfriend: () async {
                    await ref
                        .read(friendsControllerProvider.notifier)
                        .unfriend(friendId: friend.friendId);
                  },
                );
              },
            ),
    );
  }

  Widget _buildRequests(FriendsState state) {
    return RefreshIndicator(
      onRefresh: () {
        return ref
            .read(friendsControllerProvider.notifier)
            .loadFriendRequests();
      },
      child: state.isLoadingRequests && state.requests.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : state.requests.isEmpty
          ? ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: const [
                SizedBox(height: 250),
                Center(child: Text('No friend requests')),
              ],
            )
          : ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: state.requests.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final request = state.requests[index];

                return FriendRequestCard(
                  request: request,
                  isAccepting: state.acceptingRequestId == request.senderId,
                  isRejecting: state.rejectingRequestId == request.senderId,
                  onAccept: () async {
                    await ref
                        .read(friendsControllerProvider.notifier)
                        .acceptFriendRequest(friendId: request.senderId);
                  },
                  onReject: () async {
                    await ref
                        .read(friendsControllerProvider.notifier)
                        .rejectFriendRequest(friendId: request.senderId);
                  },
                );
              },
            ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    _suggestionsScrollController.dispose();
    super.dispose();
  }
}
