import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsSwitcherCard extends StatelessWidget {
  final bool value;
  final String title;
  final Function() onSwitch;

  const SettingsSwitcherCard({
    super.key,
    required this.title,
    required this.value,
    required this.onSwitch,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
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
        trailing: CupertinoSwitch(
          value: value,
          onChanged: (value) => onSwitch(),
          activeColor: theme.colorScheme.secondary,
        ),
      ),
    );
  }
}
