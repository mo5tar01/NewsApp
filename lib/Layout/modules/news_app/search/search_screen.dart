import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/components/components.dart';
import '../../../NewsApp/cubit/cubit.dart';
import '../../../NewsApp/cubit/states.dart';

class SearchScreen extends StatelessWidget{
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
return BlocConsumer<NewCubit , NewsStates>(
  listener: (context,state){},
  builder: (context,state)
  {
    var list = NewCubit.get(context).search;
    return Scaffold(

      appBar: AppBar(),

      body:Column(

        children: [

          Padding(

            padding: const EdgeInsets.all(20.0),

            child: defaultFormField(

              controller: searchController,

              type: TextInputType.text,

              onChange: (value){
                NewCubit.get(context).getSearch(value);
                },

              labelText: 'Search',

              prefix: Icons.search,

              validate: (value) {

                if (value.isEmpty) {

                  return 'title must mot be empty';

                }

                return null;

              },

            ),

          ),

          Expanded(child: articleBuilder(list, context, isSearch :true ))

        ],

      ) ,

    );
  },
);
  }
}