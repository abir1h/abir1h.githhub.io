import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../view model/getx_controllers/projects_controller.dart';
import 'gallery.dart';
class GalleryGrid extends StatefulWidget {
  final int crossAxisCount;
  final double ratio;
  GalleryGrid({super.key, this.crossAxisCount = 3, this.ratio = 1.3});

  @override
  State<GalleryGrid> createState() => _GalleryGridState();
}

class _GalleryGridState extends State<GalleryGrid> {
  final controller = Get.put(ProjectController());
  final CardSwiperController controllerCard = CardSwiperController();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      itemCount: controller.projects.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.crossAxisCount,
        childAspectRatio: widget.ratio,
      ),
      itemBuilder: (context, index) {
        final project = controller.projects[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [   const SizedBox(height: 8), // Space between the card and the text
            Text(
              project.projectName, // Adjust to the property of your project that holds the title
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: CardSwiper(
                controller: controllerCard,
                cardsCount: project.Images.length,
                isDisabled: true,
                numberOfCardsDisplayed: 3,
                backCardOffset: const Offset(40, 40),
                padding: const EdgeInsets.all(24.0),
                onTapDisabled: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return FullScreenDialog(
                        projectsImages: project.Images,
                      );
                    },
                  );
                },
                cardBuilder: (
                    context,
                    indexCard,
                    horizontalThresholdPercentage,
                    verticalThresholdPercentage,
                    ) =>
                    Image.asset(
                      project.Images[indexCard],
                      fit: BoxFit.contain,
                      height: MediaQuery.of(context).size.height / 2,
                    ),
              ),
            ),

          ],
        );
      },
    );
  }
}


class FullScreenDialog extends StatefulWidget {
  final List<String> projectsImages;
  const FullScreenDialog({super.key, required this.projectsImages});

  @override
  State<FullScreenDialog> createState() => _FullScreenDialogState();
}

class _FullScreenDialogState extends State<FullScreenDialog> {
  final controller = Get.put(ProjectController());
  final CardSwiperController controllerCard = CardSwiperController();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: Stack(
        children: [
          // Blurred background
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          // Full-screen content
          Center(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Close button
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  // CardSwiper

                  Expanded(
                    child: Center(
                      child: CardSwiper(
                        controller: controllerCard,
                        cardsCount: widget.projectsImages.length,
                        numberOfCardsDisplayed: 3,
                        backCardOffset: const Offset(40, 40),
                        padding: const EdgeInsets.all(24.0),
                        isLoop: false,
                        onEnd: _showRestartDialog,
                        cardBuilder: (
                            context,
                            indexCard,
                            horizontalThresholdPercentage,
                            verticalThresholdPercentage,
                            ) =>
                            Center(
                              child: Image.asset(
                                widget.projectsImages[indexCard],
                                fit: BoxFit.contain,
                                height: MediaQuery.of(context).size.height,
                              ),
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(

            right: MediaQuery.of(context).size.width/2,
            child:  Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [

                const Text('Swipe to view  more photos',style: TextStyle(color: Colors.white,fontSize: 14),),
                Lottie.asset("${assetHolder}swipe.json",height: 100,width: 100,)
              ],
            ),
          ),)
        ],
      ),
    );
  }


  void _showRestartDialog() {
    showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('No more items!!!'),
        content: const Text('Do you wish to view from the first?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              controllerCard.moveTo(0); // Move to the first image
              Navigator.of(context).pop();
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }



}

