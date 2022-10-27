import 'package:flutter/material.dart';

import '../implementation/home_impl.dart';
import '../models/product.dart';
import '../widget/app_bar_widget.dart';
import '../widget/card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.code});

  static Page<void> page(String code) =>
      MaterialPage<void>(child: HomePage(code: code));

  final String code;

  @override
  Widget build(BuildContext context) {
    final homeImpl = HomeImplementation();

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
                  return CardWidget(data: snapshot.data![index]);
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
