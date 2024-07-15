// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'save_bloc.dart';

@immutable
sealed class SaveEvent {}

class AddToSavedItem extends SaveEvent {
  final NewsModel news;
  AddToSavedItem({
    required this.news,
  });
}

class RemoveFromSavedItem extends SaveEvent {
}
