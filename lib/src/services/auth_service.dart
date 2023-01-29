import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

import '../models/email.dart';
import '../models/errors/value_error.dart';
import '../models/password.dart';
import '../models/username.dart';
import '../models/ws_token.dart';

class MoodleAuthService {
  final String baseUrl;

  MoodleAuthService({required this.baseUrl});

  TaskEither<ValueError<String>, WSToken> getWSToken(
          Username username, Password password) =>
      TaskEither<ValueError<String>, WSToken>(
        () async {
          final response = await http.post(
            Uri.parse('$baseUrl/login/token.php'),
            body: {
              'username': username.getOrCrash(),
              'password': password.getOrCrash(),
              'service': 'moodle_mobile_app',
            },
          );
          if (response.statusCode == 200) {
            if (response.body.contains("token")) {
              final token = WSToken.fromJson(jsonDecode(response.body));
              return right(token);
            } else {
              return left(
                  InvalidInputError('Invalid username or password'));
            }
          } else {
            return left(
                InvalidInputError('Unable to get token from server'));
          }
        },
      );

  TaskEither<ValueError<String>, http.Response> requestPasswordReset(
          WSToken token, EmailAddress email) =>
      TaskEither<ValueError<String>, http.Response>(
        () async {
          final response = await http.post(
            Uri.parse('$baseUrl/webservice/rest/server.php'),
            body: {
              'wstoken': token.getOrCrash(),
              'wsfunction': 'core_auth_request_password_reset',
              'moodlewsrestformat': 'json',
              'email': email.getOrCrash(),
            },
          );
          if (response.statusCode == 200) {
            return right(response);
          } else {
            return left(InvalidTokenError('Invalid token'));
          }
        },
      );

  TaskEither<ValueError<String>, WSToken> login(
          Username username, Password password) =>
      getWSToken(username, password);

  TaskEither<ValueError<String>, http.Response> logOut(WSToken token) =>
      TaskEither<ValueError<String>, http.Response>(
        () async {
          final response = await http.post(
            Uri.parse("$baseUrl/login/logout.php"),
            body: {
              'wstoken': token.getOrCrash(),
            },
          );
          if (response.statusCode == 200) {
            return right(response);
          } else {
            return left(InvalidResponseError('Invalid token'));
          }
        },
      );
}
