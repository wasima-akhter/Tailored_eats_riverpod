enum PendingActionType { create, update, delete }

class PendingAction {
  final String id;
  final String endpoint;
  final String method;
  final PendingActionType type;
  final Map<String, dynamic>? data;
  final Map<String, dynamic>? queryParameters;
  final int retryCount;
  final DateTime createdAt;

  const PendingAction({
    required this.id,
    required this.endpoint,
    required this.method,
    required this.type,
    this.data,
    this.queryParameters,
    this.retryCount = 0,
    required this.createdAt,
  });

  PendingAction copyWith({
    String? id,
    String? endpoint,
    String? method,
    PendingActionType? type,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    int? retryCount,
    DateTime? createdAt,
  }) {
    return PendingAction(
      id: id ?? this.id,
      endpoint: endpoint ?? this.endpoint,
      method: method ?? this.method,
      type: type ?? this.type,
      data: data ?? this.data,
      queryParameters: queryParameters ?? this.queryParameters,
      retryCount: retryCount ?? this.retryCount,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'endpoint': endpoint,
      'method': method,
      'type': type.name,
      'data': data,
      'queryParameters': queryParameters,
      'retryCount': retryCount,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory PendingAction.fromJson(Map<String, dynamic> json) {
    return PendingAction(
      id: json['id'] as String,
      endpoint: json['endpoint'] as String,
      method: json['method'] as String,
      type: PendingActionType.values.firstWhere(
        (value) => value.name == json['type'],
        orElse: () => PendingActionType.create,
      ),
      data: json['data'] != null
          ? Map<String, dynamic>.from(json['data'] as Map)
          : null,
      queryParameters: json['queryParameters'] != null
          ? Map<String, dynamic>.from(json['queryParameters'] as Map)
          : null,
      retryCount: json['retryCount'] as int? ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }
}
