import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:todo_app2/core/theming/styles.dart';
import 'package:todo_app2/features/home/view_model/calender_bloc/calender_bloc.dart';
import 'package:todo_app2/features/home/views/widgets/calender_widgets.dart';
import 'package:todo_app2/features/home/views/widgets/choose_todey_or_completed.dart';
import 'package:todo_app2/features/home/views/widgets/index_initial.dart';
import 'package:todo_app2/features/home/views/widgets/task_items.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({super.key});

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  String date = DateTime.now().toString();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CalenderBloc>(context).add(TasksWithDataNeeded(date: date));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
      child: Column(
        children: [
          Center(
            child: Text(
              'Calender',
              style: AppStyles.styleLatoReguler20(context),
            ),
          ),
          const Gap(16),
          CalenderWidget(
            onDateChage: (date) {
              setState(() {
                this.date = date;
              });
            },
          ),
          const Gap(20),
          ChooseTodeyOrCompleted(
            date: date,
          ),
          BlocBuilder<CalenderBloc, CalenderState>(
            buildWhen: (previous, current) =>
                current is TasksGettingSuccessState ||
                current is CalenderCompletedAllTasksGettingSuccessState ||
                current is CalenderInitialState,
            builder: (BuildContext context, state) {
              if (state is TasksGettingSuccessState) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: TaskItems(
                      isSrollable: true,
                      items: state.tasks,
                      onRadioSelected: (index) {
                        BlocProvider.of<CalenderBloc>(context).add(
                            CalenderTaskDeletedCompletedAdded(
                                index: index, date: date));
                      },
                      onItemRemoved: (int index) {
                        BlocProvider.of<CalenderBloc>(context)
                            .add(CalenderTaskDeleted(index: index));
                      },
                    ),
                  ),
                );
              } else if (state
                  is CalenderCompletedAllTasksGettingSuccessState) {
                return Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Expanded(
                    child: TaskItems(
                      isSrollable: true,
                      items: state.tasks,
                      onRadioSelected: (index) {
                        BlocProvider.of<CalenderBloc>(context).add(
                            CalenderCompletedDeletedTaskAdded(
                                index: index, date: date));
                      },
                      onItemRemoved: (int index) {
                        BlocProvider.of<CalenderBloc>(context)
                            .add(CalenderCompletedTaskDeleted(index: index));
                      },
                    ),
                  ),
                );
              } else {
                return const Expanded(child: IndexInitial());
              }
            },
          ),
        ],
      ),
    );
  }
}
