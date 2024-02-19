import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskifie/app/route/app_router.dart';
import 'package:taskifie/modules/home/provider/home.provider.dart';
import 'package:taskifie/shared/data/typography.data.dart';
import 'package:taskifie/shared/functions/theme.function.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeProvider homeProvider = context.read<HomeProvider>();
    return Scaffold(
      key: homeProvider.homeScaffoldKey,
      // drawer: !Responsive.isDesktop(context) ? const SideMenu() : null,
      body: const SafeArea(
        child: Row(
          children: [
            // if (Responsive.isDesktop(context)) const SideMenu(),
            SideMenu(),
            Expanded(
              child: Column(
                children: [
                  PageHeader(),
                  Expanded(
                    child: AutoRouter(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HomeProvider homeProvider = context.read<HomeProvider>();
    return Container(
      color: Colors.blue,
      height: 70,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              homeProvider.homeScaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
    );
  }
}

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              // offset: Offset(0, 0),
              // blurRadius: 20,
              // color: Colors.black,
              // spreadRadius: 60,
              // blurStyle: BlurStyle.inner,
              )
        ],
      ),
      child: Column(
        children: [
          const SideMenuHeader(),
          SideMenuItem(
            isSelected: true,
            title: 'Dashboard',
            prefix: Icons.dashboard,
            onTap: () {},
          ),
          SideMenuItem(
            title: 'Tasks',
            prefix: Icons.task_alt,
            onTap: () {},
          ),
          SideMenuItem(
            title: 'User Profile',
            prefix: Icons.person,
            onTap: () {},
          ),
          SideMenuItem(
            title: 'Settings',
            prefix: Icons.settings,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class SideMenuItem extends StatelessWidget {
  final bool isSelected;
  final String title;
  final IconData? prefix;
  final VoidCallback onTap;
  const SideMenuItem({
    super.key,
    this.isSelected = false,
    required this.title,
    this.prefix,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: isSelected ? Colors.blue[600] : Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: isSelected ? null : onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                if (prefix != null) ...[
                  const SizedBox(width: 12),
                  Icon(prefix),
                  const SizedBox(width: 12),
                ],
                Text(title),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SideMenuHeader extends StatelessWidget {
  const SideMenuHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 5),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(radius: 30),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "User name",
                    style: TextStyles.textMd,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Email address",
                    style: TextStyles.caption,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(),
        SizedBox(height: 10),
      ],
    );
  }
}
