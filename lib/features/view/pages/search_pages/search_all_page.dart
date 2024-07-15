// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/features/view/bloc/news_with_bloc/news_bloc.dart';
import 'package:news_app_flutter/features/view/bloc/news_with_bloc/news_state.dart';
import 'package:news_app_flutter/features/view/widgets/card_widgets/card_widget.dart';

class SearchAllPage extends StatelessWidget {
  const SearchAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
      body: BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is SuccessToGetData) {
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: state.news.length,
            itemBuilder: (context, index) {
              return CardWidget(
                title: state.news[index].title,
                subTitle: state.news[index].description,
                image: state.news[index].urlToImage,
                date: state.news[index].publishedAt,
              );
            },
          );
        } else if (state is SearchInNews){ 
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: state.news.length,
            itemBuilder: (context, index) {
              return CardWidget(
                title: state.news[index].title,
                subTitle: state.news[index].description,
                image: state.news[index].urlToImage,
                date: state.news[index].publishedAt,
              );
            },
          );
        } else if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ErrorState) {
          return const Text("there is a problem");
        } else {
          return  const Icon(Icons.error);
        }
      },
    ));
  }
}