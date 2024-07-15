import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter/core/res/app_color.dart';
import 'package:news_app_flutter/core/res/app_images.dart';
import 'package:news_app_flutter/core/res/app_string.dart';
import 'package:news_app_flutter/core/res/app_style.dart';
import 'package:news_app_flutter/features/view/pages/acount_page.dart';
import 'package:news_app_flutter/features/view/pages/main_pages/main_page.dart';
import 'package:news_app_flutter/features/view/pages/save_page.dart';
import 'package:news_app_flutter/features/view/pages/search_pages/main_search_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  List<Widget> pages = [
    const MainPage(),
    MainSearchPage(),
    SavePage(),
    AcountPage(),
  ];
  int selectedPage = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(selectedPage),
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: orange,
        backgroundColor: white,
        color: primaryBlue,
        key: _bottomNavigationKey,
        items: [
          CurvedNavigationBarItem(
            labelStyle: labalStyle,
            child: Image.asset(home),
            label: HOME,
          ),
          CurvedNavigationBarItem(
            labelStyle: labalStyle,
            child: Icon(
              Icons.search,
              color: white,
              size: 24,
            ),
            label: SEARCH,
          ),
          CurvedNavigationBarItem(
            labelStyle: labalStyle,
            child: Image.asset(save),
            label: SAVE,
          ),
          CurvedNavigationBarItem(
            labelStyle: labalStyle,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(acount)),
            label: ACCOUNT,
          ),
        ],
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),
    );
  }
}
