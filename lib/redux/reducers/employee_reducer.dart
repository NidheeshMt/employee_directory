import 'package:employee_directory/redux/actions/common_actions.dart';
import 'package:employee_directory/redux/app_redux.dart';
import 'package:employee_directory/redux/states/app_state.dart';

final employeeReducer =  combineReducers<EmployeeState>([
TypedReducer<EmployeeState, LoadingAction>(_changeLoadingStatusAction),
]);
EmployeeState _changeLoadingStatusAction(EmployeeState state, LoadingAction action) {
  return state.copyWith(
      loadingStatus: LoadingModel(
        loadingStatus: action.status,
        loadingMessage: action.message,
        loadingError: action.message,
        action: action.action,
        actionCallback: action.onAction,
      ));
}
