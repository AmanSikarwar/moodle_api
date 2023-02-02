import 'package:equatable/equatable.dart';

import 'exceptions.dart';
import '../utils/constants.dart';

class EmailAddress extends Equatable {
  const EmailAddress._(this.value);

  final String value;

  factory EmailAddress(String input) =>
      EmailAddress._(_validateEmailAddress(input));

  static String _validateEmailAddress(String input) {
    const emailRegex = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    if (RegExp(emailRegex).hasMatch(input)) {
      return input;
    } else {
      throw InvalidEmailError(ErrorMessages.invalidEmail);
    }
  }

  bool get isValid =>
      RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(value);

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'EmailAddress(value: $value)';
}
