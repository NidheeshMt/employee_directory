import 'package:employee_directory/constants/app_constants.dart';
import 'package:employee_directory/constants/app_themes.dart';
import 'package:employee_directory/redux/app_redux.dart';
import 'package:employee_directory/views/employee_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class App extends StatefulWidget {
  final Store<AppState> store;

  const App({Key? key,required this.store}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    return StoreProvider<AppState>(
        store: widget.store,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppConstants.appName,
          color: Colors.white,
          theme: AppThemes.lightTheme,
          home : const EmployeesPage()
        ));
  }
}
