import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_app/app/widgets/circle_appbar_icon.dart';
import 'package:music_app/app/widgets/text_base.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          height: preferredSize.height,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: 'appbar_text',
                child: TextBase(
                  'Music Player',
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  leftPading: 10.w
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10.w),
                child: CircleAppbarIcon(
                  onTap: () {
                    debugPrint('TODO');
                  },
                  icon: 'ic_search',
                  heroTag: 'appbar_icon',
                  iconSize: 20.r,
                ),
              ),
            ],
          )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.h);
}
