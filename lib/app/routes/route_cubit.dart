import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frizter/app/routes/app_routes.dart';

class RouteCubit extends Cubit<String> {
  RouteCubit() : super(AppRoutes.routes.state.uri.path);

  void updateRoute(String newRoute) => emit(newRoute);
  bool isCurrentRoute({required String route}) => route == state;
}
