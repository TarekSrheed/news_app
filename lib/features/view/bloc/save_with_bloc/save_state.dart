part of 'save_bloc.dart';

@immutable
sealed class SaveState {}

final class SaveInitial extends SaveState {}

class SuccessToSave extends SaveState {
  final NewsModel news;
  SuccessToSave({
    required this.news,
  });
}

class RemoveFromSave extends SaveState {}

class LoadingSaveState extends SaveState {}
