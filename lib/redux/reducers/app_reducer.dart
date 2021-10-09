import 'package:employee_directory/redux/states/app_state.dart';

import 'employee_reducer.dart';

AppState appReducer(AppState state, dynamic action) =>
    state.copyWith(employeeState: employeeReducer(state.employeeState,action));
