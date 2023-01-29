import 'package:fpdart/fpdart.dart';

import 'errors/value_error.dart';
import 'value_object.dart';

class WSToken extends ValueObject<String> {
  @override
  final Either<ValueError<String>, String> value;

  factory WSToken(String input) {
    return WSToken._(
      validateWSToken(input),
    );
  }

  const WSToken._(this.value);

  static Either<ValueError<String>, String> validateWSToken(
      String input) {
    if (input.isNotEmpty) {
      return right(input);
    } else {
      return left(InvalidTokenError('WSToken cannot be empty'));
    }
  }

  factory WSToken.fromJson(Map<String, dynamic> json) {
    return WSToken(json['token']);
  }
}
