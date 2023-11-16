import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../utils/adaptive_layout.dart';
import '../../../utils/values/values.dart';
import '../../utils/values/spaces.dart';
import '../animations/animated_text_slide_box_transition.dart';
import 'app_logo.dart';
import 'top_navigation_item.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({
    required this.selectedRouteTitle,
    required this.selectedRouteName,
    required this.controller,
    this.selectedRouteTitleStyle,
    this.onMenuTap,
    this.onNavItemWebTap,
    this.hasSideTitle = true,
    this.selectedTitleColor = AppColors.black,
    this.titleColor = AppColors.grey600,
    this.appLogoColor = AppColors.black,
    Key? key,
  }) : super(key: key);

  final String selectedRouteTitle;
  final String selectedRouteName;
  final AnimationController controller;
  final TextStyle? selectedRouteTitleStyle;
  final GestureTapCallback? onMenuTap;
  final bool hasSideTitle;
  final Color titleColor;
  final Color selectedTitleColor;
  final Color appLogoColor;

  /// this handles navigation when on desktops
  final Function(String)? onNavItemWebTap;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double screenWidth = sizingInformation.screenSize.width;

      if (screenWidth <= const RefinedBreakpoints().tabletNormal) {
        return mobileNavigationBar(context);
      } else {
        return webNavigationBar(context);
      }
    });
  }

  Widget mobileNavigationBar(BuildContext context) {
    return Container(
      width: widthOfScreen(context),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.PADDING_30,
        vertical: Sizes.PADDING_24,
      ),
      child: Row(
        children: <Widget>[
          AppLogo(
            fontSize: Sizes.TEXT_SIZE_40,
            titleColor: appLogoColor,
          ),
          const Spacer(),
          InkWell(
            onTap: onMenuTap,
            child: Icon(
              FeatherIcons.menu,
              size: Sizes.TEXT_SIZE_30,
              color: appLogoColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget webNavigationBar(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle? style = selectedRouteTitleStyle ??
        textTheme.bodyText1?.copyWith(
          color: AppColors.black,
          fontWeight: FontWeight.w400,
          fontSize: Sizes.TEXT_SIZE_12,
        );
    return Container(
      width: widthOfScreen(context),
      height: heightOfScreen(context),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.PADDING_40,
        vertical: Sizes.PADDING_24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              AppLogo(titleColor: appLogoColor),
              const SpaceW60(),
              Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      /// GetX Popup
                      Get.dialog(
                        AlertDialog(
                          title: const Text('Projektpräsentation'),
                          content: const Text(
                            'Wann?\n  16.01.2024 um 9:20 Uhr\n\nWo?\n  An der TBS1 Ostring 25, 44787 Bochum, in der Aula, Raum 2',
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text(
                                'OK',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              Icons.info_outline,
                              size: 20,
                              color: Colors.black,
                            ),
                            SpaceW4(),
                            Text(
                              'Projektpräsentation am 16.01.2024',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SpaceH12(),
                ],
              ),
              const Spacer(),
              ..._buildNavigationItems(context, menuList: Data.menuItems),

              // DevButton(
              //   height: Sizes.HEIGHT_36,
              //   hasIcon: false,
              //   width: 80,
              //   buttonColor: AppColors.white,
              //   borderColor: appLogoColor,
              //   onHoverColor: appLogoColor,
              //   title: StringConst.RESUME.toUpperCase(),
              //   onPressed: () {
              //     Functions.launchUrl(DocumentPath.CV);
              //   },
              // ),
            ],
          ),
          const Spacer(),
          hasSideTitle
              ? RotatedBox(
                  quarterTurns: 3,
                  child: AnimatedTextSlideBoxTransition(
                    controller: controller,
                    text: selectedRouteTitle.toUpperCase(),
                    textStyle: style,
                  ),
                )
              : const SizedBox(),
          const Spacer(),
        ],
      ),
    );
  }

  List<Widget> _buildNavigationItems(
    BuildContext context, {
    required List<TopNavigationItemData> menuList,
  }) {
    List<Widget> items = <Widget>[];
    for (int index = 0; index < menuList.length; index++) {
      items.add(
        TopNavigationItem(
          controller: controller,
          title: menuList[index].name,
          route: menuList[index].route,
          titleColor: titleColor,
          selectedColor: selectedTitleColor,
          index: index + 1,
          isSelected: menuList[index].route == selectedRouteName ? true : false,
          onTap: () {
            if (onNavItemWebTap != null) {
              onNavItemWebTap!(menuList[index].route);
            }
          },
        ),
      );
      items.add(const SpaceW24());
    }
    return items;
  }
}
