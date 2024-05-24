import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:todo_app2/core/DI.dart';
import 'package:todo_app2/core/models/task_module.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/styles.dart';
import 'package:todo_app2/features/home/view_model/index_bloc/task_management_bloc.dart';
import 'package:todo_app2/features/home/views/helper_method/error_dialog.dart';
import 'package:todo_app2/features/home/views/widgets/add_category_bottom_part.dart';
import 'package:todo_app2/features/home/views/widgets/category_icon_with_remove.dart';
import 'package:todo_app2/features/home/views/widgets/category_icons.dart';
import 'package:todo_app2/features/home/views/widgets/category_name_text_field.dart';
import 'package:todo_app2/features/home/views/widgets/choose_icon_button.dart';
import 'package:todo_app2/features/home/views/widgets/color_items.dart';

class AddCategoryView extends StatefulWidget {
  const AddCategoryView({super.key});

  @override
  State<AddCategoryView> createState() => _AddCategoryViewState();
}

class _AddCategoryViewState extends State<AddCategoryView> {
  bool _iconIsSelected = false;
  IconData? _icon;
  Color? _color;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: 24,
                right: 24,
                top: 48,
                bottom: MediaQuery.of(context).viewInsets.bottom + 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.start,
                  'Create new category',
                  style: AppStyles.styleLatoBold20(context),
                ),
                const Gap(20),
                Text(
                  'Category name :',
                  style: AppStyles.styleLatoReguler16(context),
                ),
                const Gap(16),
                CategoryNameTF(
                  controller: _controller,
                ),
                const Gap(20),
                Text(
                  'Category icon :',
                  style: AppStyles.styleLatoReguler16(context),
                ),
                const Gap(16),
                _iconIsSelected
                    ? CategoryIconWithRemove(
                        icon: _icon,
                        removeIcon: () {
                          setState(() {
                            _iconIsSelected = false;
                          });
                        })
                    : ChooseIconButton(
                        selectIcon: () {
                          selectCategoryIcon(context, (selectedIcon) {
                            if (selectedIcon != null) {
                              setState(() {
                                setState(() {
                                  _iconIsSelected = true;
                                  _icon = selectedIcon;
                                });
                              });
                            }
                          });
                        },
                      ),
                const Gap(20),
                Text(
                  'Category color :',
                  style: AppStyles.styleLatoReguler16(context),
                ),
                const Gap(16),
                ColorItems(
                  selectedColor: (selectedColor) {
                    _color = selectedColor;
                  },
                ),
                SizedBox(
                  height: 190.h,
                ),
                AddCategoryBottomPart(
                  addCategoryPressed: () {
                    saveCategory(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveCategory(BuildContext context) {
    if (_controller.text.isEmpty) {
      showErrorDialog(context, 'please enter category family');
    } else if (_icon == null) {
      showErrorDialog(context, 'please enter category icon');
    } else if (_color == null) {
      showErrorDialog(context, 'please enter category color');
    } else {
      getIt<CategoryModule>().categoryName = _controller.text;
      getIt<CategoryModule>().color = _color!.value;
      getIt<CategoryModule>().iconCodePoint = _icon!.codePoint;
      CategoryModule category = CategoryModule.copy(getIt<CategoryModule>());
      BlocProvider.of<TaskManagementBloc>(context).add(CategoryAdded(category));
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
