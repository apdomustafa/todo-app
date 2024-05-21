import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app2/core/DI.dart';
import 'package:todo_app2/core/helpers/constants.dart';
import 'package:todo_app2/core/models/task_module.dart';
import 'package:todo_app2/features/home/view_model/index_bloc/task_management_bloc.dart';
import 'package:todo_app2/features/home/views/widgets/catgory_picker_item.dart';

class CategoryPickerItems extends StatefulWidget {
  const CategoryPickerItems({super.key, required this.getCategroy});
  final void Function(CategoryModule category) getCategroy;

  @override
  State<CategoryPickerItems> createState() => _CategoryPickerItemsState();
}

class _CategoryPickerItemsState extends State<CategoryPickerItems> {
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskManagementBloc, TaskManagementState>(
        buildWhen: (previous, current) =>
            current is CategoriesGettingSuccessState,
        builder: (context, state) {
          if (state is CategoriesGettingSuccessState) {
            return SizedBox(
              height: 224,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2 / 3,
                    mainAxisSpacing: 16.h,
                    crossAxisSpacing: 49.w),
                children: List.generate(state.categories.length, (index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedItem = index;
                        widget.getCategroy(state.categories[index]);
                      });
                    },
                    child: CategoryPickerItem(
                      isSelected: selectedItem == index,
                      catrgoryName: state.categories[index].categoryName!,
                      colorValue: state.categories[index].color!,
                      iconCodePoint: state.categories[index].iconCodePoint!,
                    ),
                  );
                }),
              ),
            );
          } else {
            return const Center(
              child: Text('error'),
            );
          }
        });
  }
}
