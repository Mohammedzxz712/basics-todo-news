import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountCubit(),
      child: BlocConsumer<CountCubit, CountStates>(
        listener: (BuildContext context, CountStates state) {
          if (state is CountMinus) {
            print('Minus ${state.counter}');
          }
          if (state is CountPlus) {
            print('Plus ${state.counter}');
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const Text(
              'Counter',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SizedBox(
            height: 1000,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                TextButton(
                    onPressed: () {
                      CountCubit.get(context).minus();
                    },
                    child: const Text(
                      'Minus',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Text(
                    '${CountCubit.get(context).counter}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 50,
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      CountCubit.get(context).plus();
                    },
                    child: const Text(
                      'Plus',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
