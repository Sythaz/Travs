import 'package:flutter/material.dart';

Container customBottomNavigation(BuildContext context, Color color, Widget child) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(35),
      color: color,
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
          spreadRadius: 15,
          blurRadius: 20,
          offset: Offset(0, 20),
        ),
      ],
    ),
    height: 70,
    margin: EdgeInsets.all(16),
    // width: 10,
    child: child,
  );
}
