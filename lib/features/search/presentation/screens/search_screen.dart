import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frizter/core/widgets/post_card.dart';
import 'package:frizter/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:frizter/features/posts/presentation/widgets/user_info_bottom_sheet.dart';
import 'package:frizter/features/search/presentation/bloc/search_bloc.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final TextEditingController _postSearchContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: BlocListener<SearchBloc, SearchState>(
        listener: (context, state) {},
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _postSearchContoller,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: theme.hintColor.withOpacity(0.4),
                            fontSize: 16,
                          ),
                          fillColor: theme.hintColor.withOpacity(0.07),
                          hintText: 'Search...',
                          filled: true,
                          isDense: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          hoverColor: Colors.transparent,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (_postSearchContoller.text.isNotEmpty) {
                          context.read<SearchBloc>().add(
                            SearchEvent.searchPosts(
                              query: _postSearchContoller.text,
                            ),
                          );
                        }
                      },
                      icon: Icon(Icons.search),
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                return state.when(
                  initial: () {
                    return SliverFillRemaining(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Search any post",
                              style: theme.textTheme.headlineSmall,
                            ),
                            const SizedBox(height: 3),
                            Text("You can search any posts by any text"),
                          ],
                        ),
                      ),
                    );
                  },
                  loading: () {
                    return SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  },
                  loaded: (uid, posts) {
                    return posts.isEmpty
                        ? SliverFillRemaining(
                          child: Center(
                            child: Text(
                              "Nothing found",
                              style: theme.textTheme.headlineSmall,
                            ),
                          ),
                        )
                        : SliverList.builder(
                          itemCount: posts.length,
                          itemBuilder: (context, index) {
                            return PostCard(
                              postEntity: posts[index],
                              onShare: () {},
                              isLiked: posts[index].likes.contains(uid),
                              onLike:
                                  () => context.read<PostsBloc>().add(
                                    PostsEvent.likeOrUnlikePost(
                                      posts[index].postId,
                                    ),
                                  ),
                              onUserTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder:
                                      (context) => UserInfoBottomSheet(
                                        userModel: posts[index].user,
                                      ),
                                );
                              },
                            );
                          },
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
    );
  }
}
