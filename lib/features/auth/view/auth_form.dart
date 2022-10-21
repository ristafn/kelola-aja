import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelola_aja/features/auth/cubit/auth_cubit.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/fonts.dart';
import '../widget/google_button_widget.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({
    Key? key,
    required this.mQuery,
  }) : super(key: key);

  final MediaQueryData mQuery;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Image.asset(AppAssets.greetingImage),
        ),
        Expanded(
          flex: 3,
          child: SizedBox(
            width: 500.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selamat Datang,',
                  style: titleStyle,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Silahkan masuk atau daftar menggukan akun google',
                  style: subtitleStyle,
                ),
                const SizedBox(
                  height: 59.0,
                ),
                GoogleButtonWidget(onTap: () => context.read<AuthCubit>().logInWithGoogle()),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(
            height: mQuery.size.height,
            width: mQuery.size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'v1.0.0',
                  style: captionStyle,
                ),
                Text(
                  'Privacy policy | Term of use',
                  style: captionStyle,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
