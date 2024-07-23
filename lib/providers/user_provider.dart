import 'dart:convert';

import 'package:family_tracker/constans/api_constant.dart';
import 'package:get/get.dart';

class UserProvider extends GetConnect {
  Future<Response> postLoginUser(String username, String password) {
    final body = json.encode({"username": username, "pass": password});
    return post('${ApiConstant.userAuth}/login', body);
  }
}
