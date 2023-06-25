import 'package:equatable/equatable.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

final class HomeDragDoneEvent extends HomeEvent {
  const HomeDragDoneEvent();
}

final class HomeDragDoingEvent extends HomeEvent {
  const HomeDragDoingEvent();
}

final class HomeDragNoneEvent extends HomeEvent {
  const HomeDragNoneEvent();
}
