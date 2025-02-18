import 'package:get_it/get_it.dart';

import '../../features/auth/data/repositories/auth_repo_impl.dart';
import '../data_sources/networking/api_service.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(ApiService()));
}
