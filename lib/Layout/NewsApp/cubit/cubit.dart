import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Layout/NewsApp/cubit/states.dart';
import 'package:newsapp/Layout/modules/news_app/Science/science_screen.dart';

import '../../../shared/cubit/states.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../modules/news_app/Business/business_screen.dart';
import '../../modules/news_app/Sports/sports_screen.dart';

class NewCubit extends Cubit<NewsStates> {
  NewCubit() : super(NewsInitialState());

  static NewCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems =
  [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',

    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',

    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',

    ),

  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index ==1){
      getSports();
    }
    if (index ==2){
      getScience();
    }
    emit(NewsBottomNavState());
  }

  List<dynamic>business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(

        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': 'f3035a0fd53d407481e4527847e7ec73',
        }
    ).then((value){
      //print(value.data['articles'][0]['title']);
      business = value.data['articles'];
      print(business[0].length);
      print(business[0]['title']);
      emit(NewsGetNewsBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetNewsBusinessErrorState(error.toString()));
    });
  }

  List<dynamic>sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingState());
    if (sports.length==0) {
      DioHelper.getData(

          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'sports',
            'apiKey': 'f3035a0fd53d407481e4527847e7ec73',
          }
      ).then((value) {
        //print(value.data['articles'][0]['title']);
        sports = value.data['articles'];
        print(sports[0].length);
        print(sports[0]['title']);
        emit(NewsGetNewsSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetNewsSportsErrorState(error.toString()));
      });
    }
    else{
      emit(NewsGetNewsSportsSuccessState());

    }
  }
  List<dynamic>science = [];
  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (science.length==0) {
      DioHelper.getData(

          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'science',
            'apiKey': 'f3035a0fd53d407481e4527847e7ec73',
          }
      ).then((value) {
        //print(value.data['articles'][0]['title']);
        science = value.data['articles'];
        print(science[0].length);
        print(science[0]['title']);
        emit(NewsGetNewsScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetNewsScienceErrorState(error.toString()));
      });
    }
    else {
      emit(NewsGetNewsScienceSuccessState());
    }
  }
  List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
      DioHelper.getData(

          url: 'v2/everything',
          query: {
            'q': value,
            'apiKey': 'f3035a0fd53d407481e4527847e7ec73',
          }
      ).then((value) {
        //print(value.data['articles'][0]['title']);
        search = value.data['articles'];
        print(search[0].length);
        print(search[0]['title']);
        emit(NewsGetNewsSearchSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetNewsSearchErrorState(error.toString()));
      });
    }
  void changeIndex(int index){
    currentIndex = index;

  }
}