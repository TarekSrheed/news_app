// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app_flutter/features/data/model/news_model.dart';
part 'save_event.dart';
part 'save_state.dart';

class SaveBloc extends Bloc<SaveEvent, SaveState> {
  late NewsModel savedItem;

  SaveBloc() : super(SaveInitial()) {
    on<AddToSavedItem>((event, emit) {
      savedItem = event.news;
      emit(SuccessToSave(news: savedItem));
    });
    on<RemoveFromSavedItem>((event, emit) {
      // savedItem.remove(event.news);
      emit(RemoveFromSave());
    });
  }

}
