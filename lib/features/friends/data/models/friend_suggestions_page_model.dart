import 'friend_suggestion_model.dart';
import '../../domain/entities/friend_suggestions_page.dart';

class FriendSuggestionsPageModel {
  final List<FriendSuggestionModel> suggestions;
  final int page;
  final int limit;
  final int total;
  final int totalPage;

  const FriendSuggestionsPageModel({
    required this.suggestions,
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPage,
  });

  factory FriendSuggestionsPageModel.fromJson(Map<String, dynamic> json) {
    final items = json['items'];

    return FriendSuggestionsPageModel(
      suggestions: items is List
          ? items
                .whereType<Map<String, dynamic>>()
                .map(FriendSuggestionModel.fromJson)
                .toList()
          : const [],
      page: _parseInt(json['page']),
      limit: _parseInt(json['limit']),
      total: _parseInt(json['total']),
      totalPage: _parseInt(json['totalPage']),
    );
  }

  FriendSuggestionsPage toEntity() {
    return FriendSuggestionsPage(
      suggestions: suggestions.map((item) => item.toEntity()).toList(),
      page: page,
      limit: limit,
      total: total,
      totalPage: totalPage,
    );
  }

  static int _parseInt(dynamic value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value?.toString() ?? '') ?? 0;
  }
}
