import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/utils/constants.dart';

import '../screens/main_screen.dart';

class AuthProvider with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isLoading = false;

  Dio dio = Dio();
  final String apiUrl = 'https://fakestoreapi.com/auth/login';
  String? validateName(String? value) {
    return value?.isEmpty ?? true ? 'Please enter your full name' : null;
  }

  String? validateEmail(String? value) {
    return value?.isEmpty ?? true ? 'Please enter your username' : null;
  }

  String? validatePassword(String? value) {
    if (value?.isEmpty ?? true) return 'Please enter your password';
    if (value!.length < 6) return 'Password must be at least 6 characters long';
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value?.isEmpty ?? true) return 'Please confirm your password';
    // if (value != passwordController.text) return 'Passwords do not match';
    return null;
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    isLoading = true;
    notifyListeners();

    try {
      Response response = await dio.post(apiUrl, data: {
        'username': emailController.text,
        'password': passwordController.text,
      });

      final token = response.data['token'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const MainScreen()),
        (route) => false,
      );
    } catch (e) {
      _handleLoginError(context, e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void _handleLoginError(BuildContext context, dynamic error) {
    String message = 'Login failed. Please check your credentials.';
    if (error is DioException && error.response != null) {
      switch (error.response!.statusCode) {
        case 400:
          message = 'Invalid credentials. Please try again.';
          break;
        case 500:
          message = 'Server error. Please try again later.';
          break;
        default:
          message = 'An unexpected error occurred. Please try again.';
      }
    }
    showErrorDialog(context, message);
  }

  void showErrorDialog(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(fontSize: 16)),
        backgroundColor: kPrimaryColor,
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Close',
          backgroundColor: kSecondaryColor,
          textColor: kPrimaryColor,
          onPressed: () {},
        ),
      ),
    );
  }

  bool submitForm() => formKey.currentState!.validate();
}
