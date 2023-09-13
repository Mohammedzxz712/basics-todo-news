import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled2/shared/cubit/state.dart';
import 'package:untitled2/shared/network/local/cash_helper.dart';
import '../../modules/todo_app/archive_tasks/archive_screen.dart';
import '../../modules/todo_app/done_tasks/done_screen.dart';
import '../../modules/todo_app/new_tasks/new_screen.dart';

class AppCupit extends Cubit<AppStates> {
  AppCupit() : super(AppInitialStates());

  static AppCupit get(context) => BlocProvider.of(context);
  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];
  int currentIndex = 0;
  List<Widget> screens = [
    const NewScreen(),
    const DoneScreen(),
    const ArchiveScreen()
  ];

  void changeNavBarButtum(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavStates());
  }

  Database? database;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archiveTasks = [];

  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database
            .execute(
                'CREATE TABLE tasks (ld INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
            .then((value) {
          print('table created');
        }).catchError((error) {
          'error when create table ${error.toString()}';
        });
      },
      onOpen: (database) {
        getDatabase(database);
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseStates());
    });
  }

  insertDatabase({
    required String title,
    required String date,
    required String time,
  }) async {
    await database!.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO tasks (title , date , time , status ) VALUES("$title","$date","$time","new")')
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertDatabaseStates());
        getDatabase(database);
      }).catchError((error) {
        print('error when inserting data ${error.toString()}');
      });

      return null;
    });
  }

  bool isBottomSheetSown = false;
  IconData fabIcon = Icons.edit;
  changeBottomSheetState({required bool isShow, required IconData icon}) {
    isBottomSheetSown = isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetStates());
  }

  void getDatabase(database) {
    newTasks = [];
    doneTasks = [];
    archiveTasks = [];
    database.rawQuery('SELECT * FROM tasks ').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new') {
          newTasks.add(element);
        } else if (element['status'] == 'done') {
          doneTasks.add(element);
        } else if (element['status'] == 'archive') {
          archiveTasks.add(element);
        }
      });
      emit(AppGetDatabaseStates());
    });
  }

  void updateDatabase({
    required String status,
    required int id,
  }) async {
    database!.rawUpdate('UPDATE tasks SET status = ? WHERE ld = ?',
        ['$status', id]).then((value) {
      getDatabase(database);
      emit(AppUpdateDatabaseStates());
    });
  }

  bool isDark = false;
  void changeDark({bool? formShared}) {
    if (formShared != null) {
      isDark = formShared;
      emit(AppChangeModeStates());
    } else {
      isDark = !isDark;
      CacheHelper.putBool(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeStates());
      });
    }
  }
}

////////////////////////////////////
// Future<void> updateDatabase({
//   required String status,
//   required int? id,
// }) async {
//   if (database == null || id == null) {
//     return;
//   }
//
//   final rowsUpdated = await database!.rawUpdate(
//     'UPDATE tasks SET status = ? WHERE id = ?',
//     ['$status', id],
//   );
//
//   if (rowsUpdated == 1) {
//     emit(AppUpdateDatabaseStates());
//   }
// }
