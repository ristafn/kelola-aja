import 'package:authentication_repository/authentication_repository.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/configs/app.dart';
import 'features/kelola_app/bloc_obeserver.dart';
import 'features/kelola_app/view/kelola_app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // Firebase initialization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Bloc.observer = AppBlocObserver();

  // hive initialization
  await Hive.initFlutter();
  await Hive.openBox('db');

  // Auth Repo
  final authenticationRepostiory = AuthenticationRepository();
  await authenticationRepostiory.user.first;

  runApp(
    DevicePreview(
      enabled: App.kDebug,
      builder: (context) {
        return KelolaApp(
          authenticationRepository: authenticationRepostiory,
        );
      },
    ),
  );
}
