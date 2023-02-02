import 'package:equatable/equatable.dart';

import 'exceptions.dart';
import '../utils/constants.dart';

class Username extends Equatable {
  const Username._(this.value);

  final String value;

  factory Username(String input) =>
      Username._(_validateUsername(input));

  static String _validateUsername(String input) {
    if (input.length >= 3) {
      return input;
    } else {
      throw InvalidUsernameError(ErrorMessages.invalidUsername);
    }
  }

  bool get isValid => value.length >= 3;

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'Username(value: $value)';
}
