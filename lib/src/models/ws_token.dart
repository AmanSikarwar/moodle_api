import 'package:equatable/equatable.dart';

import 'exceptions.dart';
import '../utils/constants.dart';

class WSToken extends Equatable {
  const WSToken._(this.value);

  final String value;

  factory WSToken(String input) => WSToken._(_validateWSToken(input));

  static String _validateWSToken(String input) {
    if (input.length >= 32) {
      return input;
    } else {
      throw InvalidTokenError(ErrorMessages.invalidToken);
    }
  }

  bool get isValid => value.length >= 32;

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'WSToken(value: $value)';

  factory WSToken.fromJson(Map<String, dynamic> json) {
    return WSToken(json['token']);
  }
}
