import 'package:equatable/equatable.dart';

import 'exceptions.dart';
import '../utils/constants.dart';

class BaseUrl extends Equatable {
  const BaseUrl._(this.value);

  final String value;

  factory BaseUrl(String input) => BaseUrl._(_validateBaseUrl(input));

  static String _validateBaseUrl(String url) {
    if (url.isEmpty) {
      throw InvalidUrlError(ErrorMessages.emptyUrl);
    } else if (!url.startsWith("https://") ||
        url.startsWith("http://")) {
      throw InvalidUrlError(ErrorMessages.urlHostMissing);
    } else {
      return url;
    }
  }

  bool get isValid {
    try {
      _validateBaseUrl(value);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  String toString() => 'BaseUrl(value: $value)';

  @override
  List<Object> get props => [value];
}
