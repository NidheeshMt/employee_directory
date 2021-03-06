import 'package:employee_directory/redux/models/loading_status.dart';

abstract class BaseViewModel {
  final LoadingModel loadingStatus;

  BaseViewModel(this.loadingStatus);

  bool get isLoading => loadingStatus.isLoading ?? false;

  bool get hasError => loadingStatus.hasError ?? false;

  String get loadingMessage => loadingStatus.loadingMessage ?? "";

  String get loadingError => loadingStatus.loadingError ?? "";
}
