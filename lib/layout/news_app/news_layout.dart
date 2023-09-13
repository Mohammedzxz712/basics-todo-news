import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/layout/news_app/cupit/cupit.dart';
import 'package:untitled2/layout/news_app/cupit/states.dart';

import 'package:untitled2/shared/components/components.dart';
import 'package:untitled2/shared/cubit/cubit.dart';
import 'package:untitled2/shared/network/remote/dio_helper.dart';

import '../../modules/news_pp/search/search_screen.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title: const Text(
                'NewsApp',
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    navigatorTo(context, SearchScreen());
                  },
                ),
                IconButton(
                    onPressed: () {
                      AppCupit.get(context).changeDark();
                    },
                    icon: const Icon(Icons.brightness_4_outlined))
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavigation(index);
              },
              items: cubit.bottoms,
            ));
      },
    );
  }
}
