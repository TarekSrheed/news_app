// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:news_app_flutter/core/res/app_color.dart';
import 'package:news_app_flutter/core/res/app_string.dart';
import 'package:news_app_flutter/core/res/app_style.dart';
import 'package:news_app_flutter/features/view/pages/main_pages/category_page.dart';
import 'package:news_app_flutter/features/view/pages/main_pages/home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            GRANDNEWS,
            style: titleStyle,
          ),
          leading: const Icon(Icons.menu),
          actions: const [Icon(Icons.notifications)],
          bottom: TabBar(
            indicatorColor: white,
            labelStyle: lableItemSelectedStyle,
            unselectedLabelStyle: lableItemUnselectedStyle,
            tabs: [
              Tab(text: ALL),
              Tab(text: POLITICS),
              Tab(text: SPORTS),
              Tab(text: HEALTH),
              Tab(text: TECH),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomePage(),
            CategoryPage(category: POLITICS),
            CategoryPage(category: SPORTS),
            CategoryPage(category: HEALTH),
            CategoryPage(category: TECH),
          ],
        ),
      ),
    );
  }
}
