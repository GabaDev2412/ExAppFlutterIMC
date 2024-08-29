import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabTapped;

  const BottomBar({
    super.key,
    required this.currentIndex,
    required this.onTabTapped,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, Icon> navigationItems = {
      'Home': Platform.isIOS ? const Icon(CupertinoIcons.house_fill) : const Icon(Icons.home),
      'Calculator': const Icon(Icons.calculate),
    };

    return Platform.isIOS
        ? CupertinoTabBar(
            currentIndex: currentIndex,
            onTap: onTabTapped,
            items: navigationItems.entries
                .map<BottomNavigationBarItem>(
                    (entry) => BottomNavigationBarItem(
                          icon: entry.value,
                          label: entry.key,
                        ))
                .toList(),
          )
        : NavigationBar(
            selectedIndex: currentIndex,
            onDestinationSelected: onTabTapped,
            destinations: navigationItems.entries
                .map<Widget>((entry) => NavigationDestination(
                      icon: entry.value,
                      label: entry.key,
                    ))
                .toList(),
          );
  }
}
