import '../../domain/entities/consistency_summary.dart';

class ConsistencyState {
  final ConsistencySummary? summary;
  final bool isLoading;
  final bool isRefreshing;
  final String? summaryError;

  const ConsistencyState({
    this.summary,
    this.isLoading = false,
    this.isRefreshing = false,
    this.summaryError,
  });

  bool get hasSummary => summary != null;

  ConsistencyState copyWith({
    ConsistencySummary? summary,
    bool? isLoading,
    bool? isRefreshing,
    String? summaryError,
    bool clearSummary = false,
    bool clearSummaryError = false,
  }) {
    return ConsistencyState(
      summary: clearSummary ? null : summary ?? this.summary,
      isLoading: isLoading ?? this.isLoading,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      summaryError: clearSummaryError
          ? null
          : summaryError ?? this.summaryError,
    );
  }
}
