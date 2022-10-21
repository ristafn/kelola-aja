import 'package:flutter/material.dart';

import '../../features/auth/view/auth_page.dart';
import '../../features/home/views/home_page.dart';

class Middleware extends StatelessWidget {
  const Middleware({super.key});

  @override
  Widget build(BuildContext context) {
    const String user = '';

    return (user != '') ? const HomePage() : const AuthPage();
  }
}
