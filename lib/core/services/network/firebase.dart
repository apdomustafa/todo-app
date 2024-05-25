import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_app2/core/helpers/failures.dart';
import 'package:todo_app2/core/models/task_module.dart';

class FirebaseService {
  final User? _user = FirebaseAuth.instance.currentUser;

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
    if (_user != null) {
      String uid = _user.uid;

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

  Future<void> setUserName(String userName) async {
    User? user = FirebaseAuth.instance.currentUser;
    try {
      if (user != null) {
        String uid = user.uid;
        await taskCollection.doc(uid).set({'userName': userName});
      } else {
        throw FirebaseAuthException(
          code: 'user-not-found',
          message: 'User is not authenticated.',
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getUserName() async {
    String userName = '';
    User? user = FirebaseAuth.instance.currentUser;

    try {
      if (user != null) {
        String uid = user.uid;
        DocumentSnapshot userDataSnapshot = await taskCollection.doc(uid).get();
        if (userDataSnapshot.exists && userDataSnapshot.data() != null) {
          Map<String, dynamic> data =
              userDataSnapshot.data() as Map<String, dynamic>;
          userName = data['userName'];
        } else {
          userName = user.displayName ?? 'user name';
        }
        return userName;
      } else {
        throw FirebaseAuthException(
          code: 'user-not-found',
          message: 'User is not authenticated.',
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _reauthenticate(String currentPassword) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null && user.email != null) {
      // Re-authenticate the user
      print(user.email);
      print(currentPassword);
      AuthCredential credential = EmailAuthProvider.credential(
        email: user.email!,
        password: currentPassword,
      );
      await user.reauthenticateWithCredential(credential);
    }
  }

  Future<Either<Failure, void>> updatePass(
      String currentPassword, String newPassword) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        await _reauthenticate(currentPassword);
        await user.updatePassword(newPassword);
      } on FirebaseAuthException catch (e) {
        return left(FirebaseFailure.fromFirebaseAuthException(e));
      } catch (e) {
        left(FirebaseFailure(message: 'error'));
      }
    }
    return right(null);
  }

  void saveUserImage(File userImage) {
    User? user = FirebaseAuth.instance.currentUser;

    try {
      FirebaseStorage.instance.ref().child(user!.uid).putFile(userImage);
    } on Exception catch (e) {
      rethrow;
    }
  }

  void logOut() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    User? user = auth.currentUser;

    if (user != null) {
      for (UserInfo userInfo in user.providerData) {
        switch (userInfo.providerId) {
          case 'google.com':
            await googleSignIn.signOut();
            break;
          case 'password':
            await auth.signOut();
            break;
          // Add more cases if you are using other providers (e.g., Facebook, Twitter).
        }
      }
    }
  }
}
