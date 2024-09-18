import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view%20model/getx_controllers/projects_controller.dart';

import '../../configs/app_dimensions.dart';
import '../../configs/app_theme.dart';
import '../../configs/app_typography.dart';
import '../../configs/space.dart';
import '../../widget/custom_text_heading.dart';
import 'about_desktop.dart';
class AboutMobile extends StatelessWidget {
  const AboutMobile({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      padding: Space.h,
      child: Column(
        children: [
          const CustomSectionHeading(
            text: '\nAbout Me',
          ),
          const CustomSectionSubHeading(
            text: 'Get to know me :)',
          ),
          Space.y1!,
          Image.asset(
            "${assetHolder}profile_pic.png",
            height:  size.height * 0.27,
          ),
          SizedBox(
            height: size. height * 0.03,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Who am I?",
              style: AppText.b2!.copyWith(
                color: AppTheme.c!.primary,
              ),
            ),
          ),
          Space.y1!,
          Text(
            "AboutUtils.aboutMeHeadline",
            style: AppText.b2b!.copyWith(
              fontFamily: 'Montserrat',
            ),
          ),
          SizedBox(
            height:  size.height * 0.02,
          ),
          Text(
           " AboutUtils.aboutMeDetail",
            style: AppText.l1!.copyWith(
              height: 2,
              letterSpacing: 1.1,
              fontFamily: 'Montserrat',
            ),
          ),
          Space.y!,
          Divider(
            color: Colors.grey[800],
            thickness: AppDimensions.normalize(0.5),
          ),
          Space.y!,
          Text(
            'Technologies I have worked with:',
            style: AppText.l1!.copyWith(
              color: AppTheme.c!.primary,
            ),
          ),
          Space.y!,

          Space.y!,
          Divider(
            color: Colors.grey[800],
            thickness: AppDimensions.normalize(0.5),
          ),
          SizedBox(
            height:  size.height * 0.02,
          ),
          const AboutMeData(
            data: "Name",
            information: "Muhammad Hamza",
          ),
          const AboutMeData(
            data: "Email",
            information: "hamza.6.shakeel@gmail.com",
          ),
          Space.y!,

          Space.y!,

        ],
      ),
    );
  }
}
