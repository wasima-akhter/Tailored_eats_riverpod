import '../../domain/entities/progress_image.dart';

class ProgressImageModel {
  final String id;
  final String url;
  final DateTime createdAt;

  const ProgressImageModel({
    required this.id,
    required this.url,
    required this.createdAt,
  });

  factory ProgressImageModel.fromJson(Map<String, dynamic> json) {
    return ProgressImageModel(
      id: json['_id']?.toString() ?? '',
      url: json['url']?.toString() ?? '',
      createdAt: _parseDateTime(json['createdAt']),
    );
  }

  ProgressImage toEntity() {
    return ProgressImage(id: id, url: url, createdAt: createdAt);
  }

  static DateTime _parseDateTime(dynamic value) {
    return DateTime.tryParse(value?.toString() ?? '') ??
        DateTime.fromMillisecondsSinceEpoch(0);
  }
}
