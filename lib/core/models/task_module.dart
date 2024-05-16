import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:todo_app2/core/DI.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/features/home/view_model/index_bloc/task_management_bloc.dart';

part 'task_module.g.dart';

@HiveType(typeId: 0)
class TaskModule extends HiveObject {
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? description;

  @HiveField(3)
  String? date;

  @HiveField(4)
  String? time;

  @HiveField(5)
  int priority;

  @HiveField(6)
  CategoryModule category = getIt<CategoryModule>();

  void taskClear() {
    title = null;
    description = null;
    date = null;
    time = null;
    priority = 1;
    getIt<CategoryModule>().categoryClear();
  }

  TaskModule(
      {this.title, this.date, this.description, this.priority = 1, this.time});
  factory TaskModule.copy(TaskModule task) {
    TaskModule resultTask = TaskModule();
    resultTask.title = task.title;
    resultTask.description = task.description;
    resultTask.date = task.date;
    resultTask.time = task.time;
    resultTask.priority = task.priority;
    resultTask.category = task.category;
    return resultTask;
  }

  String getDateAndTime() {
    String? date = formatDate(this.date);
    String? time = _getTaskTime();
    if (date == null && time == null) {
      return 'Forever';
    } else if (date != null && time == null) {
      return '$date At 00:00';
    } else {
      return '$date At $time';
    }
  }

  static String? formatDate(String? date) {
    if (date != null) {
      DateTime dateTime = DateTime.parse(date);
      String formattedDate = DateFormat('dd MMMM').format(dateTime);

      if (dateTime.day == DateTime.now().day &&
          dateTime.month == DateTime.now().month) {
        return 'Today';
      }
      return formattedDate;
    } else {
      return null;
    }
  }

  String? _getTaskTime() {
    String? timeString = time;
    if (timeString != null) {
      final List<String> parts = timeString.split(':');
      final String hour = parts[0];
      final String minute = parts[1];
      return '$hour : $minute';
    } else {
      return null;
    }
  }
}

@HiveType(typeId: 1)
class CategoryModule extends HiveObject {
  static final List<CategoryModule> _categories = [
    CategoryModule(
        categoryName: 'Grocery',
        iconCodePoint: Icons.local_grocery_store.codePoint,
        color: AppColors.color2.value),
    CategoryModule(
        categoryName: 'Work',
        iconCodePoint: Icons.work.codePoint,
        color: AppColors.color16.value),
    CategoryModule(
        categoryName: 'Design',
        iconCodePoint: Icons.design_services.codePoint,
        color: AppColors.color12.value),
    CategoryModule(
        categoryName: 'University',
        iconCodePoint: Icons.school.codePoint,
        color: AppColors.primaryColor.value),
    CategoryModule(
        categoryName: 'Social',
        iconCodePoint: Icons.social_distance.codePoint,
        color: AppColors.color6.value),
    CategoryModule(
        categoryName: 'Music',
        iconCodePoint: Icons.music_note.codePoint,
        color: AppColors.color6.value),
    CategoryModule(
        categoryName: 'Health',
        iconCodePoint: Icons.local_hospital.codePoint,
        color: const Color.fromARGB(255, 53, 165, 118).value),
    CategoryModule(
        categoryName: 'Movie',
        iconCodePoint: Icons.movie_creation.codePoint,
        color: AppColors.color13.value),
    CategoryModule(
        categoryName: 'Home',
        iconCodePoint: Icons.home.codePoint,
        color: AppColors.color10.value),
  ];

  @HiveField(0)
  String? categoryName;

  @HiveField(1)
  int? iconCodePoint;

  @HiveField(2)
  int? color;

  CategoryModule({this.categoryName, this.iconCodePoint, this.color});

  void saveTaskCategory() {
    getIt<CategoryModule>().categoryName = categoryName;
    getIt<CategoryModule>().color = color;
    getIt<CategoryModule>().iconCodePoint = iconCodePoint;
  }

  void categoryClear() {
    categoryName = null;
    iconCodePoint = null;
    color = null;
  }

  static void addInitialCategories(BuildContext context) {
    BlocProvider.of<TaskManagementBloc>(context)
        .add(InitialCategoriesAdded(_categories));
  }

  static void getCategories(BuildContext context) {
    BlocProvider.of<TaskManagementBloc>(context).add(CategoriesNeeded());
  }

  factory CategoryModule.copy(CategoryModule category) {
    CategoryModule resultCategory = CategoryModule();
    resultCategory.categoryName = category.categoryName;
    resultCategory.color = category.color;
    resultCategory.iconCodePoint = category.iconCodePoint;
    return resultCategory;
  }
}
