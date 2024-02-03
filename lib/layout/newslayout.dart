import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Shared/components.dart';
import 'package:news/layout/cubit/cubit.dart';
import 'package:news/layout/cubit/status.dart';
import 'package:news/modules/search/searchscreen.dart';
import 'package:provider/provider.dart';
//import 'package:news/network(remote)/dio_helper.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var Cubit = NewsCubit.get(context);
        return Scaffold(
          backgroundColor:
              Provider.of<ThemeProvider>(context).themeMode == ThemeMode.light
                  ? Colors.white
                  : Color(0xff333739),
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "World News",
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    NavigateTo(context, SearchScreen());
                  },
                  icon: Icon(
                    Icons.search,
                  )),
              IconButton(
                  onPressed: () {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleThemeMode();
                  },
                  icon: Icon(Icons.dark_mode_outlined))
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: Cubit.bottomitems,
            onTap: (index) {
              Cubit.ChangeBottomNavBar(index);
            },
            currentIndex: Cubit.currentindex,
          ),
          body: Center(child: Cubit.Screens[Cubit.currentindex]),
        );
      },
    );
  }
}
