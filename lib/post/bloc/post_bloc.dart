import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:imcflutter/post/model/post.dart';
import './bloc.dart';
import 'package:http/http.dart' as http;

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
    http.Response resp =
        await http.get("https://jsonplaceholder.typicode.com/posts");
    List<dynamic> list = json.decode(resp.body);
    List<Post> posts = list.map((json) => Post.fromJson(json)).toList();
    yield PostListState(posts: posts);
  }
}
