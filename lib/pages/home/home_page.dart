import "package:flutter/material.dart";
import 'package:visibility_detector/visibility_detector.dart';

import '../../../utils/adaptive_layout.dart';
import '../../../utils/values/values.dart';
import '../../widgets/animations/animated_text_slide_box_transition.dart';
import '../../widgets/helper/custom_spacer.dart';
import '../../widgets/scaffolding/animated_footer.dart';
import '../../widgets/scaffolding/page_wrapper.dart';
import 'widgets/home_page_header.dart';
import 'widgets/initial_loading_page.dart';

class HomePage extends StatefulWidget {
  static const String homePageRoute = StringConst.HOME_PAGE;

  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  GlobalKey key = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  late AnimationController _viewProjectsController;
  late AnimationController _recentWorksController;
  late AnimationController _slideTextController;
  late NavigationArguments _arguments;

  @override
  void initState() {
    _arguments = NavigationArguments();
    _viewProjectsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _slideTextController = AnimationController(
      vsync: this,
      duration: Animations.slideAnimationDurationLong,
    );
    _recentWorksController = AnimationController(
      vsync: this,
      duration: Animations.slideAnimationDurationLong,
    );

    super.initState();
  }

  void getArguments() {
    final Object? args = ModalRoute.of(context)!.settings.arguments;
    // if page is being loaded for the first time, args will be null.
    // if args is null, I set boolean values to run the appropriate animation
    // In this case, if null run loading animation, if not null run the unveil animation
    if (args == null) {
      _arguments.showUnVeilPageAnimation = false;
    } else {
      _arguments = args as NavigationArguments;
    }
  }

  @override
  void dispose() {
    _viewProjectsController.dispose();
    _slideTextController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getArguments();
    final double projectItemHeight = assignHeight(context, 0.4);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final EdgeInsets margin = EdgeInsets.only(
      left: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.15),
        small: assignWidth(context, 0.15),
      ),
    );
    return PageWrapper(
      selectedRoute: HomePage.homePageRoute,
      selectedPageName: StringConst.HOME,
      navigationBarAnimationController: _slideTextController,
      hasSideTitle: false,
      hasUnveilPageAnimation: _arguments.showUnVeilPageAnimation,
      onLoadingAnimationDone: () {
        _slideTextController.forward();
      },
      customLoadingAnimation: LoadingHomePageAnimation(
        loadingText: StringConst.DEV_NAME,
        style: textTheme.headline4!.copyWith(color: AppColors.white),
        onLoadingDone: () {
          _slideTextController.forward();
        },
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        controller: _scrollController,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: <Widget>[
          HomePageHeader(
            controller: _slideTextController,
            scrollToWorksKey: key,
          ),
          const CustomSpacer(heightFactor: 0.1),
          VisibilityDetector(
            key: const Key('recent-projects'),
            onVisibilityChanged: (visibilityInfo) {
              double visiblePercentage = visibilityInfo.visibleFraction * 100;
              if (visiblePercentage > 45) {
                _recentWorksController.forward();
              }
            },
            child: Container(
              key: key,
              margin: margin,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AnimatedTextSlideBoxTransition(
                    controller: _recentWorksController,
                    text: StringConst.Website_Into,
                    maxLines: 3,
                    width: responsiveSize(
                      context,
                      assignWidth(context, 0.80),
                      assignWidth(context, 0.70),
                      small: assignWidth(context, 0.70),
                    ),
                    textStyle: textTheme.headline4?.copyWith(
                      color: AppColors.black,
                      fontSize: responsiveSize(context, 15, 24, medium: 20, small: 18),
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const CustomSpacer(heightFactor: 0.2),
          const AnimatedFooter(),
        ],
      ),
    );
  }
}
