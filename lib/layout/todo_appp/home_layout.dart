import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled2/shared/components/components.dart';
import 'package:untitled2/shared/cubit/cubit.dart';
import 'package:untitled2/shared/cubit/state.dart';

import '../../shared/components/constants.dart';

class HomeLayout extends StatelessWidget {
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCupit()..createDatabase(),
      child: BlocConsumer<AppCupit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if (state is AppInsertDatabaseStates) {
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, AppStates state) {
          AppCupit cupit = AppCupit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(cupit.titles[cupit.currentIndex]),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                if (cupit.isBottomSheetSown) {
                  if (formKey.currentState!.validate()) {
                    cupit
                        .insertDatabase(
                      date: dateController.text,
                      time: timeController.text,
                      title: titleController.text,
                    )
                        ?.then((value) {
                      // Navigator.pop(context);
                      cupit.changeBottomSheetState(
                          icon: Icons.edit, isShow: false);
                      // isBottomSheetSown = false;
                      // setState(() {
                      //   fabIcon = ;
                      // });
                    });
                  }
                } else {
                  scaffoldKey.currentState
                      ?.showBottomSheet(
                        (context) => Container(
                          color: Colors.grey[100],
                          padding: const EdgeInsetsDirectional.all(20),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: titleController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'title must required';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Task Title',
                                      prefixIcon: Icon(Icons.title)),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  onTap: () {
                                    showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now())
                                        .then((value) {
                                      timeController.text =
                                          value!.format(context).toString();
                                      print(value?.format(context));
                                    });
                                  },
                                  keyboardType: TextInputType.datetime,
                                  controller: timeController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'time must required';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Task time',
                                      prefixIcon:
                                          Icon(Icons.watch_later_outlined)),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  onTap: () {
                                    showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(2026))
                                        .then((value) {
                                      dateController.text = DateFormat()
                                          .add_yMMMd()
                                          .format(value!);
                                    });
                                  },
                                  keyboardType: TextInputType.datetime,
                                  controller: dateController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'date must required';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Task Date',
                                      prefixIcon: Icon(Icons.calendar_today)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .closed
                      .then((value) {
                    cupit.changeBottomSheetState(
                        isShow: false, icon: Icons.edit);
                    // isBottomSheetSown = false;
                    // setState(() {
                    //   fabIcon = Icons.edit;
                    // });
                  });
                  cupit.changeBottomSheetState(isShow: true, icon: Icons.add);
                  // isBottomSheetSown = true;
                  // setState(() {
                  //   fabIcon = Icons.add;
                  // });
                }
              },
              child: Icon(cupit.fabIcon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cupit.currentIndex,
              onTap: (index) {
                cupit.changeNavBarButtum(index);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outline), label: 'done'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined), label: 'archive')
              ],
            ),
            body: ConditionalBuilder(
              builder: (context) => cupit.screens[cupit.currentIndex],
              condition: true,
              fallback: (context) =>
                  const Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }

  // Future<String> getName() async {
  //   return 'Mohammed Abdullah';
  // }
}
