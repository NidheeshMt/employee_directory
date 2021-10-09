import 'package:employee_directory/redux/states/employee_state.dart';
import 'package:flutter/foundation.dart';

@immutable
class AppState {
  final EmployeeState employeeState;
  const AppState({required this.employeeState});

  AppState copyWith({required EmployeeState employeeState}) {
    return AppState(employeeState: employeeState );
  }

  factory AppState.initial() {
    return AppState(employeeState: EmployeeState.initial());
  }
}
