import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/widgets/circle_appbar_icon.dart';

class PlayerAppbar extends StatelessWidget implements PreferredSizeWidget {
  const PlayerAppbar({Key? key}) : super(key: key);

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
              CircleAppbarIcon(
                onTap: () => Get.back(),
                icon: 'ic_back',
                heroTag: 'appbar_back',
                iconSize: 14.r,
              ),
              CircleAppbarIcon(
                onTap: () {
                  debugPrint('TODO');
                },
                icon: 'ic_more',
                heroTag: 'appbar_icon',
                iconSize: 7.r,
              ),
            ],
          )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.h);
}
