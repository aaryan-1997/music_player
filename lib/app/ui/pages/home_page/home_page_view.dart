// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_app/app/player/getx_player_controller.dart';
import 'package:music_app/app/routes/app_pages.dart';
import 'package:music_app/app/ui/pages/home_page/bottom_sheet_player.dart';
import 'package:music_app/app/ui/pages/home_page/widgets/music_list_item.dart';
import 'package:music_app/app/widgets/background/custom_background.dart';
import 'package:music_app/app/widgets/text_base.dart';
import 'package:music_app/app/widgets/vector_asset.dart';

import '../player_page/widgets/custom_slider.dart';
import 'widgets/home_appbar.dart';

class HomePage extends GetView<GetXPlayerController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: CustomBackground()),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.r),
              child: NestedScrollView(
                headerSliverBuilder: (context, value) {
                  return [
                    const SliverToBoxAdapter(child: HomeAppbar()),
                    SliverToBoxAdapter(child: shuffleButton(() {})),
                  ];
                },
                body: Obx(
                  () => ListView.builder(
                    padding: EdgeInsets.only(bottom: 60.r),
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.playlistNotifier.length,
                    itemBuilder: (context, index) => Obx(
                      () => GestureDetector(
                        onTap: () => controller.play,
                        child: MusicListItem(
                          image: controller.playlistNotifier[index].artUri
                              .toString(),
                          musicName: controller.playlistNotifier[index].title,
                          artistName: 'artist name',
                          onTap: () => Get.bottomSheet(
                            const BottomSheetPlayer(),
                            isScrollControlled: true,
                            enterBottomSheetDuration: const Duration(milliseconds: 500),
                            exitBottomSheetDuration: const Duration(milliseconds: 500),
                          ),
                          //onTap: () => Get.toNamed(AppRoutes.player),
                          onTapPause:
                              controller.playlistNotifier[index].title ==
                                      controller.currentSongTitleNotifier.toString()
                                  ? controller.playButtonNotifier ==
                                          ButtonState.playing
                                      ? controller.pause
                                      : controller.play
                                  : () {},
                          isCurrent: controller.playlistNotifier[index].title ==
                              controller.currentSongTitleNotifier,
                          isPlaying: controller.playButtonNotifier ==
                              ButtonState.playing,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const MiniPlayer(),
          BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_books),
                label: "",
              ),
            ],
          ),
        ],
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

class MiniPlayer extends GetView<GetXPlayerController> {
  const MiniPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isCloseNotifier.value
          ? const SizedBox.shrink()
          : GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.player);
              },
              child: Column(
                children: const [
                  MiniPlayerContainer(),
                  SizedBox(height: 20, child: CustomSlider()),
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
                  const MiniPreviousSongButton(),
                  SizedBox(width: 10.w),
                  const MiniPlayButton(),
                  SizedBox(width: 10.w),
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
        child: VectorAsset(
          icon: 'ic_close',
          size: 26.r,
          color: (controller.isLastSongNotifier.value)
              ? Colors.white54
              : Colors.white,
        ),
      ),
    );
  }
}
