import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomSheetAppbar extends StatelessWidget implements PreferredSizeWidget {
  const BottomSheetAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          height: preferredSize.height,
          color: Colors.transparent,
          margin: EdgeInsets.only(top: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RotatedBox(
                quarterTurns: 1,
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              // CircleAppbarIcon(
              //   onTap: () => Get.back(),
              //   icon: 'ic_back',
              //   heroTag: 'appbar_back',
              //   iconSize: 14.r,
              // ),
               IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.more_vert),
              ),
              // CircleAppbarIcon(
              //   onTap: () {
              //     debugPrint('TODO');
              //   },
              //   icon: 'ic_more',
              //   heroTag: 'appbar_icon',
              //   iconSize: 7.r,
              // ),
            ],
          ),),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.h);
}
