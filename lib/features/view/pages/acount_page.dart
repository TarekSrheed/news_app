import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/core/bloc_manager/app_manager_bloc.dart';
import 'package:news_app_flutter/core/res/app_images.dart';
import 'package:news_app_flutter/core/res/app_string.dart';
import 'package:news_app_flutter/core/res/app_style.dart';
import 'package:news_app_flutter/features/view/bloc/auth_bloc/auth_bloc.dart';

class AcountPage extends StatelessWidget {
  const AcountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        centerTitle: true,
        title: Text(
          PROFILE,
          style: titleStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ListTile(
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(acount)),
              title: Text(
                NAME,
                style: titleSaveStyle,
              ),
              subtitle: Text(
                EMAIL,
                style: accountSubTitleStyle,
              ),
            ),
            Row(
              children: [
                const Icon(Icons.person),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  MYPROFILE,
                  style: accountItemStyle,
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.settings),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  SETTINGS,
                  style: accountItemStyle,
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.notification_add),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  NOTIFICATIONS,
                  style: accountItemStyle,
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.language),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  LANGUAGE,
                  style: accountItemStyle,
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.chat),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  FAQ,
                  style: accountItemStyle,
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.circle),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  ABOUTAPP,
                  style: accountItemStyle,
                ),
              ],
            ),
            InkWell(
              onTap: () {
                context.read<AppManagerBloc>().add(LogOut());
              },
              child: Row(
                children: [
                  const Icon(Icons.logout),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    LOGOUT,
                    style: accountItemStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
