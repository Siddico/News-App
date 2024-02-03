import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Shared/components.dart';
import 'package:news/layout/cubit/cubit.dart';
//import 'package:news/layout/newslayout.dart';
import 'package:news/modules/onbarding/on_boarding_screen.dart';
import 'package:news/network(remote)/dio_helper.dart';
//import 'package:news/network_local/cach_helper.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: News()));
}

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DioHelper.init();
    //CachHelper.init();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => NewsCubit()
              ..getBusiness()
              ..getSports()
              ..getScience())
      ],
      child: MaterialApp(
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primarySwatch: Colors.deepOrange,
              appBarTheme: AppBarTheme(
                  color: Provider.of<ThemeProvider>(context).themeMode == ThemeMode.light
                      ? Colors.white
                      : Color(0xff333739),
                  shadowColor: Provider.of<ThemeProvider>(context).themeMode ==
                          ThemeMode.light
                      ? Colors.white
                      : Color(0xff333739),
                  foregroundColor: Provider.of<ThemeProvider>(context).themeMode ==
                          ThemeMode.light
                      ? Colors.white
                      : Color(0xff333739),
                  surfaceTintColor:
                      Provider.of<ThemeProvider>(context).themeMode == ThemeMode.light
                          ? Colors.white
                          : Color(0xff333739),
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark),
                  //centerTitle: true,
                  elevation: 0,
                  titleTextStyle: TextStyle(
                    color: Provider.of<ThemeProvider>(context).themeMode ==
                            ThemeMode.light
                        ? Color(0xff333739)
                        : Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  elevation: 100,
                  selectedItemColor: Colors.deepOrange,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.white),
              textTheme: TextTheme(
                  bodyText1: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xff333739)))),
          darkTheme: ThemeData(
              scaffoldBackgroundColor: Color(0xff333739),
              primarySwatch: Colors.deepOrange,
              appBarTheme: AppBarTheme(
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Color(0xff333739), statusBarIconBrightness: Brightness.light),
                  backgroundColor: Color(0xff333739),
                  //centerTitle: true,
                  elevation: 0,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
              floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                elevation: 100,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Color(0xff333739),
              ),
              textTheme: TextTheme(bodyText1: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white))),
          themeMode: Provider.of<ThemeProvider>(context).themeMode,
          debugShowCheckedModeBanner: false,
          home: On_Boarding_View()),
    );
  }
}
