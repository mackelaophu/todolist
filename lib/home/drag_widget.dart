import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/home/home_bloc.dart';
import 'package:to_do_list/home/home_event.dart';
import 'package:to_do_list/home/to_do_list_card.dart';
import 'package:to_do_list/home/todo_tag_drag_widget.dart';
import 'package:to_do_list/login/login_response.dart';

import 'home_state.dart';

class TodoCardDragWidget extends StatefulWidget {
  final ToDoEntity entity;
  final int index;
  const TodoCardDragWidget(
      {super.key, required this.entity, required this.index});
  @override
  State<TodoCardDragWidget> createState() => _TodoCardDragWidgetState();
}

class _TodoCardDragWidgetState extends State<TodoCardDragWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Draggable<int>(
            feedback: RotationTransition(
                turns: state is! HomeDragNoneState
                    ? state is HomeDragDoingState
                        ? const AlwaysStoppedAnimation(-15 / 360)
                        : const AlwaysStoppedAnimation(15 / 360)
                    : const AlwaysStoppedAnimation(0),
                child: Stack(
                  children: [
                    ToDoCard(entity: widget.entity),
                    state is! HomeDragNoneState
                        ? state is HomeDragDoingState
                            ? Positioned(
                                top: 40,
                                left: 20,
                                child: Transform.rotate(
                                  angle: 12,
                                  child: TodoDragItemTagWidget(
                                    text: 'DONE',
                                    color: Colors.green[400]!,
                                  ),
                                ),
                              )
                            : Positioned(
                                top: 50,
                                right: 24,
                                child: Transform.rotate(
                                  angle: -12,
                                  child: TodoDragItemTagWidget(
                                    text: 'DOING',
                                    color: Colors.red[400]!,
                                  ),
                                ),
                              )
                        : const SizedBox.shrink()
                  ],
                )),
            onDragUpdate: (details) {
              if (details.delta.dx > 0 &&
                  details.globalPosition.dx >
                      MediaQuery.of(context).size.width / 2) {
                context
                    .read<HomeBloc>()
                    .add(HomeDragDoneEvent(dragIndex: widget.index));
              }

              if (details.delta.dx < 0 &&
                  details.globalPosition.dx <
                      MediaQuery.of(context).size.width / 2) {
                context
                    .read<HomeBloc>()
                    .add(HomeDragDoingEvent(dragIndex: widget.index));
              }
            },
            onDragEnd: (drag) {
              context.read<HomeBloc>().add(const HomeDragNoneEvent());
            },
            childWhenDragging: Container(
              color: Colors.transparent,
            ),
            child: ToDoCard(entity: widget.entity),
          );
        },
      ),
    );
  }
}
