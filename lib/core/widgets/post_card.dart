import 'package:flutter/material.dart';
import 'package:frizter/features/posts/domain/entities/post_entity/post_entity.dart';

class PostCard extends StatelessWidget {
  final PostEntity postEntity;
  final bool isLiked;
  final Function onShare;
  final Function onLike;
  final Function onUserTap;

  const PostCard({
    super.key,
    required this.postEntity,
    required this.isLiked,
    required this.onShare,
    required this.onLike,
    required this.onUserTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      padding: EdgeInsets.all(15).copyWith(bottom: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => onUserTap(),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(postEntity.user.userPhoto),
                  maxRadius: 20,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                postEntity.user.username,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              IconButton(onPressed: () => onShare(), icon: Icon(Icons.share)),
            ],
          ),
          const SizedBox(height: 20),
          Text(postEntity.title, style: theme.textTheme.titleLarge),
          const SizedBox(height: 10),
          Text(postEntity.content),
          const SizedBox(height: 25),
          Row(
            children: [
              Text(
                postEntity.date,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.hintColor,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () => onLike(),
                icon:
                    isLiked
                        ? Icon(Icons.favorite, color: Colors.red)
                        : Icon(Icons.favorite_border),
              ),
              Text(
                postEntity.likes.length.toString(),
                style: theme.textTheme.bodyLarge,
              ),
              SizedBox(width: postEntity.image != null ? 10 : 0),
              if (postEntity.image != null) Image.network(postEntity.image!),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }
}
