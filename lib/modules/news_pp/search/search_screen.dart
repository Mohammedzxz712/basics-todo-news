import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/layout/news_app/cupit/cupit.dart';
import 'package:untitled2/layout/news_app/cupit/states.dart';
import 'package:untitled2/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                onChanged: (value) {
                  NewsCubit.get(context).getSearch(value);
                },
                controller: searchController,
                validator: (value) {
                  if (value!.isEmpty) {
                    print('search must not be empty');
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'search',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(child: articleBuilder(list, context)),
          ]),
        );
      },
    );
  }
}
