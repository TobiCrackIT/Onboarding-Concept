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

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {

  int _currentPage=1;
  bool get isFirstPage=> _currentPage==1;

  Widget _getPage(){
    switch(_currentPage){
      case 1:
        return OnboardingPage(
            number: 1,
            darkCardChild: CommunityDarkCardContent(),
            lightCardChild: CommunityLightCardContent(),
            textColumn: CommunityTextColumn()
        );
      case 2:
        return OnboardingPage(
            number: 2,
            darkCardChild: EducationDarkCardContent(),
            lightCardChild: EducationLightCardContent(),
            textColumn: EducationTextColumn()
        );
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

  void _setNextPage(int nextPageNumber){
    setState(() {
      _currentPage=nextPageNumber;
    });
  }

  void _goToLogin(){
    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Login()));
  }

  void _nextPage(){
    _currentPage+=1;

    switch(_currentPage){
      case 1:
        _setNextPage(_currentPage);
        break;
      case 2:
        _setNextPage(_currentPage);
        break;
      case 3:
        _setNextPage(_currentPage);
        break;
      case 4:
        _goToLogin();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOrangeRed,
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(kPaddingLarge),
            child: Column(
              children: <Widget>[
                Header(onSkip: _goToLogin),
                Expanded(
                  child: _getPage(),
                ),
                OnboardingPageIndicator(
                    currentPage: _currentPage, 
                    child: NextPageButton(onPressed: _nextPage)
                )
              ],
            ),
          )
      ),
    );
  }
}
