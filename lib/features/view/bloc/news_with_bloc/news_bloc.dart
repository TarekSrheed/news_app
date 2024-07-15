import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/features/data/data_sources/remote/news_service.dart';
import 'package:news_app_flutter/features/data/model/handling_model.dart';
import 'package:news_app_flutter/features/data/model/news_model.dart';
import 'package:news_app_flutter/features/view/bloc/news_with_bloc/news_event.dart';
import 'package:news_app_flutter/features/view/bloc/news_with_bloc/news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    List<NewsModel> news = [];
    on<GetNews>((event, emit) async {
      emit(LoadingState());
      ResultModel result = await NewsServiceImp().getNews();
      if (result is ListOf<NewsModel>) {
        news = result.listOfData;
        emit(SuccessToGetData(news: news));
      } else {
        emit(ErrorState());
      }
    });
    on<GetCategoryNews>((event, emit) async {
      emit(LoadingState());
      ResultModel result =
          await NewsServiceImp().getCategoryNews(event.category);
      if (result is ListOf<NewsModel>) {
        news = result.listOfData;
        emit(SuccessToGetPolitics(politicsNews: news));
      } else {
        emit(ErrorState());
      }
    });
    on<GetSearchNews>((event, emit) async {
      emit(LoadingState());
      ResultModel result = await NewsServiceImp().searchInNews(event.lexem!);
      if (result is ListOf<NewsModel>) {
        emit(SearchInNews(news: result.listOfData));
      } else {
        emit(ErrorState());
      }
    });
    on<SelectItemEvent>((event, emit) {
      emit(LoadingState());
      emit(ItemSelectedState(news: event.news));
    });
  }
}
