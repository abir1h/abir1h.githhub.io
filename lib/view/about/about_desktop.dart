import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view%20model/getx_controllers/projects_controller.dart';

import '../../configs/app_dimensions.dart';
import '../../configs/app_theme.dart';
import '../../configs/app_typography.dart';
import '../../configs/space.dart';
import '../../widget/custom_text_heading.dart';




class AboutDesktop extends StatelessWidget {
  const AboutDesktop({super.key});

  @override
  Widget build(BuildContext context) {    var size = MediaQuery.of(context).size;


  return Container(
      padding: Space.h,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomSectionHeading(
              text: '\nAbout Me',
            ),
            const CustomSectionSubHeading(
              text: 'Get to know me :)',
            ),
            Row(
              children: [
                Expanded(
                  child: Image.asset(
                   "${assetHolder}profile_pic.png",
                    height:  size.height * 0.7,
                  ),
                ),
                Expanded(
                  flex: MediaQuery.of(context).size. width < 1230 ? 2 : 1,
                  child: Container(
                    padding: EdgeInsets.only(left:  MediaQuery.of(context).size.width < 1230 ? 25.0 : 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Who am I?',
                          style: AppText.b1!.copyWith(
                            color: AppTheme.c!.primary,
                          ),
                        ),
                        Text(
                          "I am a skilled Flutter developer with 3 years of hands-on experience in building cross-platform applications. My expertise lies in developing user-friendly, high-performance mobile apps with clean and maintainable code. Over the years, I've successfully implemented features such as authentication, state management, local data storage, and dynamic UI components, ensuring seamless user experiences across both Android and iOS platforms. My commitment to code quality and attention to detail allows me to create scalable and robust applications tailored to meet client needs.",
                          style: AppText.b1b!.copyWith(
                            fontFamily: 'Montserrat',fontWeight: FontWeight.w400,fontSize: 12
                          ),
                        ),

                        Divider(
                          color: Colors.grey[800],
                          thickness: AppDimensions.normalize(0.5),
                        ),
        

                         const Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AboutMeData(
                                  data: "Name",
                                  information: "Abir Rahman",
                                ),
                                AboutMeData(
                                  data: "Age",
                                  information: "26",
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AboutMeData(
                                  data: "Email",
                                  information: "abirrahman959@gmail.com",
                                ),

                              ],
                            ),
                          ],
                        ),
                        Space.y1!,
                      ],
                    ),
                  ),
                ),
                Container(
                  width:  MediaQuery.of(context).size.width < 1230 ?  MediaQuery.of(context).size.width * 0.05 :  MediaQuery.of(context).size.width * 0.1,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
class AboutMeData extends StatelessWidget {
  final String data;
  final String information;
  final Alignment? alignment;

  const AboutMeData({
    super.key,
    required this.data,
    required this.information,
    this.alignment,
  });
  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: alignment ?? Alignment.center,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$data: ",
              style: AppText.l1b!.copyWith(
                color: Colors.white ,
              ),
            ),
            TextSpan(
              text: " $information\n",
              style: AppText.l1!.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
