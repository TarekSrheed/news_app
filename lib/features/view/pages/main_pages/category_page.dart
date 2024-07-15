import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/core/res/app_string.dart';
import 'package:news_app_flutter/core/res/app_style.dart';
import 'package:news_app_flutter/features/view/bloc/news_with_bloc/news_bloc.dart';
import 'package:news_app_flutter/features/view/bloc/news_with_bloc/news_event.dart';
import 'package:news_app_flutter/features/view/bloc/news_with_bloc/news_state.dart';
import 'package:news_app_flutter/features/view/pages/details_page.dart';
import 'package:news_app_flutter/features/view/widgets/latest_news_widget.dart';

class CategoryPage extends StatelessWidget {
  final String category;
  const CategoryPage({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is SuccessToGetData) {
            return Column(
              children: [
                Image.network(
                  width: 341,
                  height: 200,
                  state.news[10].urlToImage,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.image);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LATESTNEWS,
                        style: titleStyle,
                      ),
                      Text(
                        SEEMORE,
                        style: seeMoreStyle,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: state.news.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) => NewsBloc()
                                    ..add(SelectItemEvent(
                                        news: state.news[index])),
                                  child: DetailsPage(),
                                ),
                              ),
                            );
                          },
                          child: LatestNewsWidget(
                            image: state.news[index].urlToImage,
                            date: state.news[index].publishedAt,
                            title: state.news[index].title,
                            name: state.news[index].source.name,
                          ),
                        );
                      }),
                )
              ],
            );
          } else if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return Text(PROBLEM);
          } else {
            return const Center(
              child: Icon(Icons.error),
            );
          }
        },
      ),
    );
  }
}
