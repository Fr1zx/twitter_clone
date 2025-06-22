import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  final String title;
  final Function onTap;
  const SettingsCard({super.key, required this.title, required this.onTap});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
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
        child: ListTile(
          title: Text(title),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: theme.colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
