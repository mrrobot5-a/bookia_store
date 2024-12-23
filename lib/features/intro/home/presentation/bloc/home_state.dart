part of 'home_bloc.dart';

sealed class HomeState {}

class HomeInitialState extends HomeState {}

class NewSliderloadingState extends HomeState {}

class NewSliderSuccessState extends HomeState {}

class NewArrivalsloadingState extends HomeState {}

class NewArrivalsSuccessState extends HomeState {}

class MessageErrorState extends HomeState {
  String message;
  MessageErrorState({required this.message});
}
