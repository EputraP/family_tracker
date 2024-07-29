import 'dart:convert';
import 'package:family_tracker/constans/api_constant.dart';
import 'package:get/get.dart';

class UserLocationProvider extends GetConnect {
  Future<Response> putUpdateUserLocation(
      int userId, String lat, String long, String token) async {
    final body = json.encode({"user_id": userId, "lat": lat, "long": long});
    return await put('${ApiConstant.userLocation}/update', body, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token', //carrier
    });
  }

  Future<Response> getUserLocationData(String token) async {
    return await get('${ApiConstant.userLocation}/users-location', headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token', //carrier
    });
  }
}
