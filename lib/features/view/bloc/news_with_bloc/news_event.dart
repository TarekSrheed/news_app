// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:news_app_flutter/features/data/model/news_model.dart';

abstract class NewsEvent {}

class GetNews extends NewsEvent {}

class GetCategoryNews extends NewsEvent {
  String category;
  GetCategoryNews({
    required this.category,
  });
}

// class GetSportsNews extends NewsEvent {
//   String category;
//   GetSportsNews({
//     required this.category,
//   });
// }

// class GetHealthNews extends NewsEvent {
//   String category;
//   GetHealthNews({
//     required this.category,
//   });
// }

class GetSearchNews extends NewsEvent {
  String? lexem;
  GetSearchNews({
    required this.lexem,
  });
}

class SelectItemEvent  extends NewsEvent {
  NewsModel news;
  SelectItemEvent ({
    required this.news,
  });
}