import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/fonts.dart';
import '../../../core/constants/theme.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: Container(
          height: 80.0,
          margin: const EdgeInsets.symmetric(horizontal: 30.0),
          padding: const EdgeInsets.only(top: 26.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back_ios_new),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Text(
                'Keranjang',
                style: arrowTextStyle,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(defaultMargin),
        child: Stack(
          children: [
            // item cart
            Container(
              margin: const EdgeInsets.only(bottom: 80.0),
              child: ListView(
                children: List.generate(
                  10,
                  (index) {
                    return Container(
                      height: 120.0,
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(16.0),
                                  image: const DecorationImage(
                                    image: AssetImage(AppAssets.hamburgerImage),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 14.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Burger Keju',
                                    style: titleStyle,
                                  ),
                                  Text(
                                    'Rp12000,-',
                                    style: titleStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  Icons.delete,
                                  color: Color(kGreyColor),
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1.0,
                                      color: const Color(kGreyColor),
                                    ),
                                    borderRadius: BorderRadius.circular(16.0)),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.remove,
                                        color: Color(kGreyColor),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20.0,
                                    ),
                                    Text(
                                      '1',
                                      style: subtitleStyle,
                                    ),
                                    const SizedBox(
                                      width: 20.0,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.add,
                                        color: Color(kGreyColor),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 80.0,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xFFFAFAFA),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Harga',
                          style: subtitleStyle.copyWith(color: Colors.black),
                        ),
                        Text(
                          'Rp.30.000,-',
                          style: subtitleStyle.copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50.0,
                        width: 119.0,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Center(
                          child: Text(
                            'Bayar',
                            style: titleStyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
