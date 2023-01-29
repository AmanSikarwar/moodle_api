abstract class ValueError<T> {
  final String message;
  const ValueError(this.message);
}

class UnexpectedValueError extends ValueError {
  UnexpectedValueError(ValueError error)
      : super(_mapErrorToMessage(error));
  static String _mapErrorToMessage(ValueError error) {
    return error.message;
  }
}

class InvalidInputError extends ValueError<String> {
  InvalidInputError(String message) : super(message);
}

class InvalidTokenError extends ValueError<String> {
  InvalidTokenError(String message) : super(message);
}

class InvalidUrlError extends ValueError<String> {
  InvalidUrlError(String message) : super(message);
}

class InvalidServiceError extends ValueError<String> {
  InvalidServiceError(String message) : super(message);
}

class InvalidUsernameError extends ValueError<String> {
  InvalidUsernameError(String message) : super(message);
}

class InvalidPasswordError extends ValueError<String> {
  InvalidPasswordError(String message) : super(message);
}

class InvalidResponseError extends ValueError<String> {
  InvalidResponseError(String message) : super(message);
}

class InvalidEmailError extends ValueError<String> {
  InvalidEmailError(String message) : super(message);
}
