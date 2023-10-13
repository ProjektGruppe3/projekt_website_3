import 'package:flutter/material.dart';

import '../../../utils/adaptive_layout.dart';
import '../../../utils/values/spaces.dart';
import '../../../utils/values/values.dart';
import '../../../widgets/animations/animated_text_slide_box_transition.dart';

class ProjectHeaderDescription extends StatelessWidget {
  const ProjectHeaderDescription({
    required this.controller,
    required this.width,
    Key? key,
  }) : super(key: key);

  final AnimationController controller;
  final double width;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle? style = textTheme.bodyText1?.copyWith(
      fontSize: responsiveSize(context, 22, 28, medium: 24),
      height: 1.2,
      fontWeight: FontWeight.w200,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AnimatedTextSlideBoxTransition(
          controller: controller,
          text: StringConst.ABOUT_DEV_CATCH_LINE_1,
          width: width,
          maxLines: 5,
          textStyle: style,
        ),
        const SpaceH24(),
        AnimatedTextSlideBoxTransition(
          controller: controller,
          text: StringConst.ABOUT_DEV_CATCH_LINE_4,
          width: width,
          maxLines: 10,
          textStyle: style,
        ),
      ],
    );
  }
}
