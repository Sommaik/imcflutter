import 'package:equatable/equatable.dart';
import 'package:imcflutter/post/model/post.dart';

abstract class PostState extends Equatable {
  const PostState();
}

class UnInitialPostState extends PostState {
  @override
  List<Object> get props => [];
}

class PostListState extends PostState {
  final List<Post> posts;

  PostListState({this.posts});

  @override
  List<Object> get props => [];
}
