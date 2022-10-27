import 'package:authentication_repository/authentication_repository.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelola_aja/core/hive/hive.dart';
import 'package:kelola_aja/features/bottom_navigation/bottom_navigation.dart';

import '../../auth/view/auth_page.dart';
import '../../code/view/code_page.dart';
import '../../home/view/home_page.dart';
import '../kelola_app.dart';

class KelolaApp extends StatelessWidget {
  const KelolaApp({
    super.key,
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (_) => KelolaAppBloc(
          authenticationRepository: _authenticationRepository,
        ),
        child: const KelolaAppView(),
      ),
    );
  }
}

class KelolaAppView extends StatelessWidget {
  const KelolaAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Kelola-Aja',
      theme: ThemeData(primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      home: FlowBuilder<AppStatus>(
        state: context.select((KelolaAppBloc bloc) => bloc.state.status),
        onGeneratePages: (state, pages) {
          final readCode = HiveConfig.read(box: 'db', key: 'code');
          final basePage = readCode != null ? BottomNavPage.page() : CodePage.page();
          
          switch (state) {
            case AppStatus.authenticated:
              return [basePage];
            case AppStatus.unauthenticated:
              return [AuthPage.page()];
          }
        },
      ),
    );
  }
}
