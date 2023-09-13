import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/shared/bloc_observer.dart';
import 'package:untitled2/shared/cubit/cubit.dart';
import 'package:untitled2/shared/cubit/state.dart';
import 'package:untitled2/shared/network/local/cash_helper.dart';
import 'package:untitled2/shared/network/remote/dio_helper.dart';
import 'package:untitled2/shared/styles/themes.dart';
import 'layout/news_app/cupit/cupit.dart';
import 'layout/news_app/news_layout.dart';
import 'modules/shop_app/on_boarding/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getBool(key: 'isDark');
  runApp(MyApp(isDark: isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  const MyApp({super.key, this.isDark});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusiness()
            ..getSports()
            ..getScience(),
        ),
        BlocProvider(
          create: (context) => AppCupit()..changeDark(formShared: isDark),
        )
      ],
      child: BlocConsumer<AppCupit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightMode,
            darkTheme: darkMode,
            themeMode:
                AppCupit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}
