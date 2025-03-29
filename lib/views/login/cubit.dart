import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themar/views/login/states.dart';

import '../../core/dio_helper.dart';

class LoginCubit extends Cubit<LoginState> {
  final DioHelper _dio;

  LoginCubit(this._dio) : super(LoginState());
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> send(context) async {
    emit(LoginLoadingState());
    final response = await _dio.send("login", data: {
      "phone": phoneController.text,
      "password": passwordController.text,
      "device_token": "test",
      "type": Platform.operatingSystem,
      "user_type": "client"
    });
    if (response.isSuccess) {
      emit(LoginSuccessState());
    } else {
      emit(LoginFailedState());
    }
  }
}
