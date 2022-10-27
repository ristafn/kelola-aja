import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/fonts.dart';
import '../../../core/constants/theme.dart';
import '../models/product.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.data});

  final Product data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 401.0,
      margin: const EdgeInsets.symmetric(
        vertical: 13.5,
        horizontal: 5.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: const Offset(1, 1),
            blurRadius: 4,
            color: const Color(kGreyColor).withOpacity(0.25),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                image: DecorationImage(
                  image: AssetImage(AppAssets.hamburgerImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 17.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      data.name,
                      style: titleStyle,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      '${data.stock}',
                      style: captionStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rp${(data.price)},-',
                          style: titleStyle,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(10.0),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
