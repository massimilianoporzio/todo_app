import 'package:get_it/get_it.dart';
import 'package:todo_app/core/routes/go_router_provider.dart';

final sl = GetIt.instance;

void init() {
  sl.registerFactory(() => GoRouterProvider());
}
