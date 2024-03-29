import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imcflutter/counter/bloc/bloc.dart';
import 'package:imcflutter/shared/widget/app_menu.dart';

class MyCounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _bloc = BlocProvider.of<CounterBloc>(context);

    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        if (state is CounterRunningState) {
          return buildMainBody(_bloc, state.counter);
        } else {
          return Text('Invalid state');
        }
      },
    );
  }

  Scaffold buildMainBody(CounterBloc bloc, int counter) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My First App.... '),
      ),
      drawer: Drawer(
        child: AppMenu(),
      ),
      body: Center(
        child: Text(
          'Your number is $counter',
          style: TextStyle(
            fontSize: 25,
            color: Colors.cyan,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          bloc.add(IncrementEvent(value: 5));
        },
      ),
    );
  }
}
