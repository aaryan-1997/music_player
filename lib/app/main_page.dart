import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_app/app/ui/pages/home_page/home_page_view.dart';
import 'package:music_app/app/ui/pages/playlist/playlist_page.dart';
import 'package:music_app/app/ui/pages/profile/profile_page.dart';
import 'package:music_app/app/ui/pages/radio/radio_page.dart';
import 'package:music_app/app/widgets/custom_nav_bar.dart';

import 'ui/theme/colors.dart';

class MainPage extends StatefulWidget {
  final int seletedIndex;
  const MainPage({Key? key, this.seletedIndex = 0}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController _pageController = PageController();
  int _currentIndex = 0;
  @override
  void initState() {
    _currentIndex = widget.seletedIndex;
    _pageController = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  final _inactiveColor = AppColor.primaryColor;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex != 0) {
          setState(() {
            _pageController.jumpToPage(0);
          });
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: getBody(),
        bottomNavigationBar: _buildBottomBar(),
      ),
    );
  }

  Widget _buildBottomBar() {
    return CustomNavigationBar(
      containerHeight: 60.h,
      backgroundColor: AppColor.backgroundColor,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      animationDuration: const Duration(milliseconds: 400),
      onItemSelected: (index) => setState(() {
        _currentIndex = index;
        _pageController.animateToPage(_currentIndex,
            duration: const Duration(microseconds: 500), curve: Curves.easeIn);
      }),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: const Icon(FontAwesome.home),
          title: const Text("Home"),
          activeColor: AppColor.whiteColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.audiotrack),
          title: const Text("Audio"),
          activeColor: AppColor.whiteColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.my_library_music),
          title: const Text("Library"),
          activeColor: AppColor.whiteColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.person),
          title: const Text("Profile"),
          activeColor: AppColor.whiteColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
// // exit dialog
//   Future<bool> _exitDialog() async {
//     return await Get.defaultDialog(
//       contentPadding: const EdgeInsets.only(bottom: 0),
//       radius: Dimensions.radius20,
//       title: "Alert",
//       middleText: "Do you want to exit from app?",
//       actions: [
//         Container(
//           decoration: BoxDecoration(
//             color: AppColor.lightGreyColor,
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(Dimensions.radius20),
//               bottomRight: Radius.circular(Dimensions.radius20),
//             ),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context, false);
//                 },
//                 child: SmallText(
//                   text: "Stay",
//                   size: Dimensions.font16,
//                   color: AppColor.amberColor,
//                 ),
//               ),
//               Container(
//                 width: 2,
//                 height: Dimensions.height30,
//                 color: AppColor.mediumGreyColor,
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context, true);
//                 },
//                 child: SmallText(
//                   text: "Yes",
//                   size: Dimensions.font16,
//                   color: AppColor.redColor,
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }

  //====Body===
  Widget getBody() {
    List<Widget> pages = const [
      HomePage(),
      RadioPage(),
      PlaylistPage(),
      ProfilePage()
    ];
    return PageView(
      pageSnapping: false,
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: (value) => setState(() => _currentIndex = value),
      controller: _pageController,
      children: pages,
    );
  }
}
