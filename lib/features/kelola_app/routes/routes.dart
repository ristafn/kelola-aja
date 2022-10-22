import 'package:flutter/material.dart';
import 'package:kelola_aja/features/auth/view/auth_page.dart';
import 'package:kelola_aja/features/home/views/home_page.dart';

import '../bloc/kelola_bloc.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [AuthPage.page()];
  }
}
