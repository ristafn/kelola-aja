import 'package:flutter/material.dart';

import '../../../core/constants/fonts.dart';
import '../../../core/constants/theme.dart';
import '../../../core/intl/intl.dart';
import '../models/product.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.data, required this.onPressed});

  final Product data;
  final Function() onPressed;

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
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                image: DecorationImage(
                  image: NetworkImage(data.image),
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
                  const SizedBox(
                    height: 5.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      'stock : ${data.stock}',
                      style: subtitleStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${IntlConfig.formatCurrency.format(data.price)},-',
                          style: titleStyle,
                        ),
                        ElevatedButton(
                          onPressed: onPressed,
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
