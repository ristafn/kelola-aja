import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/fonts.dart';
import '../../../core/constants/theme.dart';
import '../../../core/hive/hive.dart';
import '../../bottom_navigation/bottom_navigation.dart';
import '../../home/view/home_page.dart';
import '../widget/send_button_widget.dart';

class CodePage extends StatefulWidget {
  const CodePage({super.key});

  static Page<void> page() => const MaterialPage(child: CodePage());

  @override
  State<CodePage> createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
  final TextEditingController codeCon = TextEditingController(text: '');
  final FocusNode node = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    codeCon.dispose();
    node.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size mQuery = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: mQuery.height,
          width: mQuery.width,
          margin: const EdgeInsets.all(defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Image.asset(AppAssets.codeImage),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Text(
                      'Masukkan kode toko yang telah anda dapatkan dari penjual',
                      style: captionStyle,
                    ),
                    const SizedBox(
                      height: 33.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Kode Toko',
                        style: titleStyle,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Form(
                      key: _formKey,
                      child: Container(
                        width: mQuery.width,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 14.0),
                        alignment: Alignment.center,
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
                        child: TextFormField(
                          controller: codeCon,
                          focusNode: node,
                          style: subtitleStyle,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Masukkan kode toko';
                            }

                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Masukkan kode toko',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Color(kGreyColor),
                            ),
                            border: InputBorder.none,
                          ),
                          onFieldSubmitted: (value) {
                            node.unfocus();
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    SendButtonWidget(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          // Write to hive
                          HiveConfig.write(
                            box: 'db',
                            key: 'code',
                            value: codeCon.text,
                          );

                          // push to next page
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const BottomNavPage(),
                            ),
                          );
                        }
                      },
                      mQuery: mQuery,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
