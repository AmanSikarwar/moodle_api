import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

import 'models/errors/value_error.dart';
import 'models/ws_token.dart';

class MoodleApiClient {
  final String _baseUrl;
  final WSToken _token;
  final String _service;

  MoodleApiClient({
    required String baseUrl,
    required WSToken token,
    String? service,
  })  : _baseUrl = baseUrl,
        _token = token,
        _service = service ?? 'moodle_mobile_app';

  WSToken? get token => _token;

  String? get service => _service;

  TaskEither<ValueError<String>, http.Response> getUserInfo() =>
      TaskEither<ValueError<String>, http.Response>(
        () async {
          final response = await http.post(
            Uri.parse('$_baseUrl/webservice/rest/server.php'),
            body: {
              'wstoken': _token.getOrCrash(),
              'wsfunction': 'core_webservice_get_site_info',
              'moodlewsrestformat': 'json',
            },
          );
          print(_token.getOrCrash());
          if (response.statusCode == 200) {
            return right(response);
          } else {
            return left(InvalidInputError('Invalid token'));
          }
        },
      );
}
