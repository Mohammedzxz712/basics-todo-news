import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/models/shop_app/login_model.dart';
import 'package:untitled2/modules/shop_app/cubit/states.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../../shared/network/remote/end_points.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit ge(context) => BlocProvider.of(context);
  late ShopLoginModel loginModel;
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      // lang: 'en',
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      loginModel = ShopLoginModel.fromJson(value?.data);
      print(loginModel.data?.token);
      print(loginModel.message);
      print(loginModel.status);
      emit(ShopLoginSuccessState(loginModel));
    }).catchError((error) {
      print(error.toString());
      emit(
        ShopLoginErrorState(
          error.toString(),
        ),
      );
    });
  }

  IconData visible = Icons.visibility_outlined;
  bool obscureText = true;

  void changeVisiblePassword() {
    obscureText = !obscureText;
    obscureText
        ? visible = Icons.visibility_outlined
        : visible = Icons.visibility_off_outlined;
    emit(ShopLoginChangeVisibilityPasswordState());
  }
}
