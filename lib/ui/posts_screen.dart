import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ws_start/constants.dart';
import 'package:ws_start/data/posts.dart';
import 'package:ws_start/data/providers.dart';
import 'package:ws_start/models/post.dart';
import 'package:ws_start/widgets/async_value_wrapper.dart';

class PostsScreen extends HookWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postsData = useProvider(postsDataProvider);
    return Scaffold(
      body: Center(
        child: AsyncValueWrapper<List<Post>>(
            value: postsData,
            buildData: (data, context) => ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, i) => Container(
                      margin: const EdgeInsets.all(4),
                      padding: const EdgeInsets.all(4),
                      color: Colors.amber,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[i].title ?? '',
                            style: kH3TextStyle,
                          )
                        ],
                      ),
                    ))),
      ),
    );
  }
}
