import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
}

class IncrementEvent extends CounterEvent {
  final int value;
  IncrementEvent({@required this.value});

  @override
  List<Object> get props => [value];
}
