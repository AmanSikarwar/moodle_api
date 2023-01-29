import 'package:fpdart/fpdart.dart';

import 'errors/value_error.dart';
import 'value_object.dart';

class Password extends ValueObject<String> {
  @override
  final Either<ValueError<String>, String> value;

  factory Password(String input) {
    return Password._(
      validatePassword(input),
    );
  }
  const Password._(this.value);

  static Either<ValueError<String>, String> validatePassword(
      String input) {
    if (input.length >= 6) {
      return right(input);
    } else {
      return left(InvalidPasswordError(
          'Password must be at least 6 characters'));
    }
  }
}
