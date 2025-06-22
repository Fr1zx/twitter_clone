import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frizter/core/widgets/error_dialog.dart';
import 'package:frizter/core/widgets/shimmer_post_card.dart';
import 'package:frizter/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:frizter/core/widgets/post_card.dart';
import 'package:frizter/features/posts/presentation/widgets/user_info_bottom_sheet.dart';
import 'package:go_router/go_router.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostsBloc>().add(PostsEvent.loadPosts());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: BlocListener<PostsBloc, PostsState>(
        listener: (context, state) {
          state.maybeWhen(
            failure:
                (error) =>
                    ErrorDialog.showErrorDialog(context: context, error: error),
            orElse: () {},
          );
        },
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<PostsBloc>().add(PostsEvent.loadPosts());
          },
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 20),
                sliver: SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      "All Posts",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
              ),
              BlocBuilder<PostsBloc, PostsState>(
                builder: (context, state) {
                  return state.when(
                    initial: () {
                       return SliverList(
                            delegate: SliverChildBuilderDelegate((
                              context,
                              index,
                            ) {
                            return ShimmerPostCard();
                            }, childCount: 10),
                          );
                    },
                    loading: () {
                    return SliverList(
                            delegate: SliverChildBuilderDelegate((
                              context,
                              index,
                            ) {
                            return ShimmerPostCard();
                            }, childCount: 10),
                          );
                    },
                    loaded: (posts) {
                      return posts.posts.isEmpty
                          ? SliverFillRemaining(
                            child: Center(
                              child: Text(
                                "All Posts are empty",
                                style: theme.textTheme.headlineSmall,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                          : SliverList(
                            delegate: SliverChildBuilderDelegate((
                              context,
                              index,
                            ) {
                              return PostCard(
                                postEntity: posts.posts[index],
                                onShare: () {},
                                isLiked: posts.posts[index].likes.contains(
                                  posts.uid,
                                ),
                                onLike:
                                    () => context.read<PostsBloc>().add(
                                      PostsEvent.likeOrUnlikePost(
                                        posts.posts[index].postId,
                                      ),
                                    ),
                                onUserTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder:
                                        (context) => UserInfoBottomSheet(
                                          userModel: posts.posts[index].user,
                                        ),
                                  );
                                },
                              );
                            }, childCount: posts.posts.length),
                          );
                    },
                    failure: (error) {
                      return SliverFillRemaining(
                        child: Center(
                          child: Text(
                            error,
                            style: theme.textTheme.headlineSmall,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push("/posts/makePost"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Icon(Icons.add),
      ),
    );
  }
}
