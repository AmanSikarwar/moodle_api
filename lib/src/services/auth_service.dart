import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/base_url.dart';
import '../models/email.dart';
import '../models/exceptions.dart';
import '../models/password.dart';
import '../models/username.dart';
import '../models/ws_token.dart';
import '../utils/constants.dart';

class MoodleAuthService {
  final BaseUrl baseUrl;

  MoodleAuthService({required this.baseUrl});

  Future<WSToken> getWSToken(
      Username username, Password password) async {
    final response = await http.post(
      Uri.parse('${baseUrl.value}${EndPoints.login}'),
      body: {
        'username': username.value,
        'password': password.value,
        'service': defaultService,
      },
    );
    switch (response.statusCode) {
      case HttpStatus.ok:
        if (response.body.contains("token")) {
          final token = WSToken.fromJson(jsonDecode(response.body));
          return token;
        } else {
          throw InvalidResponseError('Unable to get token from server');
        }
      case HttpStatus.unauthorized:
        throw InvalidCredentialsError('Invalid username or password');
      default:
        throw InvalidResponseError('Unable to get token from server');
    }
  }

  Future<http.Response> requestPasswordReset(
      WSToken token, EmailAddress email) async {
    final response = await http.post(
      Uri.parse('$baseUrl${EndPoints.apiEndpoint}'),
      body: {
        'wstoken': token.value,
        'wsfunction': WSFunctions.coreAuthRequestPasswordReset,
        'moodlewsrestformat': 'json',
        'email': email.value,
      },
    );
    switch (response.statusCode) {
      case HttpStatus.ok:
        return response;
      case HttpStatus.unauthorized:
        throw InvalidCredentialsError('Invalid username or password');
      default:
        throw InvalidResponseError('Unable to reset password');
    }
  }

  Future<WSToken> login(
    Username username,
    Password password,
  ) =>
      getWSToken(username, password);

  Future<http.Response> logOut(WSToken token) async {
    final response = await http.post(
      Uri.parse("$baseUrl${EndPoints.logout}"),
      body: {
        'wstoken': token.value,
      },
    );
    switch (response.statusCode) {
      case HttpStatus.ok:
        return response;
      case HttpStatus.unauthorized:
        throw InvalidCredentialsError('Invalid username or password');
      default:
        throw InvalidResponseError('Unable to log out');
    }
  }
}
