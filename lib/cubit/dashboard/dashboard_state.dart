abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final List<String> items;
  DashboardLoaded(this.items);
}

class DashboardError extends DashboardState {
  final String message;
  DashboardError(this.message);
}
