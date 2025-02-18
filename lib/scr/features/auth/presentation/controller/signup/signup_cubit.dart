import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/signup_request_model.dart';
import '../../../data/repositories/auth_repo.dart';

part 'signup_state.dart';

class RegisterCubit extends Cubit<RegistrationState> {
  final AuthRepo authRepo;

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  RegisterCubit(this.authRepo) : super(Registrationitial());

  Future<void> register({
    required RegisterRequestModel signupRequestModel,
  }) async {
    emit(RegistrationLoading());
    isLoading = true;
    final response = await authRepo.register(
      name: signupRequestModel.fullName,
      email: signupRequestModel.email,
      password: signupRequestModel.password,
      phone: signupRequestModel.phone,
    );

    response.fold((failure) {
      emit(
        RegistrationError(failure.message),
      );
      isLoading = false;
    }, (user) async {
      emit(RegistrationSuccess(user.token));
      isLoading = false;
    });
  }

  @override
  Future<void> close() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    return super.close();
  }
}
