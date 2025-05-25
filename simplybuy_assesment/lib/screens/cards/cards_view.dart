

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utilities/app_colors.dart';
import '../../utilities/text_styles.dart';

class CardsView extends StatefulWidget {
  const CardsView({super.key});

  @override
  State<CardsView> createState() => _CardsViewState();
}

class _CardsViewState extends State<CardsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height/2,
              width: double.infinity,
              child: Image.asset('assets/png/background video.png', fit: BoxFit.cover,)
          ),
          SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset('assets/png/fade.png', fit: BoxFit.cover,)
          ),
          Positioned(
            top: 60,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  mainAxisSize:  MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize:  MainAxisSize.min,
                      spacing: 10,
                      children: [
                        Text('Stroll Bonfire', style: bigTopicTextStyles,),
                        Column(
                          children: [
                            SizedBox(height: 5,),
                            SvgPicture.asset('assets/svgs/down_arrow.svg', height: 10, width: 5.3, fit: BoxFit.cover,),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize:  MainAxisSize.min,
                      children: [
                        SvgPicture.asset('assets/svgs/timer_icon.svg', height: 15, width: 13, fit: BoxFit.cover,),
                        SizedBox(width: 4,),
                        Text('22h 00m', style: timerTextStyles,),
                        SizedBox(width: 10,),
                        SvgPicture.asset('assets/svgs/profile_icon.svg', height: 15, width: 13, fit: BoxFit.cover,),
                        SizedBox(width: 4,),
                        Text('103', style: timerTextStyles,)


                      ],
                    )
                  ],
                ),
              )
          ),


          Positioned(
            bottom: 0,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 6, right: 8, left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Pick your option.\nSee who has a similar mind.', style: optionDescriptionTextStyles, ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 4,
                      children: [
                        SvgPicture.asset('assets/svgs/mic_icon.svg', height: 48, width: 48,fit: BoxFit.cover,),
                        SvgPicture.asset('assets/svgs/forward_icon.svg', height: 48, width: 48,fit: BoxFit.cover),
                      ],
                    )
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}
