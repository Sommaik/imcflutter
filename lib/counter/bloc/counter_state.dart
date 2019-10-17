import 'package:equatable/equatable.dart';

abstract class CounterState extends Equatable {
  const CounterState();
}

class InitialCounterState extends CounterState {
  @override
  List<Object> get props => [];
}

class CounterRunningState extends CounterState {
  final int counter;
  CounterRunningState({this.counter});

  @override
  List<Object> get props => [counter];
}
