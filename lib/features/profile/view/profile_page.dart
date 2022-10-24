import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/fonts.dart';
import '../../../core/constants/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(defaultMargin),
        child: Column(
          children: [
            Container(
              height: 103.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 80.0,
                    width: 80.0,
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(AppAssets.profileImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Steve',
                        style: titleStyle,
                      ),
                      Text(
                        'steve@company.com',
                        style: captionStyle,
                      ),
                      Text(
                        '+6282738472312',
                        style: captionStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Divider(
              thickness: 1.0,
            ),
            const SizedBox(
              height: 20.0,
            ),
            ListTile(
              leading: Image.asset(
                AppAssets.settingIcon,
                height: 40.0,
                width: 40.0,
              ),
              title: Text(
                'Settings',
                style: titleStyle,
              ),
              subtitle: Text(
                'Ganti tema dan bahasa',
                style: captionStyle,
              ),
            ),
            ListTile(
              leading: Image.asset(
                AppAssets.infoIcon,
                height: 40.0,
                width: 40.0,
              ),
              title: Text(
                'Tentang',
                style: titleStyle,
              ),
              subtitle: Text(
                'Info tentang kami',
                style: captionStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
