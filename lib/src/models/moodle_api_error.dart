import 'package:equatable/equatable.dart';

class MoodleApiError extends Equatable {
  MoodleApiError({
    required this.error,
    required this.stacktrace,
    required this.debuginfo,
    required this.reproductionlink,
  });

  final String? error;
  final dynamic stacktrace;
  final dynamic debuginfo;
  final dynamic reproductionlink;

  factory MoodleApiError.fromJson(Map<String, dynamic> json) {
    return MoodleApiError(
      error: json["error"],
      stacktrace: json["stacktrace"],
      debuginfo: json["debuginfo"],
      reproductionlink: json["reproductionlink"],
    );
  }

  @override
  String toString() {
    return "$error, $stacktrace, $debuginfo, $reproductionlink, ";
  }

  @override
  List<Object?> get props => [
        error,
        stacktrace,
        debuginfo,
        reproductionlink,
      ];
}
