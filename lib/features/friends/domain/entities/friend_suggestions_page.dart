import 'friend_suggestion.dart';

class FriendSuggestionsPage {
  final List<FriendSuggestion> suggestions;
  final int page;
  final int limit;
  final int total;
  final int totalPage;

  const FriendSuggestionsPage({
    required this.suggestions,
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPage,
  });
}
