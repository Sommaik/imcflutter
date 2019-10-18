import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  @override
  PostState get initialState => UnInitialPostState();

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    if (event is LoadListEvent) {
      yield* _mapLoadList();
    }
  }

  Stream<PostState> _mapLoadList() async* {
    // TODO: load data from http
  }
}
