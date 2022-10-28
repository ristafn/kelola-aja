import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelola_aja/features/code/view/code_page.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/fonts.dart';
import '../../../core/constants/theme.dart';
import '../../../core/hive/hive.dart';
import '../../kelola_app/bloc/kelola_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((KelolaAppBloc bloc) => bloc.state.user);

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(defaultMargin),
        child: Column(
          children: [
            SizedBox(
              height: 103.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 80.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(user.photo!),
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
                        user.name!,
                        style: titleStyle,
                      ),
                      Text(
                        user.email!,
                        style: captionStyle,
                      )
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
              onTap: () {
                HiveConfig.delete(box: 'db', key: 'code'); // delete the previous code from hive
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CodePage(),
                  ),
                ); // go to code page
              },
              leading: const Icon(
                Icons.change_circle_outlined,
                size: 40.0,
                color: Colors.amber,
              ),
              title: Text(
                'Ganti toko',
                style: titleStyle,
              ),
              subtitle: Text(
                'Ganti kode toko untuk dapat berbelanja di toko lainnya',
                style: captionStyle,
              ),
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
            ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'Yakin akan keluar?',
                        style: titleStyle,
                      ),
                      content: Text(
                        'Aksi ini akan membuat akun anda keluar dari aplikasi',
                        style: subtitleStyle,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            'Batal',
                            style: captionStyle.copyWith(color: Colors.amber),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            HiveConfig.delete(
                                box: 'db',
                                key: 'code'); // delete the code from hive
                            context
                                .read<KelolaAppBloc>()
                                .add(KelolaAppLogoutRequested()); // logout
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Ya',
                            style: captionStyle,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              leading: const Icon(
                Icons.exit_to_app,
                size: 40.0,
                color: Colors.red,
              ),
              title: Text(
                'Keluar',
                style: titleStyle,
              ),
              subtitle: Text(
                'Keluar dari akun ini',
                style: captionStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
