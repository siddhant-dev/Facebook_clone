import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/screens/home_screen.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScren extends StatefulWidget {
  @override
  _NavScrenState createState() => _NavScrenState();
}

class _NavScrenState extends State<NavScren> {
  final List<Widget> screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold()
  ];
  final List<IconData> icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: icons.length,
      child: Scaffold(
        body: IndexedStack(
          children: screens,
          index: selectedIndex,
        ),
        bottomNavigationBar: CustomTabBar(
          icons: icons,
          selectedIndex: selectedIndex,
          onTap: (index) => setState(() => selectedIndex = index),
        ),
      ),
    );
  }
}
