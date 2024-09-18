import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/view%20model/getx_controllers/projects_controller.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';
import 'package:flutter_portfolio/view/projects/components/title_text.dart';
import 'package:get/get.dart';
import 'gallry_grid.dart';

class GalleryView extends StatelessWidget {
  GalleryView({super.key});
  final controller = Get.put(ProjectController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isLargeMobile(context))
            const SizedBox(
              height: defaultPadding,
            ),
          const TitleText(prefix: '', title: 'Gallery'),
          const SizedBox(
            height: defaultPadding,
          ),
          Expanded(
              child: Responsive(
                  desktop: GalleryGrid(
                    crossAxisCount: 3,
                  ),
                  extraLargeScreen: GalleryGrid(
                    crossAxisCount: 4,
                  ),
                  largeMobile: GalleryGrid(crossAxisCount: 1, ratio: 1.8),
                  mobile: GalleryGrid(crossAxisCount: 1, ratio: 1.5),
                  tablet: GalleryGrid(
                    ratio: 1.4,
                    crossAxisCount: 2,
                  ))),
        ],
      ),
    );
  }
}
