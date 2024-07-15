// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/core/res/app_color.dart';
import 'package:news_app_flutter/core/res/app_string.dart';
import 'package:news_app_flutter/core/res/app_style.dart';
import 'package:news_app_flutter/features/view/bloc/news_with_bloc/news_bloc.dart';
import 'package:news_app_flutter/features/view/bloc/news_with_bloc/news_event.dart';
import 'package:news_app_flutter/features/view/pages/search_pages/news_search_page.dart';
import 'package:news_app_flutter/features/view/pages/search_pages/photos_tab.dart';
import 'package:news_app_flutter/features/view/pages/search_pages/search_all_page.dart';
import 'package:news_app_flutter/features/view/pages/search_pages/videos_search_page.dart';
import 'package:news_app_flutter/features/view/widgets/tab_widget.dart';

class MainSearchPage extends StatefulWidget {
  MainSearchPage({super.key});

  @override
  State<MainSearchPage> createState() => _MainSearchPageState();
}

class _MainSearchPageState extends State<MainSearchPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150,
            floating: false,
            pinned: true,
            bottom: TabBar(
              controller: tabController,
              dividerHeight: 0,
              isScrollable: false,
              indicatorPadding: const EdgeInsets.only(top: 10, bottom: 10),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                color: primaryBlue,
              ),
              labelStyle: tabSelectedStyle,
              unselectedLabelStyle: tabUnselectedStyle,
              unselectedLabelColor: black,
              tabs: [
                TabWidget(
                  label: ALL,
                ),
                TabWidget(
                  label: NEWS,
                ),
                TabWidget(
                  label: PHOTOS,
                ),
                TabWidget(
                  label: VIDEOS,
                ),
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(
                    top: 30, bottom: 20, left: 20, right: 20),
                child: TextField(
                  onChanged: (value) {
                    if (value.isEmpty) {
                      context.read<NewsBloc>().add(GetNews());
                    } else {
                      context.read<NewsBloc>().add(GetSearchNews(lexem: value));
                    }
                  },
                  decoration: InputDecoration(
                    fillColor: white,
                    filled: true,
                    hintText: TECHNOLOGY,
                    hintStyle: hintStyle,
                    suffixIcon: Icon(
                      Icons.search,
                      color: lightGrey,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(44),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: tabController,
              children: const [
                SearchAllPage(),
                NewsSearchPage(),
                PhotosTabPage(),
                VidewsPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
