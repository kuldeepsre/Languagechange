import 'package:bloc/bloc.dart';

import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());

  void loadDashboard() async {
    emit(DashboardLoading());
    await Future.delayed(Duration(seconds: 1));
    emit(DashboardLoaded(["Orders", "Profile", "Settings"]));
  }
}