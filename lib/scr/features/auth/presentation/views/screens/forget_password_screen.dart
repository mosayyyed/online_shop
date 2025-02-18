import 'package:flutter/material.dart';
import 'package:online_shop_mvvm/scr/core/themes/app_colors.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_textField.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Forget Password",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            const Text(
              'Please enter your email!',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20.0),
            const CustomTextField(
              borderColor: AppColors.kPrimaryColor,
              label: 'Enter Your Email',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 40.0),
            CustomButton(
              backgroundColor: Colors.black,
              textColor: Colors.white,
              label: 'Send verification code',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
