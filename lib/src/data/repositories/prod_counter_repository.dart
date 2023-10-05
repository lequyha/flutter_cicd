import 'package:flutter_application_test_public/src/domain/repositories/counter_repository.dart';
import 'package:injectable/injectable.dart';

@prod
@Injectable(as: CounterRepository)
class ProdCounterRepository extends CounterRepository {
  @override
  int getIncrement() => 1;
}
