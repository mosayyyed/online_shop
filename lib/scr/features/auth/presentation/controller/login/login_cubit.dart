import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/login_request_model.dart';
import '../../../data/repositories/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  LoginCubit(this.authRepo) : super(LoginInitial());

  Future<void> login({required LoginRequestModel loginRequestModel}) async {
    emit(LoginLoading());
    isLoading = true;

    final response = await authRepo.login(
        email: loginRequestModel.email, password: loginRequestModel.password);
    response.fold(
      (failure) {
        emit(LoginError(failure.message));
        isLoading = false;
      },
      (user) {
        emit(LoginSuccess(user.token));
        isLoading = false;
      },
    );
  }
}
