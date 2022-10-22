import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelola_aja/features/kelola_app/kelola_app.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    final user = context.select((KelolaAppBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${user.name}'),
            ElevatedButton(
              onPressed: () => context.read<KelolaAppBloc>().add(KelolaAppLogoutRequested()),
              child: const Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
