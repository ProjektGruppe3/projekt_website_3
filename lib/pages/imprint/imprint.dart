import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../utils/adaptive_layout.dart';
import '../../../utils/values/values.dart';
import '../../utils/values/spaces.dart';
import '../../widgets/animations/animated_text_slide_box_transition.dart';
import '../../widgets/helper/custom_spacer.dart';
import '../../widgets/scaffolding/animated_footer.dart';
import '../../widgets/scaffolding/default_page_header.dart';
import '../../widgets/scaffolding/page_wrapper.dart';

class ImprintPage extends StatefulWidget {
  static const String imprintPageRoute = StringConst.IMPRINT_PAGE;
  const ImprintPage({
    Key? key,
  }) : super(key: key);

  @override
  ImprintPageState createState() => ImprintPageState();
}

class ImprintPageState extends State<ImprintPage> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  late AnimationController _controller;
  late List<AnimationController> _imprintControllers;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _imprintControllers = List.generate(Data.imprintData.length, (index) {
      return AnimationController(
        duration: const Duration(milliseconds: 1200),
        vsync: this,
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    for (var controller in _imprintControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double contentAreaWidth = responsiveSize(
      context,
      assignWidth(context, 0.8),
      assignWidth(context, 0.75),
      small: assignWidth(context, 0.8),
    );
    final EdgeInsetsGeometry padding = EdgeInsets.only(
      left: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.15),
      ),
      right: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.10),
      ),
      top: responsiveSize(
        context,
        assignHeight(context, 0.15),
        assignHeight(context, 0.15),
      ),
    );

    return PageWrapper(
      selectedRoute: ImprintPage.imprintPageRoute,
      selectedPageName: StringConst.IMPRINT,
      navigationBarAnimationController: _controller,
      onLoadingAnimationDone: () {
        _controller.forward();
      },
      child: ListView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: <Widget>[
          DefaultPageHeader(
            scrollController: _scrollController,
            headingText: StringConst.IMPRINT,
            headingTextController: _controller,
          ),
          Padding(
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ..._buildPrivacyPolicySection(
                  data: Data.imprintData,
                  width: contentAreaWidth,
                ),
                const CustomSpacer(heightFactor: 0.1),
              ],
            ),
          ),
          const AnimatedFooter(),
        ],
      ),
    );
  }

  List<Widget> _buildPrivacyPolicySection({
    required List<ImprintData> data,
    required double width,
  }) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? defaultTitleStyle = textTheme.subtitle1?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_18,
        Sizes.TEXT_SIZE_20,
      ),
    );

    List<Widget> items = <Widget>[];

    for (int index = 0; index < data.length; index++) {
      data[index].title != null
          ? items.add(
              const SpaceH32(),
            )
          : const SizedBox();
      items.add(
        VisibilityDetector(
          key: Key('privacy-policy-section-$index'),
          onVisibilityChanged: (visibilityInfo) {
            double visiblePercentage = visibilityInfo.visibleFraction * 100;
            if (visiblePercentage > 40) {
              _imprintControllers[index].forward();
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              data[index].title != null
                  ? AnimatedTextSlideBoxTransition(
                      controller: _imprintControllers[index],
                      text: data[index].title!,
                      maxLines: 100,
                      width: width,
                      textStyle: defaultTitleStyle,
                    )
                  : const SizedBox(),
              data[index].title != null ? const SpaceH12() : const SizedBox(),
              AnimatedTextSlideBoxTransition(
                controller: _imprintControllers[index],
                text: data[index].content,
                maxLines: 100,
                width: width,
                textStyle: defaultTitleStyle?.copyWith(
                  fontSize: responsiveSize(
                    context,
                    Sizes.TEXT_SIZE_16,
                    Sizes.TEXT_SIZE_18,
                  ),
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return items;
  }
}
