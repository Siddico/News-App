import 'package:flutter/material.dart';
import 'package:news/layout/cubit/status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/business/businessscreen.dart';
import 'package:news/modules/science/sciencescreen.dart';
import 'package:news/modules/sports/sportsscreen.dart';
import 'package:news/network(remote)/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentindex = 0;
  List<BottomNavigationBarItem> bottomitems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business_center_outlined),
      label: "Business",
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports_football_outlined), label: "Sports"),
    BottomNavigationBarItem(
        icon: Icon(Icons.science_outlined), label: "science"),
  ];
  List<Widget> Screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  void ChangeBottomNavBar(int index) {
    currentindex = index;
    if (index == 1) getSports();
    if (index == 2) getScience();
    emit(NewsBottomState());
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> search = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'business',
      'apiKey': '5d9b02d51b0446f3b5095e818afbdb1e',
    }).then((value) {
      // print(value.data['totalResults']);
      business = value!.data['articles'];
      //print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      emit(NewsGetBussinessErrorStata(error.toString()));
      //print(error.toString());
    });
  }

  void getSports() {
    emit(NewsGetSportsLoadingState());
    if (sports.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'sports',
        'apiKey': '5d9b02d51b0446f3b5095e818afbdb1e',
      }).then((value) {
        // print(value.data['totalResults']);
        sports = value!.data['articles'];
        // print(sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        emit(NewsGetSportsErrorStata(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (science.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'science',
        'apiKey': '5d9b02d51b0446f3b5095e818afbdb1e',
      }).then((value) {
        // print(value.data['totalResults']);
        science = value!.data['articles'];
        //print(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        emit(NewsGetScienceErrorStata(error.toString()));
        //print(error.toString());
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    search = [];
    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
    }).then((value) {
      // print(value.data['totalResults']);
      search = value!.data['articles'];
      //print(science[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      emit(NewsGetSearchErrorStata(error.toString()));
      //print(error.toString());
    });
  }

  /* bool isdark = false;
  ThemeMode appmode = ThemeMode.dark;
  void changeAppMode() {
    isdark = !isdark; 
    emit(NewsAppChangeModeState());
  }*/
}
