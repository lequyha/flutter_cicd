// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/repositories/dev_counter_repository.dart' as _i4;
import '../data/repositories/prod_counter_repository.dart' as _i5;
import '../domain/repositories/counter_repository.dart' as _i3;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.CounterRepository>(
      () => _i4.DevCounterRepository(),
      registerFor: {_dev},
    );
    gh.factory<_i3.CounterRepository>(
      () => _i5.ProdCounterRepository(),
      registerFor: {_prod},
    );
    return this;
  }
}
