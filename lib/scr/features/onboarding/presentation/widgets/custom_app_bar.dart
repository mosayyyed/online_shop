import 'package:flutter/material.dart';
import 'package:online_shop_mvvm/scr/core/themes/app_colors.dart';

import '../../../../core/utils/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.isActionVisible});
  final bool? isActionVisible;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
              child: Image.asset("assets/onboarding_images/quickmart.png"),
            ),
            Visibility(
              visible: true,
              child: TextButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kBorderRadius),
                    ),
                  ),
                ),
                onPressed: () {
                  // GoRouter.of(context).go();
                },
                child: const Text(
                  'Skip for now',
                  style: TextStyle(color: AppColors.kPrimaryColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
