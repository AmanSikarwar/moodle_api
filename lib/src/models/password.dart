import 'package:equatable/equatable.dart';

import 'exceptions.dart';
import '../utils/constants.dart';

class Password extends Equatable {
  const Password._(this.value);

  final String value;

  factory Password(String input) =>
      Password._(_validatePassword(input));

  static String _validatePassword(String input) {
    if (input.length >= 6) {
      return input;
    } else {
      throw InvalidPasswordError(ErrorMessages.invalidPassword);
    }
  }

  bool get isValid => value.length >= 6;

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'Password(value: $value)';
}
