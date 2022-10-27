import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kelola_aja/core/hive/hive.dart';
import 'package:kelola_aja/features/home/view/home_page.dart';

import '../../auth/view/auth_page.dart';
import '../../code/view/code_page.dart';
import '../bloc/kelola_bloc.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  // check code from hive
  // HiveConfig.delete(box: 'db', key: 'code');
  final code = HiveConfig.read(box: 'db', key: 'code');
  final basePage = code != null ? HomePage.page(code) : CodePage.page();

  switch (state) {
    case AppStatus.authenticated:
      return [basePage];
    case AppStatus.unauthenticated:
      return [AuthPage.page()];
  }
}
