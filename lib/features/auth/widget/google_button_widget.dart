import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../auth.dart';

class GoogleButtonWidget extends StatelessWidget {
  const GoogleButtonWidget({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 72.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: const Color(kGreyColor).withOpacity(0.4),
              offset: const Offset(1, 1),
              blurRadius: 2,
            ),
          ],
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(
                  left: 28.0,
                  top: 16.0,
                  bottom: 16.0,
                ),
                child: Image.asset(AppAssets.googleIcon),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Google',
                style: titleStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
