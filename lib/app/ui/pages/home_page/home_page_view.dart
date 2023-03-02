// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_app/app/config/dimensions.dart';
import 'package:music_app/app/models/artist.dart';
import 'package:music_app/app/player/getx_player_controller.dart';
import 'package:music_app/app/routes/app_pages.dart';
import 'package:music_app/app/ui/pages/home_page/bottom_sheet_player.dart';
import 'package:music_app/app/ui/pages/home_page/widgets/music_list_item.dart';
import 'package:music_app/app/ui/theme/index.dart';
import '../../../config/widgets/small_text.dart';
import '../../../config/widgets/text_base.dart';
import '../../../config/widgets/vector_asset.dart';

import '../../../config/widgets/background/custom_background.dart';
import '../player_page/widgets/custom_slider.dart';
import 'widgets/home_appbar.dart';

class HomePage extends GetView<GetXPlayerController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: SafeArea(
        child: Scaffold(
          body: Obx(
            () => Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        HomeAppbar(),
                        TrendingSongs(),
                        TopArtists(),
                        PlayList(),
                      ],
                    ),
                  ),
                ),
                const MiniPlayer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget shuffleButton(VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.fromLTRB(26.r, 24.r, 26.r, 40.r),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap,
            child: VectorAsset(
              icon: 'ic_shuffle',
              size: 24.r,
            ),
          ),
          SizedBox(width: 10.r),
          TextBase(
            'Shuffle',
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
          ),
        ],
      ),
    );
  }
}

class PlayList extends GetView<GetXPlayerController> {
  const PlayList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderSection(title: "Playlist", showAction: false),
        ListView.builder(
          padding: EdgeInsets.only(bottom: 10.r, left: 10.w, right: 10.w),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.playlistNotifier.length,
          itemBuilder: (context, index) => Obx(
            () => InkWell(
              onTap: () => controller.play,
              child: MusicListItem(
                image: controller.playlistNotifier[index].artUri.toString(),
                musicName: controller.playlistNotifier[index].title,
                artistName: 'artist name',
                // onTap: () => Get.bottomSheet(
                //   const BottomSheetPlayer(),
                //   isScrollControlled: true,
                //   enterBottomSheetDuration:
                //       const Duration(milliseconds: 500),
                //   exitBottomSheetDuration:
                //       const Duration(milliseconds: 500),
                // ),
                //onTap: () => Get.toNamed(AppRoutes.player),
                onTap: () => Get.toNamed(AppRoutes.bottomPlayer),
                onTapPause: controller.playlistNotifier[index].title ==
                        controller.currentSongTitleNotifier.toString()
                    ? controller.playButtonNotifier == ButtonState.playing
                        ? controller.pause
                        : controller.play
                    : () {},
                isCurrent: controller.playlistNotifier[index].title ==
                        controller.currentSongTitleNotifier.toString()
                    ? true
                    : false,
                isPlaying: controller.playButtonNotifier == ButtonState.playing
                    ? true
                    : false,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    Key? key,
    required this.title,
    this.action = "View All",
    this.showAction = true,
  }) : super(key: key);
  final String title;
  final String action;
  final bool showAction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: Dimensions.height15,
          left: Dimensions.width10,
          right: Dimensions.width10,
          bottom: Dimensions.height15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmallText(
            text: title,
            textAlign: TextAlign.left,
            weight: FontWeight.w500,
            size: Dimensions.font16,
          ),
          if (showAction)
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  gradient: const LinearGradient(
                    colors: [
                      AppColor.orangeColor,
                      AppColor.pinkColor,
                    ],
                  ),
                ),
                child: SmallText(
                  text: "See More",
                  textAlign: TextAlign.center,
                  color: AppColor.blackTextColor,
                  weight: FontWeight.bold,
                  size: Dimensions.font12,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class MiniPlayer extends GetView<GetXPlayerController> {
  const MiniPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isCloseNotifier.value
          ? const SizedBox.shrink()
          : GestureDetector(
              onTap: () {
                Get.bottomSheet(
                  const BottomSheetPlayer(),
                  isScrollControlled: true,
                  enterBottomSheetDuration: const Duration(milliseconds: 500),
                  exitBottomSheetDuration: const Duration(milliseconds: 500),
                );
              },
              child: Column(
                children: [
                  const MiniPlayerContainer(),
                  SizedBox(height: 8.h, child: const CustomSlider()),
                ],
              ),
            );
    });
  }
}

class MiniPlayerContainer extends GetView<GetXPlayerController> {
  const MiniPlayerContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        width: Get.width,
        height: 70,
        alignment: Alignment.center,
        color: Colors.black38,
        child: Row(
          children: [
            const MiniArtImage(),
            const Expanded(
              child: MiniArtistAndSongName(),
            ),
            Container(
              margin: EdgeInsets.only(right: 10.w),
              child: Row(
                children: [
                  // const MiniPreviousSongButton(),
                  const BackwordSongButton(),
                  SizedBox(width: 15.w),
                  const MiniPlayButton(),
                  SizedBox(width: 15.w),
                  controller.playButtonNotifier.value == ButtonState.paused
                      ? const MiniCloseSongButton()
                      : const MiniNextSongButton(),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

class Playlist extends GetView<GetXPlayerController> {
  const Playlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => ListView.builder(
          itemCount: controller.playlistNotifier.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.playlistNotifier[index].title),
            );
          },
        ),
      ),
    );
  }
}

class MiniArtImage extends GetView<GetXPlayerController> {
  const MiniArtImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h, bottom: 5.h),
      child: AspectRatio(
        aspectRatio: 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Obx(
            () => Image.network(
              controller.currentSongArtNotifier.value,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class MiniArtistAndSongName extends GetView<GetXPlayerController> {
  const MiniArtistAndSongName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextBase(
              controller.currentSongTitleNotifier.value,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 3.r),
            TextBase(
              "artist name",
              fontWeight: FontWeight.w500,
              fontSize: 13.sp,
              color: Colors.white54,
            ),
          ],
        ),
      ),
    );
  }
}

class MiniPreviousSongButton extends GetView<GetXPlayerController> {
  const MiniPreviousSongButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap:
            (controller.isFirstSongNotifier.value) ? null : controller.previous,
        child: VectorAsset(
          icon: 'ic_backward',
          size: 26.r,
          color: (controller.isFirstSongNotifier.value)
              ? Colors.white54
              : Colors.white,
        ),
      ),
    );
  }
}

class MiniPlayButton extends GetView<GetXPlayerController> {
  const MiniPlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.playButtonNotifier.value) {
        case ButtonState.loading:
          return Container(
            width: 50.r,
            height: 50.r,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white24,
            ),
            child: const Center(
                child: CircularProgressIndicator(
              color: Colors.white54,
              strokeWidth: 2,
            )),
          );
        case ButtonState.paused:
          return Container(
            width: 50.r,
            height: 50.r,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white24,
            ),
            child: Center(
              child: IconButton(
                icon: const Icon(Icons.play_arrow),
                iconSize: 30.h,
                onPressed: controller.play,
              ),
            ),
          );
        case ButtonState.playing:
          return Container(
            width: 50.r,
            height: 50.r,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white24,
            ),
            child: Center(
              child: IconButton(
                icon: const Icon(Icons.pause),
                iconSize: 26.h,
                onPressed: controller.pause,
              ),
            ),
          );
        case ButtonState.idle:
          return const MiniCloseSongButton();
      }
    });
  }
}

class MiniNextSongButton extends GetView<GetXPlayerController> {
  const MiniNextSongButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: (controller.isLastSongNotifier.value) ? null : controller.next,
        child: VectorAsset(
          icon: 'ic_forward',
          size: 26.r,
          color: (controller.isLastSongNotifier.value)
              ? Colors.white54
              : Colors.white,
        ),
      ),
    );
  }
}

class MiniCloseSongButton extends GetView<GetXPlayerController> {
  const MiniCloseSongButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
          onTap: () {
            controller.isCloseNotifier.value = true;
          },
          child: Icon(
            Icons.close,
            color: (controller.isLastSongNotifier.value)
                ? Colors.white54
                : Colors.white,
            size: 26.h,
          )
          // VectorAsset(
          //   icon: 'ic_close',
          //   size: 26.r,
          //   color: (controller.isLastSongNotifier.value)
          //       ? Colors.white54
          //       : Colors.white,
          // ),
          ),
    );
  }
}

class BackwordSongButton extends GetView<GetXPlayerController> {
  const BackwordSongButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: (controller.playlistNotifier.isNotEmpty)
            ? controller.backwordSeek10Sec
            : null,
        child: Transform.scale(
          scaleX: -1,
          child: const Icon(
            Icons.forward_10_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class TrendingSongs extends GetView<GetXPlayerController> {
  const TrendingSongs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const HeaderSection(title: "Trending Songs"),
        SizedBox(
          height: 160.h,
          child: Obx(() {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: controller.playlistNotifier.length,
                itemBuilder: (context, index) {
                  return Obx(() {
                    return InkWell(
                      onTap: () => Get.toNamed(AppRoutes.bottomPlayer),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 110.h,
                            width: 120.w,
                            margin: EdgeInsets.only(left: 10.w, right: 5.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(style: BorderStyle.none),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  controller.playlistNotifier[index].artUri
                                      .toString(),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(left: 15.w, top: 4.h),
                              child: SmallText(
                                text: controller.playlistNotifier[index].title,
                                size: Dimensions.font12,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(left: 15.w, top: 4.h),
                              child: SmallText(
                                text: "Artist Name",
                                size: Dimensions.font10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
                });
          }),
        ),
      ],
    );
  }
}

class TopArtists extends GetView<GetXPlayerController> {
  const TopArtists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderSection(title: "Top Artist"),
        Container(
          height: 140.h,
          alignment: Alignment.center,
          color: Colors.white10,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Artists.artistList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.artistPage);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 80.h,
                        width: 80.w,
                        margin: EdgeInsets.only(left: 5.w, right: 5.w),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColor.orangeColor, width: 3.w),
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            colors: [
                              AppColor.orangeColor,
                              AppColor.pinkColor,
                            ],
                          ),
                        ),
                        child: ClipOval(
                          child: Image.network(
                            Artists.artistList[index].imgUrl.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                       Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(left: 15.w, top: 4.h),
                          child: SmallText(
                            text: Artists.artistList[index].title ?? "",
                            size: Dimensions.font12,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 15.w, top: 4.h),
                          child: SmallText(
                            text: "Artist Name",
                            size: Dimensions.font10,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
