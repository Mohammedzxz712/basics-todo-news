import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/shared/cubit/cubit.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  double radius = 0,
  bool isUpper = true,
  required String text,
  required Function()? function,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        onPressed: function!(),
        child: Text(
          isUpper ? text.toUpperCase() : text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );

Widget defaultFormFailed({
  required TextEditingController controller,
  required TextInputType type,
  final Function? onSubmit,
  final Function? onChange,
  final Function? validate,
  final Function? onTap,
  final bool ispassword = false,
  required String label,
  required IconData prefix,
  IconData? suffix,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: ispassword,
      onFieldSubmitted: onSubmit!(),
      onChanged: onChange!(),
      onTap: onTap!(),
      validator: validate!(),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null ? Icon(suffix) : null,
      ),
    );

Widget buildTask(Map model, context) => Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue[600],
            radius: 40,
            child: Text('${model['time']}'),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${model['title']}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${model['date']}',
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          IconButton(
            onPressed: () {
              AppCupit.get(context).updateDatabase(
                status: 'done',
                id: model['ld'],
              );
            },
            icon: const Icon(Icons.check_box),
            color: Colors.green,
          ),
          IconButton(
            onPressed: () {
              AppCupit.get(context).updateDatabase(
                status: 'archive',
                id: model['ld'],
              );
            },
            icon: const Icon(Icons.archive),
            color: Colors.black45,
          )
        ],
      ),
    );

Widget buildArticlesItems(article, context) => Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: [
          Container(
            //'https://cdni.rt.com/media/pics/2021.04/original/606706b64c59b710536597ae.png'

            height: 120,

            width: 120,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      '${article['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );

Widget myDivider() => Container(
      height: 1,
      color: Colors.grey[300],
      width: double.infinity,
    );

Widget articleBuilder(list, context) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildArticlesItems(list[index], context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: 10),
      fallback: (context) => const Center(child: CircularProgressIndicator()),
    );

void navigatorTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false,
      //(Route<dynamic> route) => false,
    );
