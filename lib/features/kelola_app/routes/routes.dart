import 'package:flutter/material.dart';
import 'package:kelola_aja/features/auth/view/auth_page.dart';
import 'package:kelola_aja/features/bottom_navigation/view/bottom_navigation_page.dart';

import '../bloc/kelola_bloc.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [BottomNavPage.page()];
    case AppStatus.unauthenticated:
      return [AuthPage.page()];
  }
}
