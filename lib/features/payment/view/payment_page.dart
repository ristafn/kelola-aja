import 'package:flutter/material.dart';
import 'package:kelola_aja/core/constants/theme.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

import '../../../core/constants/fonts.dart';
import '../../home/models/product.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key, required this.products});

  final List<Product> products;

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
                'Pembayaran',
                style: arrowTextStyle,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(defaultMargin),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: SfBarcodeGenerator(
                value:
                    '${List.generate(products.length, (index) => "{ id: ${products[index].id}, name: ${products[index].name}, code: ${products[index].code}, price: ${products[index].price}, stock: ${products[index].stock} }")}',
                symbology: QRCode(),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                'Tunjukkan kode batang ini ke penjual untuk memproses pembayaran',
                style: subtitleStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
