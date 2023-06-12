import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/components/components.dart';
import '../../../NewsApp/cubit/cubit.dart';
import '../../../NewsApp/cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCubit,NewsStates>(
    listener: (context,state){},
    builder: (context,state){
      var list = NewCubit.get(context).business;
    return articleBuilder(list,context);
  },
    );
  }
}