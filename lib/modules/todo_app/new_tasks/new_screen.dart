import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/shared/components/components.dart';
import 'package:untitled2/shared/components/constants.dart';
import 'package:untitled2/shared/cubit/cubit.dart';
import 'package:untitled2/shared/cubit/state.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCupit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCupit.get(context).newTasks;
        return ListView.separated(
            itemBuilder: (context, index) => buildTask(tasks[index], context),
            separatorBuilder: (context, index) => Container(
                  height: 1,
                  color: Colors.grey[300],
                  width: double.infinity,
                ),
            itemCount: tasks.length);
      },
    );
  }
}
