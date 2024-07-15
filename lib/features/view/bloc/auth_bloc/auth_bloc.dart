// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app_flutter/core/config/service_locator.dart';
import 'package:news_app_flutter/features/data/data_sources/remote/Auth_service.dart';
import 'package:news_app_flutter/features/data/model/handling_model.dart';
import 'package:news_app_flutter/features/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LogIn>((event, emit) async {
      core.get<SharedPreferences>().setString('data', event.user.toJson());
      ResultModel result = await AuthServiceImp().logIn(event.user);
      if (result is DataSuccess) {
        emit(SuccessToLogIn());
      } else {
        emit(FailedToLogIn());
      }
    });
  }
}
