import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../widgets/auth/custom_button.dart';
import '../../widgets/auth/text_confirm_page.dart';

class ConfirmedPage extends StatelessWidget {
  const ConfirmedPage(
      {super.key,
      required this.textOne,
      required this.textTwo,
      required this.textThree,
      required this.navigateTo,
      required this.buttonText});

  final String textOne;
  final String textTwo;
  final String textThree;
  final Widget navigateTo;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // const ImageConfirm(),
                const Icon(Icons.done_rounded, size: 150, color: kPrimaryColor),
                const SizedBox(
                  height: 60,
                ),
                TitleText(
                  textOne: textOne,
                  textTwo: textTwo,
                  textThree: textThree,
                ),
                const SizedBox(
                  height: 60,
                ),
                CustomButton(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => navigateTo,
                      ),
                      (route) => false,
                    );
                  },
                  backgroundColor: kPrimaryColor,
                  textColor: Colors.white,
                  label: buttonText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
