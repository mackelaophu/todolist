import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/home/home_event.dart';
import 'package:to_do_list/home/home_model.dart';

import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeModel model;
  HomeBloc({required this.model}) : super(HomeInitialState()) {
    on<HomeDragDoingEvent>(
      (event, emit) {
        model.removeItemAt(event.dragIndex, DragEvent.doing);
        emit(HomeDragDoingState());
      },
    );
    on<HomeDragDoneEvent>((event, emit) {
      model.removeItemAt(event.dragIndex, DragEvent.done);
      emit(HomeDragDoneState());
    });
    on<HomeDragNoneEvent>(
      (event, emit) => emit(HomeDragNoneState()),
    );
  }
}
