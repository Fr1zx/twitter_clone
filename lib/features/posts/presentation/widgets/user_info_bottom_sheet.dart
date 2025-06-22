import 'package:flutter/material.dart';
import 'package:frizter/core/models/user_model.dart';

class UserInfoBottomSheet extends StatelessWidget {
  final UserModel userModel;

  const UserInfoBottomSheet({super.key, required this.userModel});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 100),
              height: 2.5,
              color: theme.hintColor,
            ),
            const SizedBox(height: 20),
            CircleAvatar(
              backgroundImage: NetworkImage(userModel.userPhoto),
              maxRadius: 50,
            ),
            const SizedBox(height: 20),
            Text(userModel.username, style: theme.textTheme.bodyLarge),
            SizedBox(height: userModel.bio.isNotEmpty ? 5 : 0),
            if (userModel.bio.isNotEmpty) Text(userModel.bio),
            const SizedBox(height: 10),
            Text(userModel.email),
            const SizedBox(height: 10),
            Text(
              userModel.creationDate,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.hintColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
