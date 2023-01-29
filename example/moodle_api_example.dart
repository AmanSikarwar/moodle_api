import 'package:moodle_api/moodle_api.dart';

final baseUrl = 'https://moodle.example.edu';

void main() async {
  final MoodleAuthService authService =
      MoodleAuthService(baseUrl: baseUrl);
  final token = await authService
      .getWSToken(Username("username"), Password("password"))
      .run();
  token.fold(
    (l) => print(l),
    (r) {
      final client = MoodleApiClient(baseUrl: baseUrl, token: r);
      client.getUserInfo().run().then(
            (value) => value.fold(
              (l) => print(l),
              (r) => print(r.body),
            ),
          );
    },
  );
}
