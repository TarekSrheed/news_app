import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/core/bloc_manager/app_manager_bloc.dart';
import 'package:news_app_flutter/core/config/service_locator.dart';
import 'package:news_app_flutter/features/view/bloc/news_with_bloc/news_bloc.dart';
import 'package:news_app_flutter/features/view/bloc/news_with_bloc/news_event.dart';
import 'package:news_app_flutter/features/view/bloc/save_with_bloc/save_bloc.dart';
import 'package:news_app_flutter/features/view/pages/login_page.dart';
import 'package:news_app_flutter/features/view/pages/navigation_pages.dart';

void main() {
  init();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppManagerBloc()..add(CheckAuthorized()),
        ),
        BlocProvider(
          create: (context) => NewsBloc()..add(GetNews()),
        ),
        BlocProvider(
          create: (context) => SaveBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: BlocBuilder<AppManagerBloc, AppManagerState>(
          builder: (context, state) {
            switch (state) {
              case NavigateToMainPage():
                return NavigationPage();
              case NavigateToOffline():
                return LoginPage();
              default:
                return LoginPage();
            }
          },
        ),
      ),
    );
  }
}
