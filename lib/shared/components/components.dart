
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../Layout/modules/news_app/web_view/web_view_screen.dart';
import '../cubit/cubit.dart';

Widget defaultButton({
 double width = double.infinity,
  Color background = Colors.blue,
  double radius = 3.0,
  required Function buttonPressed,
  required String text,


}) => Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: background,
  ),
width: width,

child: MaterialButton(
onPressed:(){},
child: Text(
text.toUpperCase(),
style:TextStyle(
color:Colors.white,
),
),

),
);
Widget roundedButton({

  double width =double.infinity,
  Color background = Colors.blue,
  double radius = 20.0,
  required Function buttonPressed,
  required String text,

}) =>
    Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: background,
  ),
width: width,

child: MaterialButton(
onPressed:(){},
child: Text(
text.toUpperCase(),
style:TextStyle(
color:Colors.white,
),
),

),
);
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
   onTap,
  onSubmit,
  onChange,
  required String labelText,
  required IconData prefix,
  required validate,
  IconData? suffix,
  isClickable = true,
}) => TextFormField(
controller: controller,
keyboardType: type,
onTap:onTap,
  validator: validate,
  onFieldSubmitted: onSubmit,
  onChanged: onChange,
  enabled: isClickable,

  decoration: InputDecoration(
    labelText: labelText,
    prefixIcon: Icon(prefix,),
    suffixIcon: Icon(suffix,),
    border: OutlineInputBorder(),


  ),

);
Widget roundedFormField({
  required TextEditingController controller,
  required TextInputType type,
   onTap,
  onSubmit,
  onChange,
  required String labelText,
  required IconData prefix,
  IconData? suffix,
  required validate,
  Function? suffixPressed,
   isClickable = true,
}) => TextFormField(
controller: controller,
keyboardType: type,
onTap:onTap,
  validator: validate,
  onFieldSubmitted: onSubmit,
  onChanged: onChange,
  enabled: isClickable,

  decoration: InputDecoration(
    labelText: labelText,
    prefixIcon: Icon(prefix,),
    suffixIcon: Icon(suffix,),

    border: OutlineInputBorder(
      borderSide:
      BorderSide(width: 3, color: Colors.greenAccent),
      borderRadius: BorderRadius.circular(50.0),
    ),


  ),

);

Widget buildTaskItem(Map model, context)=> Dismissible(
  key: Key(model['id'].toString()),
  child: Padding(
  
    padding: const EdgeInsets.all(20.0),
  
    child: Row(
  
      children: [
  
        CircleAvatar(
  
          backgroundColor: Colors.blueAccent,
  
          radius: 40.0,
  
          child: Text(
  
            '${model['time']} ',
  
          ),
  
        ),
  
        SizedBox(
  
          width: 20.0,
  
        ),
  
        Expanded(
  
          child: Column(
  
            mainAxisSize:MainAxisSize.min ,
  
            crossAxisAlignment: CrossAxisAlignment.start,
  
            children: [
  
               Text(
  
                  '${model['title']}',
  
                  style: TextStyle(
  
                    fontSize: 18.0,
  
                    fontWeight: FontWeight.bold,
  

  
                ),
  
              ),
  
              Text(
  
                '${model['date']}',
  
                style: TextStyle(
  
                  color: Colors.grey,
  
                ),
  
              ),
  
  
  
            ],
  
          ),
  
        ),
  
        SizedBox(
  
          width: 20.0,
  
        ),
  
        IconButton(
  
            onPressed: (){
  
  
  
              AppCubit.get(context).updateDate(status: 'done', id: model['id'],);
  
  
  
            },
  
            icon : Icon(
  
              Icons.check_box,
  
              color: Colors.green,
  
            ),
  
  
  
  
  
          ),
  
        IconButton(
  
          onPressed: (){
  
  AppCubit.get(context).updateDate(status: 'archived', id: model['id'],);
  
  
  
          },
  
          icon: Icon(
  
            Icons.archive,
  
            color:Colors.black45,
  
          )
  
          ,),
  
  
  
  
  
      ],
  
    ),
  
  ),
  onDismissed: (direction){
    AppCubit.get(context).deleteDate(id: model['id'],
    );

  },
);
Widget tasksBuilder({
 required  List<Map> tasks,}) => ConditionalBuilder(
  condition: tasks.length  >0,
  builder: (context) => ListView.separated(
      itemBuilder: (context, index) => buildTaskItem(tasks[index] , context),
      separatorBuilder: (context, index) => myDivider(),
      itemCount: tasks.length),
  fallback: (context) => Center(
    child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children:[
          Icon(
            Icons.menu,
            size: 100,
            color:Colors.grey,
          ),
          Text(
            'No Tasks Yet , Please Add Some Tasks',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ]
    ),
  ),
);

Widget myDivider() =>Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);
Widget buildArticleItem(article,context) => InkWell(
  onTap:(){
    navigateTo(context, WebViewScreen(article['url']),);
  },
  child:   Padding(



    padding: const EdgeInsets.all(20.0),



    child: Row(



      children: [



        Container(



          width: 120,



          height: 120,



          decoration: BoxDecoration(



              borderRadius: BorderRadius.circular(10.0,),



              image: DecorationImage(



                  image: NetworkImage('${article['urlToImage']}'),



                  fit: BoxFit.cover



              )



          ),



        ),



        SizedBox(



          width: 20.0,



        ),



        Expanded(



          child: Container(



            height: 120.0,



            child: Column(



              crossAxisAlignment: CrossAxisAlignment.start,



              mainAxisAlignment: MainAxisAlignment.start,



              children: [



                Expanded(



                  child: Text(



            '${article['title']}',



                    style: Theme.of(context).textTheme.bodyText1,



                    maxLines: 3,



                    overflow: TextOverflow.ellipsis ,



                  ),



                ),



                Text(



                  '${article['publishedAt']}',



                  style: TextStyle(



                    color: Colors.grey,



                  ),



                )



              ],



            ),



          ),



        )



      ],



    ),



  ),
);
Widget articleBuilder(list,context,{isSearch = false}) => ConditionalBuilder(
  condition: list.length >0,
  builder: (context)=>ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context , index)=> buildArticleItem(list[index] , context),
    separatorBuilder: (context , index) => myDivider(),
    itemCount: 10,) ,
  fallback: (context)=> isSearch?Container() : Center(child: CircularProgressIndicator()),

);
void navigateTo(context , widget) => Navigator.push(
  context, MaterialPageRoute(
    builder: (context) => widget
  ),
);
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget,),
        (Route<dynamic> route) => false,);
