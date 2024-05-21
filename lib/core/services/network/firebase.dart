import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app2/core/models/task_module.dart';

class FirebaseService {
  final User? user = FirebaseAuth.instance.currentUser;

  CollectionReference taskCollection =
      FirebaseFirestore.instance.collection('tasks');

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        // options: const FirebaseOptions(
        //     apiKey: "AIzaSyDCPcZ_udKbrls9bu15LbVuj147FRuYpYU",
        //     appId: "1:440556450736:web:2a1c8dc3a32e10cc8bdc75",
        //     messagingSenderId: "440556450736",
        //     projectId: "todo-1ed2c"),
        );
  }

  Future<void> sendAllTasks(
      {required List<TaskModule> tasks,
      required List<TaskModule> completedTasks,
      required List<CategoryModule> categories}) async {
    if (user != null) {
      String uid = user!.uid;

      List<Map<String, dynamic>> tasksJson =
          tasks.map((task) => task.toJson()).toList();

      List<Map<String, dynamic>> completedTasksJson =
          completedTasks.map((task) => task.toJson()).toList();

      List<Map<String, dynamic>> categoriesJson =
          categories.map((category) => category.toJson()).toList();

      await taskCollection
          .doc(uid)
          .collection('all tasks')
          .doc('tasks')
          .set({'uncompleted tasks': tasksJson});
      await taskCollection
          .doc(uid)
          .collection('all tasks')
          .doc('completed tasks')
          .set({'completed tasks': completedTasksJson});
      await taskCollection
          .doc(uid)
          .collection('all tasks')
          .doc('caterories')
          .set({'categories': categoriesJson});
    }
  }

  Future<List<TaskModule>> getUncompletedTasks() async {
    try {
      // Assuming you already have user authentication handled
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String uid = user.uid;

        CollectionReference taskCollection =
            FirebaseFirestore.instance.collection('tasks');
        DocumentSnapshot allTasksSnapshot = await taskCollection
            .doc(uid)
            .collection('all tasks')
            .doc('tasks')
            .get();

        // Initialize empty lists to store tasks
        List<TaskModule> tasks = [];

        // Check if the 'uncompleted tasks' document exists and has data
        if (allTasksSnapshot.exists && allTasksSnapshot.data() != null) {
          Map<String, dynamic> data =
              allTasksSnapshot.data()! as Map<String, dynamic>;

          List<dynamic> tasksData = data['uncompleted tasks'];

          // Convert each task data into TaskModule objects
          tasks = tasksData
              .map((taskData) => TaskModule.fromJson(taskData))
              .toList();
        }

        return tasks;
      } else {
        throw FirebaseAuthException(
          code: 'user-not-found',
          message: 'User is not authenticated.',
        );
      }
    } catch (e) {
      print('Error fetching tasks: $e');
      rethrow;
    }
  }

  Future<List<TaskModule>> getCompletedTasks() async {
    try {
      // Assuming you already have user authentication handled
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String uid = user.uid;

        CollectionReference taskCollection =
            FirebaseFirestore.instance.collection('tasks');
        DocumentSnapshot allTasksSnapshot = await taskCollection
            .doc(uid)
            .collection('all tasks')
            .doc('completed tasks')
            .get();

        // Initialize empty lists to store tasks
        List<TaskModule> completedTasks = [];

        // Check if the 'uncompleted tasks' document exists and has data
        if (allTasksSnapshot.exists && allTasksSnapshot.data() != null) {
          Map<String, dynamic> data =
              allTasksSnapshot.data()! as Map<String, dynamic>;

          List<dynamic> tasksData = data['completed tasks'];

          // Convert each task data into TaskModule objects
          completedTasks = tasksData
              .map((taskData) => TaskModule.fromJson(taskData))
              .toList();
        }

        return completedTasks;
      } else {
        throw FirebaseAuthException(
          code: 'user-not-found',
          message: 'User is not authenticated.',
        );
      }
    } catch (e) {
      print('Error fetching tasks: $e');
      rethrow;
    }
  }

  Future<List<CategoryModule>> getCategories() async {
    try {
      // Assuming you already have user authentication handled
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String uid = user.uid;

        CollectionReference taskCollection =
            FirebaseFirestore.instance.collection('tasks');
        DocumentSnapshot allTasksSnapshot = await taskCollection
            .doc(uid)
            .collection('all tasks')
            .doc('categories')
            .get();

        // Initialize empty lists to store tasks
        List<CategoryModule> categories = [];

        // Check if the 'uncompleted tasks' document exists and has data
        if (allTasksSnapshot.exists && allTasksSnapshot.data() != null) {
          Map<String, dynamic> data =
              allTasksSnapshot.data()! as Map<String, dynamic>;

          List<dynamic> tasksData = data['categories'];

          // Convert each task data into TaskModule objects
          categories = tasksData
              .map((taskData) => CategoryModule.fromJson(taskData))
              .toList();
        }

        return categories;
      } else {
        throw FirebaseAuthException(
          code: 'user-not-found',
          message: 'User is not authenticated.',
        );
      }
    } catch (e) {
      print('Error fetching tasks: $e');
      rethrow;
    }
  }
}
