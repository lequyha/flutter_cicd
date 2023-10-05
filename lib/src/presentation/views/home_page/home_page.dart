import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/src/bloc/counter_bloc.dart';
import 'package:flutter_application_test_public/src/bloc/counter_event.dart';
import 'package:flutter_application_test_public/src/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CounterBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CounterBloc, int>(
                buildWhen: (previous, current) => previous != current,
                builder: (context, state) {
                  return Text(
                    '$state',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: const IncrementBtn(),
      ),
    );
  }
}

class IncrementBtn extends StatelessWidget {
  const IncrementBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, int>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return FloatingActionButton(
          onPressed: () =>
              context.read<CounterBloc>().add(CounterIncrementPressed()),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        );
      },
    );
  }
}
