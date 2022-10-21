import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/auth_cubit.dart';
import 'auth_form.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: AuthPage());

  @override
  Widget build(BuildContext context) {
    final mQuery = MediaQuery.of(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: mQuery.size.height,
          width: mQuery.size.width,
          margin: const EdgeInsets.all(30.0),
          alignment: Alignment.center,
          child: BlocProvider(
            create: (context) =>
                AuthCubit(context.read<AuthenticationRepository>()),
            child: AuthForm(mQuery: mQuery),
          ),
        ),
      ),
    );
  }
}
