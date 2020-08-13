import '../../api/HttpRequest.dart';
import '../../util/Server.dart';

class LoginModel {
  static login(username, password) {
    var url = '${Server.apiDomain()}/staff/authenticate';
    var body = {
      "username": "peking",
      "password": "b09961e7",
    };
    return HttpRequest.getAccessToken(url, body);
  }

  static getAccessToken() {}
}
