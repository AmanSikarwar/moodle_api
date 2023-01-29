import 'package:fpdart/fpdart.dart';
import 'package:moodle_api/src/models/errors/value_error.dart';

abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueError<T>, T> get value;
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((l) => throw UnexpectedValueError(l), (r) => r);
  }

  Either<ValueError<dynamic>, Unit> get errorOrUnit {
    return value.fold(
      (e) => left(e),
      (r) => right(unit),
    );
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'ValueObject(value: $value)';
}
