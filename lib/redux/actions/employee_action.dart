import 'package:employee_directory/model/employee_model.dart';
import 'package:employee_directory/services/employee_service.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../app_redux.dart';
import 'common_actions.dart';

class EnquiriesFetchedAction {
  final List<EmployeeModel> employees;

  EnquiriesFetchedAction(this.employees);
}

class SearchForEmployeeAction {
  final String filter;

  SearchForEmployeeAction(this.filter);
}

ThunkAction fetchEmployeesFromNetworkAction() {
  return (Store store) async {
    Future(() async {
      store.dispatch(LoadingAction(
          status: LoadingStatus.loading,
          message: "Getting Coupons",
          type: "Enquiry"));

      EmployeeService().fetchEmployees(onSuccess: (result) {
        store.dispatch(EnquiriesFetchedAction(result));
      }, onException: (exception) {
        store.dispatch(LoadingAction(
          status: LoadingStatus.error,
          message: exception.toString(),
          type: "Enquiry",
        ));
      });
    });
  };
}
