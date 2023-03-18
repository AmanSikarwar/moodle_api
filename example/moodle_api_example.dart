import 'package:moodle_api/moodle_api.dart';
// note: this file is not included in the repo
import 'package:moodle_api/secret.dart' as secret;

void main() async {
  final MoodleAuthService authService =
      MoodleAuthService(baseUrl: BaseUrl(secret.baseUrl));
  final token = await authService.getWSToken(
      Username(secret.username), Password(secret.password));
  if (token.isValid) {
    final client =
        MoodleApiClient(baseUrl: BaseUrl(secret.baseUrl), token: token);
    final siteInfo = await client.getSiteInfo();
    print(siteInfo.sitename);
    final userInfo =
        await client.getUserInfo(Username(siteInfo.username!));
    print(userInfo);
  }
}
