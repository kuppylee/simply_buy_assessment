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
  int? selectedIndex;

  final List<String> answers = [
    "The peace in the early mornings",
    "The magical golden hours",
    "Wind-down time after dinners",
    "The serenity past midnight",
  ];

  final List<String> labels = ['A', 'B', 'C', 'D'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.89,
            width: double.infinity,
            child: Image.asset(
              'assets/png/background video.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1.1,
            child: Image.asset('assets/png/fade.png', fit: BoxFit.cover),
          ),
          Column(
            children: [
              SizedBox(height: 50),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 10,
                      children: [
                        Text('Stroll Bonfire', style: bigTopicTextStyles),
                        Column(
                          children: [
                            SizedBox(height: 5),
                            SvgPicture.asset(
                              'assets/svgs/down_arrow.svg',
                              height: 10,
                              width: 5.3,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/timer_icon.svg',
                          height: 15,
                          width: 13,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 4),
                        Text('22h 00m', style: timerTextStyles),
                        SizedBox(width: 10),
                        SvgPicture.asset(
                          'assets/svgs/profile_icon.svg',
                          height: 15,
                          width: 13,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 4),
                        Text('103', style: timerTextStyles),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 3),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: SizedBox(
                  height: 100,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 16,
                                ),
                                width: 147,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.black2,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text('Angelina, 28', style: nameTextStyles),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          // borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: AppColors.black2, width: 6),
                          image: DecorationImage(
                            image: AssetImage('assets/jpg/profile_pic.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        right: 70,
                        child: Text(
                          'What is your favorite time\nof the day?',
                          style: timeOfTheDayTextStyles,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Column(
                spacing: 10,
                children: [
                  Text(
                    '“ Mine is definitely the peace in the morning.”',
                    style: myAnswerTextStyles,
                    textAlign: TextAlign.center,
                  ),

                  Center(
                    child: GridView.builder(
                      itemCount: answers.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: 3, // wider cells
                          ),
                      itemBuilder: (context, index) {
                        final isSelected = selectedIndex == index;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.ashColor,
                              border: Border.all(
                                color:
                                    isSelected
                                        ? AppColors.selectedBorderColor
                                        : Colors.transparent,
                                width: isSelected ? 2 : 0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 8,
                              ),
                              child: Row(
                                spacing: 12,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: isSelected ? AppColors.selectedBorderColor : Colors.transparent ,
                                      border: Border.all(
                                        width: 1,
                                        color: AppColors.whiteColor3,
                                      ),
                                    ),
                                    child: Text(
                                      labels[index],
                                      style: answerOptionTextStyles,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      answers[index],
                                      style: answersTextStyles,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(bottom: 6, right: 8, left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pick your option.\nSee who has a similar mind.',
                          style: optionDescriptionTextStyles,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 4,
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/mic_icon.svg',
                          height: 48,
                          width: 48,
                          fit: BoxFit.cover,
                        ),
                        SvgPicture.asset(
                          'assets/svgs/forward_icon.svg',
                          height: 48,
                          width: 48,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
