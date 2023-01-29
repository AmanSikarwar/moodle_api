import 'package:fpdart/fpdart.dart';
import 'package:moodle_api/src/models/value_object.dart';

import 'errors/value_error.dart';

class Username extends ValueObject<String> {
  @override
  final Either<ValueError<String>, String> value;

  factory Username(String input) {
    return Username._(
      validateUsername(input),
    );
  }

  const Username._(this.value);

  static Either<ValueError<String>, String> validateUsername(
      String input) {
    if (input.length >= 3) {
      return right(input);
    } else {
      return left(InvalidUsernameError(
          'Username must be at least 3 characters'));
    }
  }
}
