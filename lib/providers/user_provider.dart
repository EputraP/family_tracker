import 'dart:convert';
import 'package:family_tracker/constans/api_constant.dart';
import 'package:get/get.dart';

class UserProvider extends GetConnect {
  Future<Response> postLoginUser(String username, String password) async {
    final body = json.encode({"username": username, "pass": password});
    return await post('${ApiConstant.userAuth}/login', body);
  }

  Future<Response> getLogoutUser(String userid) async {
    return await get('${ApiConstant.userAuth}/logout/$userid');
  }

  Future<Response> putSetIsOnline(int userid, String token) async {
    final body = json.encode({"user_id": userid, "is_online": "1"});

    return await put('${ApiConstant.user}/update-online', body, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token', //carrier
    });
  }
}
