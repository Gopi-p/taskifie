import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:taskifie/modules/app-layout/provider/app_layout.provider.dart';
import 'package:taskifie/shared/data/assets_paths.dart';
import 'package:taskifie/shared/data/typography.data.dart';
import 'package:taskifie/shared/functions/helpers.function.dart';

@RoutePage()
class AppLayoutPage extends StatelessWidget {
  const AppLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLayoutProvider homeProvider = context.read<AppLayoutProvider>();
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
    context.read<AppLayoutProvider>();
    return Container(
      color: Colors.blue,
      height: 70,
      child: const Row(
        children: [
          // if (!Responsive.isDesktop(context))
          // IconButton(
          //   onPressed: () {
          //     homeProvider.homeScaffoldKey.currentState!.openDrawer();
          //   },
          //   icon: const Icon(Icons.menu),
          // ),
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
    return Consumer<AppLayoutProvider>(
      builder: (ctx, homeProvider, child) {
        setActiveMenu(ctx, homeProvider);
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
              ...menuItems.mapIndexed(
                (e, i) => SideMenuItem(
                  isSelected: homeProvider.selectSideMenuItemIndex == i,
                  title: e.title,
                  prefix: e.icon,
                  onTap: () async {
                    context.router.replace(e.route);
                    homeProvider.updateActiveIndex(i);
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void setActiveMenu(BuildContext ctx, AppLayoutProvider homeProvider) {
    Map<String, int> urlToIndex = {
      '/tasks': 0,
      '/profile': 1,
      '/settings': 2,
    };

    String currentUrl = ctx.router.currentUrl;

    print('@@ ➡️ currentUrl - State: ${currentUrl.toString()}');

    homeProvider.selectSideMenuItemIndex = urlToIndex[currentUrl] ?? 0;
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
                  Icon(
                    prefix,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                  const SizedBox(width: 12),
                ],
                Text(
                  title,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: SvgPicture.asset(AssetsPath.fullLogoColor, height: 35),
    );

    // UserDetailsTile();
  }
}

class UserDetailsTile extends StatelessWidget {
  const UserDetailsTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Consumer<AppLayoutProvider>(builder: (ctx, homeProvider, child) {
            return Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  foregroundImage: NetworkImage(
                    homeProvider.userInfo?.profileUrl ??
                        'https://cdn.pixabay.com/photo/2013/07/13/10/44/man-157699_1280.png',
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      homeProvider.userInfo?.name ?? "User name",
                      style: TextStyles.textMd,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      homeProvider.userInfo?.email ?? "Email address",
                      style: TextStyles.caption,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            );
          }),
        ),
        const Divider(),
        const SizedBox(height: 10),
      ],
    );
  }
}
