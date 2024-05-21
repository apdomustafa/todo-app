import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/icons.dart';
import 'package:todo_app2/core/theming/styles.dart';

class TaskEditingItem extends StatelessWidget {
  const TaskEditingItem(
      {super.key,
      required this.icon,
      required this.text,
      this.categoryText,
      this.categoryIconData,
      this.color,
      required this.edit});
  final Icon icon;
  final String text;
  final VoidCallback edit;
  final String? categoryText;
  final int? categoryIconData;
  final int? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 42),
        child: InkWell(
          onTap: edit,
          child: Row(
            children: [
              icon,
              const Gap(10),
              Flexible(
                flex: 2,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    '$text :',
                    style: AppStyles.styleLatoReguler16(context),
                  ),
                ),
              ),
              const Spacer(),
              Flexible(
                flex: 3,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.secondryColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      categoryIconData == null
                          ? const SizedBox()
                          : Flexible(
                              child: Icon(
                                IconData(categoryIconData!,
                                    fontFamily: 'MaterialIcons'),
                                color: Color(color ?? 0xfffffff),
                              ),
                            ),
                      const Gap(10),
                      Flexible(
                        flex: 2,
                        child: Text(
                          categoryText ?? 'Select Category',
                          style: AppStyles.styleLatoReguler12(context),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
