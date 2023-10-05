import 'package:flutter_application_test_public/src/domain/repositories/counter_repository.dart';
import 'package:injectable/injectable.dart';

@dev
@Injectable(as: CounterRepository)
class DevCounterRepository extends CounterRepository {
  @override
  int getIncrement() => 2;
}
