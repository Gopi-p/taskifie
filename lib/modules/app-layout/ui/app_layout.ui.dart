import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:taskifie/modules/app-layout/provider/app_layout.provider.dart';
import 'package:taskifie/shared/data/assets_paths.dart';
import 'package:taskifie/shared/data/theme.data.dart';
import 'package:taskifie/shared/functions/helpers.function.dart';
import 'package:taskifie/shared/functions/theme.function.dart';
import 'package:taskifie/shared/widgets/gradient_scaffold.dart';

@RoutePage()
class AppLayoutPage extends StatelessWidget {
  const AppLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLayoutProvider homeProvider = context.read<AppLayoutProvider>();
    return GradientScaffold(
      scaffoldKey: homeProvider.homeScaffoldKey,
      drawer: !Responsive.isDesktop(context) ? const SideMenu() : null,
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context)) const SideMenu(),
            const Expanded(
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
    final homeProvider = context.read<AppLayoutProvider>();
    return SizedBox(
      height: 70,
      child: Row(
        children: [
          const SizedBox(width: 14),
          if (!Responsive.isDesktop(context))
            IconButton(
              onPressed: () {
                homeProvider.homeScaffoldKey.currentState!.openDrawer();
              },
              icon: const Icon(Icons.menu),
              color: AppColors.text,
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
    return Consumer<AppLayoutProvider>(
      builder: (ctx, homeProvider, child) {
        setActiveMenu(ctx, homeProvider);
        return Container(
          decoration: const BoxDecoration(
            gradient: AppTheme.primaryGradient,
          ),
          width: 260,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  if (!Responsive.isDesktop(context))
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {
                            homeProvider.homeScaffoldKey.currentState!
                                .closeDrawer();
                          },
                          icon: const Icon(Icons.close),
                          color: AppColors.text,
                        ),
                      ),
                    ),
                  const SideMenuHeader(),
                ],
              ),
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
    String currentUrl = ctx.router.currentUrl;
    if (currentUrl.contains('profile')) {
      homeProvider.selectSideMenuItemIndex = 1;
    } else if (currentUrl.contains('settings')) {
      homeProvider.selectSideMenuItemIndex = 2;
    } else {
      homeProvider.selectSideMenuItemIndex = 0;
    }
  }
}

class SideMenuHeader extends StatelessWidget {
  const SideMenuHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: ShaderMask(
        shaderCallback: (rect) => AppTheme.secondaryGradient.createShader(rect),
        child: SvgPicture.asset(AssetsPath.fullVerticalLogoWhite),
      ),
    );

    // UserDetailsTile();
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
      padding: const EdgeInsets.only(bottom: 10, left: 24, right: 24),
      child: Material(
        borderRadius: BorderRadius.circular(6),
        color: isSelected ? AppColors.primaryBlue : Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: isSelected ? null : onTap,
          splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
          hoverColor: AppColors.primaryBlue,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.transparent,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                width: 1,
                color: isSelected ? AppColors.text80 : AppColors.transparent,
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                if (prefix != null) ...[
                  const SizedBox(width: 12),
                  Icon(prefix, color: AppColors.text, size: 20),
                  const SizedBox(width: 12),
                ],
                Text(title, style: AppTextStyle.caption1),
              ],
            ),
          ),
        ),
      ),
    );

    // Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 7),
    //   child: Material(
    //     borderRadius: BorderRadius.circular(8),
    //     color: isSelected ? AppColors.primaryBlue : Colors.transparent,
    //     child: InkWell(
    //       customBorder: Border.all(color: AppColors.text80, width: 1),
    //       borderRadius: BorderRadius.circular(8),
    //       onTap: isSelected ? null : onTap,
    //       child: Padding(
    //         padding: const EdgeInsets.symmetric(vertical: 8),
    //         child: Row(
    //           children: [
    //             if (prefix != null) ...[
    //               const SizedBox(width: 12),
    //               Icon(prefix, color: AppColors.text),
    //               const SizedBox(width: 12),
    //             ],
    //             Text(
    //               title,
    //               style: const TextStyle(color: AppColors.text),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
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
                      style: AppTextStyle.body2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      homeProvider.userInfo?.email ?? "Email address",
                      style: AppTextStyle.body3,
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
