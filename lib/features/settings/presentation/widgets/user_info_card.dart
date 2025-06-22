import 'package:flutter/material.dart';
import 'package:frizter/core/models/user_model.dart';

class UserInfoCard extends StatelessWidget {
  final UserModel userModel;
  final Function onEdit;
  final Function onLogout;

  const UserInfoCard({
    super.key,
    required this.userModel,
    required this.onEdit,
    required this.onLogout,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => onEdit(),
                icon: Icon(Icons.edit, color: theme.iconTheme.color),
              ),
              Text("Your Profile", style: theme.textTheme.headlineSmall),
              IconButton(
                onPressed: () => onLogout(),
                icon: Icon(Icons.logout, color: theme.iconTheme.color),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CircleAvatar(
            backgroundImage: NetworkImage(userModel.userPhoto),
            maxRadius: 55,
          ),
          const SizedBox(height: 20),
          Text(userModel.username, style: theme.textTheme.titleLarge),
          SizedBox(height: userModel.bio.isNotEmpty ? 5 : 0),

          if (userModel.bio.isNotEmpty)
            Text(
              userModel.bio,
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          SizedBox(height: userModel.bio.isNotEmpty ? 10 : 5),
          Text(userModel.email, style: theme.textTheme.bodySmall),
          const SizedBox(height: 20),
          Text(
            "Creation date: ${userModel.creationDate}",
            style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
          ),
        ],
      ),
    );
  }
}
