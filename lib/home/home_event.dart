import 'package:equatable/equatable.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

final class HomeDragDoneEvent extends HomeEvent {
  final int dragIndex;
  const HomeDragDoneEvent({required this.dragIndex});
}

final class HomeDragDoingEvent extends HomeEvent {
  final int dragIndex;
  const HomeDragDoingEvent({required this.dragIndex});
}

final class HomeDragNoneEvent extends HomeEvent {
  const HomeDragNoneEvent();
}
