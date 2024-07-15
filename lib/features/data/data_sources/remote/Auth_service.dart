import 'package:dio/dio.dart';
import 'package:news_app_flutter/core/config/service_locator.dart';
import 'package:news_app_flutter/features/data/data_sources/remote/core_service.dart';
import 'package:news_app_flutter/features/data/model/handling_model.dart';
import 'package:news_app_flutter/features/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthService extends CoreService {
  String baseUrl = "https://dummyjson.com/auth/login";
  Future<ResultModel> logIn(UserModel user);
}

class AuthServiceImp extends AuthService {
  @override
  Future<ResultModel> logIn(UserModel user) async {
    try {
    response = await req.post(baseUrl, data: user.toMap());
      if (response.statusCode == 200) {
        core
            .get<SharedPreferences>()
            .setString("token", response.data['token']);
        return DataSuccess();
      } else {
        return ErrorModel(message: "Faild To LogIn please Try Again");
      }
    } on DioException catch (e) {
      return ExceptionModel(message: e.message!);
    }
  }
}
