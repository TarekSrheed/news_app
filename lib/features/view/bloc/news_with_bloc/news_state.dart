// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:news_app_flutter/features/data/model/news_model.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class LoadingState extends NewsState {}

class ErrorState extends NewsState {}

class SuccessToGetData extends NewsState {
  List<NewsModel> news;
  SuccessToGetData({
    required this.news,
  });
}

class SuccessToGetSports extends NewsState {
  List<NewsModel> sportsNews;
  SuccessToGetSports({
    required this.sportsNews,
  });
}

class SuccessToGetPolitics extends NewsState {
  List<NewsModel> politicsNews;
  SuccessToGetPolitics({
    required this.politicsNews,
  });
}

class SuccessToGetHealth extends NewsState {
  List<NewsModel> healthNews;
  SuccessToGetHealth({
    required this.healthNews,
  });
}

class SearchInNews extends NewsState {
  List<NewsModel> news;
  SearchInNews({
    required this.news,
  });
}

class ItemSelectedState extends NewsState {
  NewsModel news;
  ItemSelectedState({
    required this.news,
  });
}
