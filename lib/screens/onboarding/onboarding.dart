import 'dart:math';

import 'package:flutter/material.dart';
import 'package:onboarding/constants.dart';
import 'package:onboarding/screens/login/login.dart';
import 'package:onboarding/screens/onboarding/pages/community/index.dart';
import 'package:onboarding/screens/onboarding/pages/education/index.dart';
import 'package:onboarding/screens/onboarding/pages/onboarding_page.dart';
import 'package:onboarding/screens/onboarding/pages/work/index.dart';
import 'package:onboarding/screens/onboarding/widgets/header.dart';
import 'package:onboarding/screens/onboarding/widgets/next_page_button.dart';
import 'package:onboarding/screens/onboarding/widgets/onboarding_page_indicator.dart';

import 'widgets/ripple.dart';

class Onboarding extends StatefulWidget {
  final double screenHeight;

  const Onboarding({
    @required this.screenHeight,
  }) : assert(screenHeight != null);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin {
  AnimationController _cardsAnimationController;
  AnimationController _pageIndicatorAnimationController;
  AnimationController _rippleAnimationController;

  Animation<Offset> _slideAnimationLightCard;
  Animation<Offset> _slideAnimationDarkCard;
  Animation<double> _pageIndicatorAnimation;
  Animation<double> _rippleAnimation;

  @override
  void initState() {
    _cardsAnimationController =
        AnimationController(vsync: this, duration: kCardAnimationDuration);
    _pageIndicatorAnimationController =
        AnimationController(vsync: this, duration: kButtonAnimationDuration);
    _rippleAnimationController =
        AnimationController(vsync: this, duration: kRippleAnimationDuration);

    _rippleAnimation = Tween<double>(begin: 0.0, end: widget.screenHeight)
        .animate(CurvedAnimation(
            parent: _rippleAnimationController, curve: Curves.easeIn));

    _setPageIndicatorAnimation();
    _setCardsSlideOutAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _cardsAnimationController.dispose();
    _pageIndicatorAnimationController.dispose();
    _rippleAnimationController.dispose();
    super.dispose();
  }

  int _currentPage = 1;
  bool get isFirstPage => _currentPage == 1;

  Widget _getPage() {

    if(_currentPage<=3){
      switch (_currentPage) {
        case 1:
          return OnboardingPage(
              number: 1,
              darkCardChild: CommunityDarkCardContent(),
              lightCardChild: CommunityLightCardContent(),
              textColumn: CommunityTextColumn());
        case 2:
          return OnboardingPage(
              number: 2,
              darkCardChild: EducationDarkCardContent(),
              lightCardChild: EducationLightCardContent(),
              textColumn: EducationTextColumn());
        case 3:
          return OnboardingPage(
            number: 3,
            lightCardChild: WorkLightCardContent(),
            darkCardChild: WorkDarkCardContent(),
            textColumn: WorkTextColumn(),
          );
        default:
          throw Exception("Page with number '$_currentPage' does not exist.");
      }
    }

    return OnboardingPage(
      number: 3,
      lightCardChild: WorkLightCardContent(),
      darkCardChild: WorkDarkCardContent(),
      textColumn: WorkTextColumn(),
    );
  }

  void _setNextPage(int nextPageNumber) {
    setState(() {
      _currentPage = nextPageNumber;
    });
  }

  Future<void> _goToLogin() async{
    await _rippleAnimationController.forward();
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => Login(screenHeight: widget.screenHeight,)),(Route<dynamic> route) => false);
  }

  void _nextPage() async{
      switch (_currentPage) {
        case 1:
          if(_pageIndicatorAnimation.status==AnimationStatus.dismissed){
            _pageIndicatorAnimationController.forward();
            await _cardsAnimationController.forward();
            _setNextPage(2);
            _setCardsSlideInAnimation();
            await _cardsAnimationController.forward();
            _setCardsSlideOutAnimation();
            _setPageIndicatorAnimation(isClockwiseAnimation: false);
          }
          break;
        case 2:
          if(_pageIndicatorAnimationController.status==AnimationStatus.dismissed){
            _pageIndicatorAnimationController.forward();
            await _cardsAnimationController.forward();
            _setNextPage(3);
            _setCardsSlideInAnimation();
            await _cardsAnimationController.forward();
          }
          _setNextPage(_currentPage);
          break;
        case 3:
          if(_pageIndicatorAnimationController.status==AnimationStatus.completed){
            await _goToLogin();
          }
          break;
      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOrangeRed,
      body: Stack(
        children: <Widget>[
          SafeArea(
              child: Padding(
                padding: EdgeInsets.all(kPaddingLarge),
                child: Column(
                  children: <Widget>[
                    Header(onSkip: () async => await _goToLogin),
                    Expanded(
                      child: _getPage(),
                    ),
                    AnimatedBuilder(
                        animation: _pageIndicatorAnimation,
                        child: NextPageButton(onPressed: ()async{
                          await _nextPage();
                        }),
                        builder: (_,Widget child){
                          return OnboardingPageIndicator(
                              currentPage: _currentPage,
                              child:child,
                          );
                        },
                    )
                  ],
                ),
              )),
          AnimatedBuilder(
              animation: _rippleAnimation,
              builder: (_,Widget child){
                return Ripple(
                  radius: _rippleAnimation.value,
                );
              },
          )
        ],
      ),
    );
  }

  //Animations

  void _setCardsSlideInAnimation() {
    setState(() {
      _slideAnimationLightCard = Tween<Offset>(
        begin: Offset(3.0, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
          parent: _cardsAnimationController, curve: Curves.easeOut));

      _slideAnimationDarkCard=Tween<Offset>(
        begin: Offset(1.5, 0.0),
        end: Offset.zero
      ).animate(CurvedAnimation(parent: _cardsAnimationController, curve: Curves.easeOut));

      _cardsAnimationController.reset();
    });
  }

  void _setCardsSlideOutAnimation(){
    setState(() {

      _slideAnimationLightCard=Tween<Offset>(
        end: Offset(-3.0, 0.0),
        begin: Offset.zero
      ).animate(CurvedAnimation(parent: _cardsAnimationController, curve: Curves.easeIn));

      _slideAnimationDarkCard=Tween<Offset>(
        begin: Offset.zero,
        end: Offset(-1.5, 0.0)
      ).animate(CurvedAnimation(parent: _cardsAnimationController, curve: Curves.easeIn));

      _cardsAnimationController.reset();

    });
  }

  void _setPageIndicatorAnimation({bool isClockwiseAnimation = true}) {
    var multiplicator = isClockwiseAnimation ? 2 : -2;

    setState(() {
      _pageIndicatorAnimation = Tween(
        begin: 0.0,
        end: multiplicator * pi,
      ).animate(CurvedAnimation(
          parent: _pageIndicatorAnimationController, curve: Curves.easeIn));

      _pageIndicatorAnimationController.reset();
    });
  }
}
