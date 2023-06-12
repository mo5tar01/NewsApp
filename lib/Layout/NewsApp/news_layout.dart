import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Layout/NewsApp/cubit/cubit.dart';
import 'package:newsapp/Layout/NewsApp/cubit/states.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../modules/news_app/search/search_screen.dart';


class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCubit, NewsStates>(
      listener: (context, state){},
      builder: (context , state){
        var cubit = NewCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
                'News App'
            ),
            actions: [
              IconButton(onPressed: (){
                navigateTo(context, SearchScreen());
              },
                  icon: Icon(Icons.search)),
              IconButton(onPressed: (){
                AppCubit.get(context).changeAppMode();
              },
                  icon: Icon(Icons.brightness_4_outlined))
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNavBar(index);
            },
            items:cubit.bottomItems,
          ),
        );
      },
    );
  }
}
