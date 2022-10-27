import 'package:flutter/material.dart';

import '../../auth/auth.dart';

class SendButtonWidget extends StatelessWidget {
  const SendButtonWidget({super.key, required this.onTap, required this.mQuery});

  final Function() onTap;
  final Size mQuery;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: mQuery.width,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Center(
          child: Text(
            'Kirim',
            style: titleStyle,
          ),
        ),
      ),
    );
  }
}
