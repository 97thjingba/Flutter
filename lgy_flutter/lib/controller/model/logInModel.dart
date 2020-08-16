import '../../api/HttpRequest.dart';
import '../../util/Server.dart';

class LoginModel {
  static login(username, password) {
    var url = '${Server.apiDomain()}/staff/authenticate';
    var body = {
      "username": username,
      "password": password,
    };
    return HttpRequest.getAccessToken(url, body);
  }

  static getAccessToken() {}
}
