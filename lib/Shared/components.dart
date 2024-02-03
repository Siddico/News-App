import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news/modules/web/webview.dart';
import 'package:provider/provider.dart';

Widget buildArticleItem(article, context) => InkWell(
      onTap: () {
        NavigateTo(
          context,
          WebViewScreen(article['url']),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    color: Provider.of<ThemeProvider>(context).themeMode ==
                            ThemeMode.light
                        ? Colors.white
                        : Color(0xff333739),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage('${article['urlToImage']}'),
                        fit: BoxFit.cover))),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                color: Provider.of<ThemeProvider>(context).themeMode ==
                        ThemeMode.light
                    ? Colors.white
                    : Color(0xff333739),
                height: 120,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',

                        style: TextStyle(
                          color:
                              Provider.of<ThemeProvider>(context).themeMode ==
                                      ThemeMode.light
                                  ? Color(0xff333739)
                                  : Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),

                        // Theme.of(context).textTheme.bodyText1,

                        maxLines: 3,

                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${article['description']}',

                        style: TextStyle(
                          color:
                              Provider.of<ThemeProvider>(context).themeMode ==
                                      ThemeMode.light
                                  ? Color(0xff333739)
                                  : Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),

                        // Theme.of(context).textTheme.bodyText1,

                        maxLines: 2,

                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      child: Text(
                        '${article['publishedAt']}',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w200,
                          color:
                              Provider.of<ThemeProvider>(context).themeMode ==
                                      ThemeMode.light
                                  ? Color(0xff333739)
                                  : Colors.white,
                        ),
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

Widget articleBuilder(List? list, context, {issearch = false}) =>
    ConditionalBuilder(
        condition: list != null && list.length > 0,
        builder: (context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: ((context, index) =>
                buildArticleItem(list[index], context)),
            separatorBuilder: ((context, index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(
                    height: 1,
                  ),
                )),
            itemCount: list!.length),
        fallback: (context) => issearch
            ? Container()
            : Center(child: CircularProgressIndicator()));

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;
  toggleThemeMode() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged? onSubmit,
  bool isPassword = false,
  ValueChanged? onChanged,
  GestureTapCallback? onTap,
  FormFieldValidator<String>? validate,
  required String label,
  IconData? prefix,
  IconData? suffix,
  VoidCallback? suffixPressed,
  bool isClickable = true,
  bool underLine = true,
  required var context,
}) =>
    Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        onFieldSubmitted: onSubmit,
        onChanged: onChanged,
        validator: validate,
        onTap: onTap,
        enabled: isClickable,
        style: TextStyle(
          fontSize: 18,
          color:
              Provider.of<ThemeProvider>(context).themeMode == ThemeMode.light
                  ? Color(0xff333739)
                  : Colors.white,
        ),
        decoration: InputDecoration(
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                color: Colors.red,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.red)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                color: Provider.of<ThemeProvider>(context).themeMode ==
                        ThemeMode.light
                    ? Color(0xff333739)
                    : Colors.white,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                color: Provider.of<ThemeProvider>(context).themeMode ==
                        ThemeMode.light
                    ? Color(0xff333739)
                    : Colors.deepOrange,
              )),
          labelStyle: TextStyle(
            color:
                Provider.of<ThemeProvider>(context).themeMode == ThemeMode.light
                    ? Color(0xff333739)
                    : Colors.white,
          ),
          labelText: label,

          prefixIcon: Icon(
            prefix,
            color:
                Provider.of<ThemeProvider>(context).themeMode == ThemeMode.light
                    ? Color(0xff333739)
                    : Colors.white,
            // color: DocCubit.get(context).isDark
            //   ? Colors.white
            // : Colors.black.withOpacity(.5),
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(
                    suffix, color: Colors.black,
                    // color: DocCubit.get(context).isDark
                    //   ? Colors.white
                    // : Colors.black.withOpacity(.5),
                  ),
                )
              : null,

          //underLine ? UnderlineInputBorder() : InputBorder.none,
        ),
      ),
    );

void NavigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
