import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:atmata/presentation/resources/assets_manager.dart';
import 'package:atmata/presentation/resources/color_manager.dart';
import 'package:atmata/presentation/resources/routes_manager.dart';
import 'package:atmata/presentation/resources/strings_manager.dart';
import 'package:atmata/presentation/resources/values_manager.dart';

import '../../resources/constants_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {

  late final List<SliderObject> _list = _getSliderData();
  final PageController _pageController=PageController();
  int _currentPageIndex=0;

  List<SliderObject> _getSliderData() => [
    SliderObject(AppStrings.onBoardingTitle1, AppStrings.onBoardingSubTitle1, ImageAssets.appLogo),
    SliderObject(AppStrings.onBoardingTitle2, AppStrings.onBoardingSubTitle2, ImageAssets.appLogo),
    SliderObject(AppStrings.onBoardingTitle3, AppStrings.onBoardingSubTitle3, ImageAssets.appLogo),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarIconBrightness:Brightness.dark,
          statusBarBrightness: Brightness.dark
        ),
      ),
      body: PageView.builder(
          itemCount: _list.length,
          controller: _pageController,
          onPageChanged: (index){
          setState(() {
            _currentPageIndex=index;
          });
          },
          itemBuilder: (context,index){
            return OnBoardingPage(_list[index]);
          }
      ),
      bottomSheet: Container(
        color: ColorManager.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                  child: Text(
                    AppStrings.skip,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.end,
                  )
              ),
            ),
            _getBottomSheetWidget()


          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget(){
      return Container(
        color: ColorManager.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //left arrow
            Padding(
              padding: const EdgeInsets.all(AppPadding.p14),
              child: GestureDetector(
                child: SizedBox(
                  height: AppSize.s20,
                  width: AppSize.s20,
                  child: SvgPicture.asset(ImageAssets.leftArrowIc),
                ),
                onTap: (){
                  _pageController.animateToPage(
                      _getPreviousPage(),
                      duration: const Duration(milliseconds: AppConstants.sliderAnimationTime),
                      curve: Curves.bounceInOut
                  );
                },
              ),
            ),
            //circles
            Row(
              children: [
                for(int i=0;i<_list.length;i++)
                  Padding(
                      padding: const EdgeInsets.all(AppPadding.p8),
                      child: _getCircle(i),
                  ),
              ],
            ),
            //right arrow
            Padding(
              padding: const EdgeInsets.all(AppPadding.p14),
              child: GestureDetector(
                child: SizedBox(
                  height: AppSize.s20,
                  width: AppSize.s20,
                  child: SvgPicture.asset(ImageAssets.rightArrowIc),
                ),
                onTap: (){
                  _pageController.animateToPage(
                      _getNextPage(),
                      duration: const Duration(milliseconds: AppConstants.sliderAnimationTime),
                      curve: Curves.bounceInOut
                  );
                },
              ),
            ),


          ],
        ),
      );
  }

  int _getPreviousPage(){
    int previousIndex = --_currentPageIndex;
    if(previousIndex==-1)
    {
      previousIndex=_list.length-1;
      return previousIndex;
    }else{
      return previousIndex;
    }
  }
  int _getNextPage(){
    int nextIndex = ++_currentPageIndex;
    if(nextIndex==_list.length)
    {
      nextIndex=0;
      return nextIndex;
    }else{
      return nextIndex;
    }
  }

  Widget _getCircle(int index){
    if(index == _currentPageIndex) {
      return SvgPicture.asset(ImageAssets.hollowCircleIc);
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIc);
    }
  }
}
class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;
  const OnBoardingPage(this._sliderObject,{Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children:  [
        const SizedBox(height: AppSize.s40,),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
              _sliderObject.title,
              textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: AppSize.s60,),
        Image(image: AssetImage(_sliderObject.image)),
      ],
    );
  }
}

class SliderObject{
  String title;
  String subtitle;
  String image;
  SliderObject(this.title,this.subtitle,this.image);
}
