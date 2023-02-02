import 'dart:convert';

import 'package:http/http.dart' as http;

import '../moodle_api.dart';

class MoodleApiClient {
  final BaseUrl _baseUrl;
  final WSToken _token;
  final String _service;
  final http.Client _client;

  MoodleApiClient({
    required BaseUrl baseUrl,
    required WSToken token,
    String? service,
    http.Client? client,
  })  : _baseUrl = baseUrl,
        _token = token,
        _service = service ?? defaultService,
        _client = client ?? http.Client();

  WSToken? get token => _token;

  String? get service => _service;

  http.Client? get client => _client;

  Future<SiteInfo> getSiteInfo() async {
    final response = await http.post(
      Uri.parse('${_baseUrl.value}${EndPoints.apiEndpoint}'),
      body: {
        'wstoken': _token.value,
        'wsfunction': WSFunctions.coreWebGetSiteInfo,
        'moodlewsrestformat': 'json',
      },
    );
    switch (response.statusCode) {
      case HttpStatus.ok:
        try {
          final siteInfo = SiteInfo.fromJson(jsonDecode(response.body));
          return siteInfo;
        } catch (e) {
          throw InvalidResponseError('Failed to parse site info');
        }
      case HttpStatus.unauthorized:
        throw InvalidCredentialsError('Invalid username or password');
      default:
        throw InvalidResponseError('Unable to get user info');
    }
  }
}
