import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imcflutter/post/bloc/bloc.dart';
import 'package:imcflutter/post/model/post.dart';
import 'package:imcflutter/shared/widget/app_menu.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
      ),
      drawer: Drawer(
        child: AppMenu(),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostListState) {
            return buildList(state.posts);
          } else {
            return buildLoding();
          }
        },
      ),
    );
  }

  Widget buildLoding() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildList(List<Post> posts) {
    return ListView.builder(
      itemBuilder: (context, index) {
        Post post = posts[index];
        return ListTile(
          title: Text(post.title),
        );
      },
    );
  }
}
