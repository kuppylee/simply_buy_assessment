


import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simplybuy_assesment/screens/profile/profile_view.dart';
import 'package:simplybuy_assesment/screens/trending/trending_view.dart';

import '../utilities/app_colors.dart';
import '../utilities/text_styles.dart';
import 'cards/cards_view.dart';
import 'chat/chats_view.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {



  final List<Widget> _views = [
    CardsView(),
    TrendingView(),
    ChatsView(),
    ProfileView()
  ];
  int _currentIndex = 0;

  final CupertinoTabController _controller = CupertinoTabController();

  void _onItemTapped(int index) {
    if (_currentIndex == index && _controller.index == index) {
      Navigator.of(context, rootNavigator: true).popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentIndex = index;
        _controller.index = index;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      backgroundColor: AppColors.black,
      tabBar: CupertinoTabBar(
        activeColor: AppColors.whiteColor,
        inactiveColor: AppColors.lightBlackColor,
        currentIndex: _currentIndex,
        iconSize: 44,
        backgroundColor: AppColors.lightBlackColor,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: SizedBox(
                    child: _currentIndex != 0 ? SvgPicture.asset("assets/svgs/card_icon.svg", fit: BoxFit.cover,) :
                    SvgPicture.asset("assets/svgs/card_icon.svg", fit: BoxFit.cover,),
                  ),
                ),
              ) ,
              label: ""
          ),
          BottomNavigationBarItem(
              icon: Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: SizedBox(
                        child: _currentIndex != 1 ? SvgPicture.asset("assets/svgs/burn_fire.svg", fit: BoxFit.cover,) :
                        SvgPicture.asset("assets/svgs/burn_fire.svg", fit: BoxFit.cover,),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 4,
                      right: 28,
                      child: Container(
                        height: 13,
                        width: 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.purpleColor
                        ),
                      )
                  )
                ],
              ) ,
              label: ""
          ),
          BottomNavigationBarItem(
              icon: Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: SizedBox(
                        child: _currentIndex != 2 ? SvgPicture.asset("assets/svgs/chats_icon.svg", fit: BoxFit.cover,) :
                        SvgPicture.asset("assets/svgs/chats_icon.svg", fit: BoxFit.cover,),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 8,
                      right: 30,
                      child: Container(
                        height: 13,
                        width: 16,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: AppColors.purpleColor
                        ),
                        child: Center(child: Text('10', style: chatNotificationTextStyles,)),
                      )
                  )
                ]
              ) ,
              label: ""
          ),
          BottomNavigationBarItem(
              icon: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: SizedBox(
                    child: _currentIndex != 3 ? SvgPicture.asset("assets/svgs/user_icon.svg",fit: BoxFit.cover, ) :
                    SvgPicture.asset("assets/svgs/user_icon.svg", fit: BoxFit.cover,),
                  ),
                ),
              ) ,
              label: ""
          ),
        ],

      ),
      tabBuilder: (BuildContext context, int index) {
        _currentIndex = index;
        switch(index){
          case 0:
            return CupertinoTabView(builder: (context){
              return CupertinoPageScaffold(child: CardsView());
            },
            );
          case 1:
            return CupertinoTabView(builder: (context){
              return CupertinoPageScaffold(child: TrendingView());
            },
            );
          case 2:
            return CupertinoTabView(builder: (context){
              return CupertinoPageScaffold(child: ChatsView());
            },
            );
          case 3:
            return CupertinoTabView(builder: (context){
              return CupertinoPageScaffold(child: ProfileView());
            },
            );
          default :
            return CupertinoTabView(builder: (context){
              return CupertinoPageScaffold(child: CardsView());
            },
            );
        }
      },
    );
  }
}