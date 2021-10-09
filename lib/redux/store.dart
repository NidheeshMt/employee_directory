import 'dart:async';
import 'package:employee_directory/redux/reducers/app_reducer.dart';
import 'package:employee_directory/redux/states/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

Future<Store<AppState>> createStore() async {
  // var prefs = await SharedPreferences.getInstance();
  return Store(
    appReducer,
    initialState: AppState.initial(),
    middleware: [thunkMiddleware,],
  );
}
