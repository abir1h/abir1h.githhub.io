import 'package:flutter/cupertino.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';

class ProjectController extends GetxController {
  RxList<bool> hovers = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ].obs;

  onHover(int index, bool value) {
    hovers[index] = value;
  }

  List<ProjectInfo> projects = [
    ProjectInfo(
      projectName: "ADB LMS",
      Images: [
        "${assetHolder}lms_1.png",
        "${assetHolder}lms_2.png",
        "${assetHolder}lms_3.png"
      ],
    ),
    ProjectInfo(
      projectName: "E-Library",
      Images: [
        "${assetHolder}elib_1.png",
        "${assetHolder}elib_2.png",
        "${assetHolder}elib_3.png"
      ],
    ),ProjectInfo(
      projectName: "Restaurant Booking System",
      Images: [
        "${assetHolder}go_1.png",
        "${assetHolder}go_2.png",
        "${assetHolder}go_3.png"
      ],
    ),
  ];
  bool onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }
}

class ProjectInfo {
  final String projectName;
  final List<String> Images;
  ProjectInfo({required this.projectName, required this.Images});
}

const String assetHolder = 'assets/images/';
