import 'package:equatable/equatable.dart';

abstract class MoodleApiException extends Equatable
    implements Exception {
  final String? debugInfo;
  final String message;

  MoodleApiException(this.message, {this.debugInfo});

  @override
  String toString() {
    return 'MoodleApiException{message: $message \n debugInfo: $debugInfo}';
  }

  @override
  List<Object> get props => [message, debugInfo!];
}

class InvalidUrlError extends MoodleApiException {
  InvalidUrlError(String message) : super(message);
}

class InvalidInputError extends MoodleApiException {
  InvalidInputError(String message) : super(message);
}

class InvalidTokenError extends MoodleApiException {
  InvalidTokenError(String message) : super(message);
}

class InvalidResponseError extends MoodleApiException {
  InvalidResponseError(String message) : super(message);
}

class InvalidCredentialsError extends MoodleApiException {
  InvalidCredentialsError(String message) : super(message);
}

class InvalidEmailError extends MoodleApiException {
  InvalidEmailError(String message) : super(message);
}

class InvalidUsernameError extends MoodleApiException {
  InvalidUsernameError(String message) : super(message);
}

class InvalidPasswordError extends MoodleApiException {
  InvalidPasswordError(String message) : super(message);
}

class UnknownError extends MoodleApiException {
  UnknownError(String message) : super(message);
}
