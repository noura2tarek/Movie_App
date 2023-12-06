// Make this model to know that there is an error while receiving the data
import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;

  const ErrorMessageModel({
    required this.statusCode,
    required this.statusMessage,
    required this.success,
  });

  @override
  List<Object?> get props => [
        statusCode,
        statusMessage,
        success,
      ];

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      statusCode: json["status_code"],
      statusMessage: json["status_message"],
      success: json["success"],
    );
  }
}
