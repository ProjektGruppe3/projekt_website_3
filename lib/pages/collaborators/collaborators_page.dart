import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../utils/adaptive_layout.dart';
import '../../../utils/values/values.dart';
import '../../utils/functions.dart';
import '../../widgets/animated_line_through_text.dart';
import '../../widgets/animations/animated_positioned_text.dart';
import '../../widgets/helper/content_builder.dart';
import '../../widgets/helper/custom_spacer.dart';
import '../../widgets/scaffolding/animated_footer.dart';
import '../../widgets/scaffolding/default_page_header.dart';
import '../../widgets/scaffolding/page_wrapper.dart';

class CollaboratorsPage extends StatefulWidget {
  static const String collaboratorsPageRoute = StringConst.CONTACT_PAGE;
  const CollaboratorsPage({
    Key? key,
  }) : super(key: key);

  @override
  CollaboratorsPageState createState() => CollaboratorsPageState();
}

class CollaboratorsPageState extends State<CollaboratorsPage>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  late AnimationController _controller;
  late AnimationController _storyController;
  late AnimationController _technologyController;
  late AnimationController _technologyListController;
  late AnimationController _contactController;
  late AnimationController _quoteController;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _storyController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _technologyController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _technologyListController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _contactController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _quoteController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _storyController.dispose();
    _technologyController.dispose();
    _technologyListController.dispose();
    _contactController.dispose();
    _quoteController.dispose();
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
        // sm: assignWidth(context, 0.10),
      ),
      top: responsiveSize(
        context,
        assignHeight(context, 0.15),
        assignHeight(context, 0.15),
        // sm: assignWidth(context, 0.10),
      ),
    );

    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle? bodyText1Style = textTheme.bodyText1?.copyWith(
      fontSize: Sizes.TEXT_SIZE_18,
      color: AppColors.grey750,
      fontWeight: FontWeight.w400,
      height: 2.0,
      // letterSpacing: 2,
    );
    final CurvedAnimation storySectionAnimation = CurvedAnimation(
      parent: _storyController,
      curve: const Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
    );
    final CurvedAnimation technologySectionAnimation = CurvedAnimation(
      parent: _technologyController,
      curve: const Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
    );
    final double widthOfBody = responsiveSize(
      context,
      assignWidth(context, 0.75),
      assignWidth(context, 0.5),
    );
    return PageWrapper(
      selectedRoute: CollaboratorsPage.collaboratorsPageRoute,
      selectedPageName: StringConst.ABOUT,
      navigationBarAnimationController: _controller,
      onLoadingAnimationDone: () {
        _controller.forward();
      },
      child: ListView(
        controller: _scrollController,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: <Widget>[
          DefaultPageHeader(
            scrollController: _scrollController,
            headingText: StringConst.COLLABORATORS,
            headingTextController: _controller,
          ),
          Padding(
            padding: padding,
            child: Column(
              children: <Widget>[
                VisibilityDetector(
                  key: const Key('story-section'),
                  onVisibilityChanged: (visibilityInfo) {
                    _storyController.forward();
                  },
                  child: ContentBuilder(
                    controller: _storyController,
                    number: "/01 ",
                    width: contentAreaWidth,
                    section: StringConst.Beschreibung_Projekt.toUpperCase(),
                    title: StringConst.Uberschriftcollaborators,
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 400,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.asset(
                                ImagePath.FirmenfotoBrock,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        AnimatedPositionedText(
                          controller: storySectionAnimation,
                          width: widthOfBody,
                          maxLines: 30,
                          // factor: 1.25,
                          text: StringConst.Projektpartner,
                          textStyle: bodyText1Style,
                        ),
                      ],
                    ),
                  ),
                ),
                const CustomSpacer(heightFactor: 0.1),
                VisibilityDetector(
                  key: const Key('technology-section'),
                  onVisibilityChanged: (visibilityInfo) {
                    if (visibilityInfo.visibleFraction * 100 > 50) {
                      _technologyController.forward();
                    }
                  },
                  child: ContentBuilder(
                    controller: _technologyController,
                    number: "/02 ",
                    width: contentAreaWidth,
                    section: StringConst.Produktpallete.toUpperCase(),
                    title: StringConst.Uberschriftproduktpalette,
                    body: LayoutBuilder(builder: (context, constraint) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: constraint.maxWidth * 0.475,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16.0),
                                    child: Image.asset(
                                      ImagePath.Produktpalette1,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: constraint.maxWidth * 0.525,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16.0),
                                    child: Image.asset(
                                      ImagePath.Produktpalette2,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Functions.launchUrl(
                                  'https://www.brock-kehrtechnik.de/');
                            },
                            child: AnimatedLineThroughText(
                              text: 'www.brock-kehrtechnik.de',
                              isUnderlinedByDefault: true,
                              isUnderlinedOnHover: false,
                              hoverColor: AppColors.white,
                              coverColor: AppColors.black,
                              textStyle: textTheme.bodyText1?.copyWith(
                                fontSize: Sizes.TEXT_SIZE_18,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          AnimatedPositionedText(
                            controller: technologySectionAnimation,
                            width: widthOfBody,
                            maxLines: 12,
                            text: StringConst.Produkte,
                            textStyle: bodyText1Style,
                          ),
                        ],
                      );
                    }),
                  ),
                ),
                const CustomSpacer(heightFactor: 0.2),
              ],
            ),
          ),

          // SlidingBanner(),
          const AnimatedFooter()
        ],
      ),
    );
  }
}
