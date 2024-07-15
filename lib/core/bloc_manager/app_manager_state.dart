part of 'app_manager_bloc.dart';

@immutable
sealed class AppManagerState {}

final class AppManagerInitial extends AppManagerState {}

class NavigateToLogin extends AppManagerState {}

class NavigateToMainPage extends AppManagerState {}

class NavigateToOffline extends AppManagerState {}
