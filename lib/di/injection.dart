import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:task/data/repository/product_repository.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(getIt);

class $initGetIt {
  $initGetIt(GetIt getIt);
}

@module
abstract class RegisterModule {
  @singleton
  http.Client get client => http.Client();

  @singleton
  ProductRepository get productRepository => ProductRepository(client: client);
}
