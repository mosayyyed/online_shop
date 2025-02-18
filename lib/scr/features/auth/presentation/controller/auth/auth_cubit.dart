import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isLoading = false;

  AuthCubit(this.authRepo) : super(AuthInitial());

  String? validateName(String? value) {
    return value?.trim().isEmpty ?? true ? 'Please enter your name' : null;
  }

  String? validateEmail(String? value) {
    return value?.trim().isEmpty ?? true ? 'Please enter your email' : null;
  }

  String? validatePassword(String? value) {
    if (value?.trim().isEmpty ?? true) return 'Please enter your password';
    if (value!.length < 8) return 'Password must be at least 8 characters long';
    return null;
  }

  String? validateConfirmPassword(String? value, String password) {
    if (value?.trim().isEmpty ?? true) return 'Please confirm your password';
    if (value != password) return 'Passwords do not match';
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value?.trim().isEmpty ?? true) return 'Please enter your phone number';
    if (value!.length < 11)
      return 'Phone number must be at least 11 characters long';
    return null;
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(PasswordVisibilityChanged(isPasswordVisible));
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    emit(PasswordVisibilityChanged(isConfirmPasswordVisible));
  }
}
