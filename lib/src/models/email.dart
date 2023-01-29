import 'package:fpdart/fpdart.dart';

import 'errors/value_error.dart';
import 'value_object.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueError<String>, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);

  static Either<ValueError<String>, String> validateEmailAddress(
      String input) {
    const emailRegex = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    if (RegExp(emailRegex).hasMatch(input)) {
      return right(input);
    } else {
      return left(InvalidEmailError('Invalid email address'));
    }
  }
}
