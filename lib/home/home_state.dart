import 'package:equatable/equatable.dart';

sealed class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

final class HomeDragDoneState extends HomeState {}

final class HomeDragDoingState extends HomeState {}

final class HomeDragNoneState extends HomeState {}
