// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Shared/components.dart';
import 'package:news/layout/cubit/cubit.dart';
import 'package:news/layout/cubit/status.dart';

class SearchScreen extends StatelessWidget {
  var SearchController = TextEditingController();
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).search;
          return Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: defaultFormField(
                      controller: SearchController,
                      type: TextInputType.text,
                      label: "Search",
                      context: context,
                      onChanged: (value) {
                        NewsCubit.get(context).getSearch(value);
                      },
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return "Search Must Not Be Empty";
                        }
                        return null;
                      },
                      prefix: Icons.search),
                ),
                Expanded(child: articleBuilder(list, context, issearch: true))
              ],
            ),
          );
        });
  }
}
