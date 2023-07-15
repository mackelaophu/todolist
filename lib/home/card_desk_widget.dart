import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/home/drag_widget.dart';
import 'package:to_do_list/home/home_bloc.dart';
import 'package:to_do_list/home/home_event.dart';
import 'home_state.dart';

class DeskCardWidget extends StatefulWidget {
  const DeskCardWidget({super.key});

  @override
  State<DeskCardWidget> createState() => _DeskCardWidgetState();
}

class _DeskCardWidgetState extends State<DeskCardWidget> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              final bloc = context.read<HomeBloc>();
              return Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: List.generate(bloc.model.desk.length, (index) {
                  return TodoCardDragWidget(
                      entity: bloc.model.desk[index], index: index);
                }),
              );
            },
          ),
        ),
        Positioned(
          left: 0,
          child: DragTarget<int>(
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return IgnorePointer(
                child: Container(
                  height: 700.0,
                  width: 80.0,
                  color: Colors.transparent,
                ),
              );
            },
            onAccept: (int index) {
              bloc.add(HomeDragDoingEvent(dragIndex: index));
            },
          ),
        ),
        Positioned(
          right: 0,
          child: DragTarget<int>(
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return IgnorePointer(
                child: Container(
                  height: 700.0,
                  width: 80.0,
                  color: Colors.transparent,
                ),
              );
            },
            onAccept: (int index) {
              bloc.add(HomeDragDoneEvent(dragIndex: index));
            },
          ),
        ),
      ],
    );
  }
}
