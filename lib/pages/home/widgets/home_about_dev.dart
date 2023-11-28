import 'package:flutter/material.dart';

import '../../../../utils/adaptive_layout.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/values/values.dart';
import '../../../widgets/animated_line_through_text.dart';
import '../../../widgets/animations/animated_bubble_button.dart';
import '../../../widgets/animations/animated_positioned_text.dart';
import '../../../widgets/animations/animated_positioned_widget.dart';
import '../../../widgets/animations/animated_text_slide_box_transition.dart';
import '../../project/project_page.dart';

class HomeAboutDev extends StatefulWidget {
  const HomeAboutDev({
    required this.controller,
    required this.width,
    Key? key,
  }) : super(key: key);

  final AnimationController controller;
  final double width;

  @override
  HomeAboutDevState createState() => HomeAboutDevState();
}

class HomeAboutDevState extends State<HomeAboutDev> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    const EdgeInsetsGeometry margin = EdgeInsets.only(left: 16);
    final CurvedAnimation curvedAnimation = CurvedAnimation(
      parent: widget.controller,
      curve: const Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
    );
    final double headerFontSize =
        responsiveSize(context, 24, 36, medium: 28, small: 24);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: margin,
              child: AnimatedTextSlideBoxTransition(
                controller: widget.controller,
                text: StringConst.HI,
                width: widget.width * 0.22,
                maxLines: 10,
                textStyle: textTheme.headline2?.copyWith(
                  color: AppColors.black,
                  fontSize: headerFontSize,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: widget.width * 0.18),
              child: AnimatedTextSlideBoxTransition(
                controller: widget.controller,
                text:
                    'Unsere Projektpräsentation findet am 16.01.2024 um 9:20 in der \nTBS1, Ostring 25, 44787 Bochum,\nin der Aula statt.\n\nUnseren Messestand finden sie im Raum 2.',
                width: widget.width * 0.22,
                maxLines: 10,
                textStyle: textTheme.headline2?.copyWith(
                    color: AppColors.black,
                    fontSize: headerFontSize - 16,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
        // const SizedBox(height: 12.0),
        // Container(
        //   margin: margin,
        //   child: AnimatedTextSlideBoxTransition(
        //     controller: widget.controller,
        //     text: StringConst.DEV_INTRO,
        //     width: widget.width,
        //     maxLines: 3,
        //     textStyle: textTheme.headline2?.copyWith(
        //       color: AppColors.black,
        //       fontSize: headerFontSize,
        //     ),
        //   ),
        // ),
        const SizedBox(height: 12.0),
        Container(
          margin: margin,
          child: AnimatedTextSlideBoxTransition(
            controller: widget.controller,
            text: StringConst.DEV_TITLE,
            width: responsiveSize(
              context,
              widget.width * 0.75,
              widget.width,
              medium: widget.width,
              small: widget.width,
            ),
            maxLines: 3,
            textStyle: textTheme.headline2?.copyWith(
              fontSize: headerFontSize,
            ),
          ),
        ),
        const SizedBox(height: 30.0),
        Container(
          margin: margin,
          child: AnimatedPositionedText(
            controller: curvedAnimation,
            width: widget.width,
            maxLines: 3,
            factor: 2,
            text: StringConst.DEV_DESC,
            textStyle: textTheme.bodyText1?.copyWith(
              fontSize: responsiveSize(
                context,
                Sizes.TEXT_SIZE_16,
                Sizes.TEXT_SIZE_18,
              ),
              height: 2,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 30.0),
        AnimatedPositionedWidget(
          controller: curvedAnimation,
          width: 200,
          height: 60,
          child: AnimatedBubbleButton(
            color: AppColors.grey100,
            imageColor: AppColors.black,
            startOffset: const Offset(0, 0),
            targetOffset: const Offset(0.04, 0),
            targetWidth: 200,
            startBorderRadius: const BorderRadius.all(
              Radius.circular(100.0),
            ),
            title: StringConst.SEE_MY_WORK.toUpperCase(),
            titleStyle: textTheme.bodyText1?.copyWith(
              color: AppColors.black,
              fontSize: responsiveSize(
                context,
                Sizes.TEXT_SIZE_14,
                Sizes.TEXT_SIZE_16,
                small: Sizes.TEXT_SIZE_15,
              ),
              fontWeight: FontWeight.w500,
            ),
            onTap: () {
              // TODO: Reimplement when WorksPage is ready
              Navigator.pushNamed(context, ProjectPage.aboutPageRoute);
            },
          ),
        ),
      ],
    );
  }

  List<Widget> _buildSocials({
    required BuildContext context,
    required data,
  }) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle? style =
        textTheme.bodyText1?.copyWith(color: AppColors.grey750);
    final TextStyle? slashStyle = textTheme.bodyText1?.copyWith(
      color: AppColors.grey750,
      fontWeight: FontWeight.w400,
      fontSize: 18,
    );
    List<Widget> items = <Widget>[];

    for (int index = 0; index < data.length; index++) {
      items.add(
        AnimatedLineThroughText(
          text: data[index].name,
          isUnderlinedByDefault: true,
          controller: widget.controller,
          hasSlideBoxAnimation: true,
          hasOffsetAnimation: true,
          isUnderlinedOnHover: false,
          onTap: () {
            Functions.launchUrl(data[index].url);
          },
          textStyle: style,
        ),
      );

      if (index < data.length - 1) {
        items.add(
          Text('/', style: slashStyle),
        );
      }
    }

    return items;
  }
}
