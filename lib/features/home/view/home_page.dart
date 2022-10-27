import 'package:flutter/material.dart';
import 'package:kelola_aja/core/constants/app_assets.dart';
import 'package:kelola_aja/features/auth/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: Container(
          height: 100.0,
          margin: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
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
              const SizedBox(
                width: 14.0,
              ),
              Container(
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
            ],
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(30.0, 16.0, 30.0, 0.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
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
                              'Burger Keju',
                              style: titleStyle,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '12 pcs',
                              style: captionStyle,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Rp25.000,-',
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
          },
        ),
      ),
    );
  }
}
