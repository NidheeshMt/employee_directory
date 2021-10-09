import 'package:employee_directory/redux/actions/common_actions.dart';
import 'package:employee_directory/redux/actions/employee_action.dart';
import 'package:employee_directory/redux/app_redux.dart';

final employeeReducer = combineReducers<EmployeeState>([
  TypedReducer<EmployeeState, LoadingAction>(_changeLoadingStatusAction),
  TypedReducer<EmployeeState, EnquiriesFetchedAction>(_employeeFetchedAction),
  TypedReducer<EmployeeState, SearchForEmployeeAction>(_employeeFilterAction),
]);

EmployeeState _changeLoadingStatusAction(
    EmployeeState state, LoadingAction action) {
  return state.copyWith(
      loadingStatus: LoadingModel(
    loadingStatus: action.status,
    loadingMessage: action.message,
    loadingError: action.message,
    action: action.action,
    actionCallback: action.onAction,
  ));
}

EmployeeState _employeeFetchedAction(
    EmployeeState state, EnquiriesFetchedAction action) {
  return state.copyWith(
      employees: action.employees, loadingStatus: LoadingModel.success());
}

EmployeeState _employeeFilterAction(
    EmployeeState state, SearchForEmployeeAction action) {
  return state.copyWith(searchQuery: action.filter);
}
