import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelola_aja/features/cart/cart.dart';
import 'package:kelola_aja/features/search/search.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/fonts.dart';
import '../../../core/constants/theme.dart';
import '../cubit/cart_cubit.dart';
import '../models/product.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SearchPage(),
                  ),
                );
              },
              child: Container(
                height: 60.0,
                width: 201.0,
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(1, 1),
                      blurRadius: 4,
                      color: const Color(kGreyColor).withOpacity(0.25),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppAssets.searchIcon,
                      color: const Color(kGreyColor).withOpacity(0.25),
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Text(
                      'Cari sesuatu...',
                      style: subtitleStyle.copyWith(
                          color: const Color(kGreyColor).withOpacity(0.25)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 14.0,
          ),
          BlocBuilder<CartCubit, List<Product>>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CartPage(products: state),
                  ),
                ),
                child: Container(
                  height: 60.0,
                  width: 60.0,
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(1, 1),
                        blurRadius: 4,
                        color: const Color(kGreyColor).withOpacity(0.25),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    AppAssets.cartIcon,
                    scale: 1.5,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
