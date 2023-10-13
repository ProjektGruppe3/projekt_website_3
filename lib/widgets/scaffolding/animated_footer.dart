import "package:flutter/material.dart";
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../utils/adaptive_layout.dart';
import '../../../utils/values/values.dart';
import '../../utils/values/spaces.dart';
import 'simple_footer.dart';

class AnimatedFooter extends StatefulWidget {
  const AnimatedFooter({
    this.height,
    this.width,
    this.backgroundColor = AppColors.black,
    Key? key,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color backgroundColor;

  @override
  AnimatedFooterState createState() => AnimatedFooterState();
}

class AnimatedFooterState extends State<AnimatedFooter> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double footerheight = 140;

    return Container(
      width: widget.width ?? widthOfScreen(context),
      height: widget.height ?? footerheight,
      color: widget.backgroundColor,
      child: VisibilityDetector(
        key: const Key('animated-footer'),
        onVisibilityChanged: (visibilityInfo) {
          double visiblePercentage = visibilityInfo.visibleFraction * 100;
          if (visiblePercentage > 25) {
            controller.forward();
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ResponsiveBuilder(
              builder: (context, sizingInformation) {
                final double screenWidth = sizingInformation.screenSize.width;
                if (screenWidth <= const RefinedBreakpoints().tabletNormal) {
                  return const Column(
                    children: <Widget>[
                      SpaceH8(),
                      SimpleFooterSmall(),
                      SpaceH8(),
                    ],
                  );
                } else {
                  return const Column(
                    children: <Widget>[
                      SpaceH8(),
                      SimpleFooterLarge(),
                      SpaceH8(),
                    ],
                  );
                }
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
