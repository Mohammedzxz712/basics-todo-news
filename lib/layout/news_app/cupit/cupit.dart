import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/layout/news_app/cupit/states.dart';
import 'package:untitled2/shared/network/remote/dio_helper.dart';

import '../../../modules/news_pp/business/business_screen.dart';
import '../../../modules/news_pp/science/science_screen.dart';
import '../../../modules/news_pp/setting/setting_screen.dart';
import '../../../modules/news_pp/sports/sports_screen.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingScreen()
  ];
  List<BottomNavigationBarItem> bottoms = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: 'business'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'sports'),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: 'science'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: 'settings'),
  ];
  void changeBottomNavigation(int index) {
    currentIndex = index;
    emit(NewsChangeBottomNavigationState());
  }

  List<dynamic> business = [];
  void getBusiness() {
    {
      emit(NewLoadingGetBusinessSuccessState());
      DioHelper.getData(url: 'v2/everything', query: {
        'q': 'Business',
        'apiKey': '2078b7a8f5844429aaa5da7936353c1a'
        //
        //65f7f556ec76449fa7dc7c0069f040ca
      }).then((value) {
        business = value?.data['articles'];
        // print(business[0]['title']);
        emit(NewGetBusinessSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewGetBusinessErrorState(error.toString()));
      });
    }
  }

  List<dynamic> sports = [];
  void getSports() {
    {
      emit(NewLoadingGetSportsSuccessState());
      DioHelper.getData(url: 'v2/everything', query: {
        'q': 'sport',
        'apiKey': '2078b7a8f5844429aaa5da7936353c1a'
      }).then((value) {
        sports = value?.data['articles'];
        // print(sports[0]['title']);
        emit(NewGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewGetSportsErrorState(error.toString()));
      });
    }
  }

  List<dynamic> science = [];
  void getScience() {
    {
      //v2/top-headlines?country=us
      emit(NewLoadingGetScienceSuccessState());
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'us',
        //'q': 'Science',
        'apiKey': '2078b7a8f5844429aaa5da7936353c1a'
      }).then((value) {
        science = value?.data['articles'];
        // print(science[0]['title']);
        emit(NewGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewGetScienceErrorState(error.toString()));
      });
    }
  }

  List<dynamic> search = [];
  void getSearch(String value) {
    {
      emit(NewLoadingGetSportsSuccessState());
      DioHelper.getData(url: 'v2/everything', query: {
        'q': '$value',
        'apiKey': '2078b7a8f5844429aaa5da7936353c1a'
      }).then((value) {
        search = value?.data['articles'];
        // print(sports[0]['title']);
        emit(NewGetSearchSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewGetSearchErrorState(error.toString()));
      });
    }
  }
}
