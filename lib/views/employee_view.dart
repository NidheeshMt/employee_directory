import 'package:employee_directory/redux/actions/common_actions.dart';
import 'package:employee_directory/redux/app_redux.dart';
import 'package:employee_directory/redux/viewModels/employee_view_model.dart';
import 'package:employee_directory/views/partials/loading_mask.dart';
import 'package:flutter/material.dart';

class EmployeesPage extends StatelessWidget {
  const EmployeesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Employee Directory", textAlign: TextAlign.center),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return StoreConnector<AppState, EmployeesViewModel>(
            converter: (store) => EmployeesViewModel.fromStore(store),
            onInitialBuild: (viewModel) => viewModel.fetchEmployees(),
            onWillChange: (old, viewModel) {
              if ((old?.isLoading ?? false) && viewModel.hasError) {
                final snackBar =
                    SnackBar(content: Text(viewModel.loadingError));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            onDispose: (store) => store.dispatch(OnClearAction()),
            builder: (context, viewModel) {
              if (viewModel.isLoading) return const AppLoadingMask();
              return Column(
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextField(
                      onChanged: viewModel.onSearch,
                      decoration: const InputDecoration(
                        labelText: 'Search',
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RefreshIndicator(
                        onRefresh: () => Future.delayed(
                            Duration.zero, () => viewModel.fetchEmployees()),
                        child: ListView.builder(
                            itemCount: viewModel.employees.length,
                            itemBuilder: (cont, post) {
                              return const EmployeeTile(
                                  sendByMe: true, message: "");
                            }),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class EmployeeTile extends StatelessWidget {
  final bool sendByMe;
  final String message;

  const EmployeeTile({Key? key, required this.sendByMe, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin:
            sendByMe ? EdgeInsets.only(left: 30) : EdgeInsets.only(right: 30),
        padding: EdgeInsets.only(top: 17, bottom: 17, left: 20, right: 20),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: sendByMe
                    ? [const Color(0xffD9B372), const Color(0xffA2834D)]
                    : [const Color(0x1AFFFFFF), const Color(0x1AFFFFFF)],
                begin: FractionalOffset.centerLeft,
                end: FractionalOffset.centerRight),
            borderRadius: sendByMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(23),
                    bottomLeft: Radius.circular(23))
                : BorderRadius.only(
                    topRight: Radius.circular(23),
                    bottomRight: Radius.circular(23))),
        child: Text(
          message,
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
