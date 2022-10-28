import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelola_aja/core/hive/hive.dart';
import 'package:kelola_aja/features/home/cubit/cart_cubit.dart';

import '../implementation/home_impl.dart';
import '../models/product.dart';
import '../widget/app_bar_widget.dart';
import '../widget/card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeImpl = HomeImplementation();
    final code = HiveConfig.read(box: 'db', key: 'code') ?? '';

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: AppBarWidget(),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(30.0, 16.0, 30.0, 0.0),
        child: FutureBuilder<List<Product>?>(
          future: homeImpl.fetchAll(code),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return CardWidget(
                    data: snapshot.data![index],
                    onPressed: () => context.read<CartCubit>().state.add(snapshot.data![index]),
                  );
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
