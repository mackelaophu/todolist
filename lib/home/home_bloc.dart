import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/home/home_event.dart';
import 'package:to_do_list/home/home_model.dart';

import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeModel model;
  HomeBloc({required this.model}) : super(HomeInitialState()) {
    on<HomeDragDoingEvent>(
      (event, emit) {
        emit(HomeDragDoingState());
      },
    );
    on<HomeDragDoneEvent>((event, emit) {
      emit(HomeDragDoneState());
    });
    on<HomeRecoverDraggedEvent>((event, emit) {
      emit(HomeRecoverDraggedState());
    });

    on<HomeDragNoneEvent>(
      (event, emit) => emit(HomeDragNoneState()),
    );
  }
}
