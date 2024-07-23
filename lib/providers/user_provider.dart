import 'dart:convert';

import 'package:family_tracker/constans/api_constant.dart';
import 'package:get/get.dart';

class UserProvider extends GetConnect {
  Future<dynamic> postLoginUser(String username, String password) async {
    try {
      final body = json.encode({"username": username, "pass": password});
      Response response = await post('${ApiConstant.userAuth}/login', body);

      if (response.body["code"] != 200) {
        return response.body["msg"];
      }
      return response.body;
    } catch (e) {
      return const Response(body: "Error Login Request");
    }
  }
}
