import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/home/home_event.dart';

import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(super.initialState) {
    on<HomeDragDoingEvent>(
      (event, emit) => emit(HomeDragDoneState()),
    );
    on<HomeDragDoneEvent>(
      (event, emit) => emit(HomeDragDoneState()),
    );
    on<HomeDragNoneEvent>(
      (event, emit) => emit(HomeDragNoneState()),
    );
  }
}
