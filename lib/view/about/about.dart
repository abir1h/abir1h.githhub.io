import 'package:flutter/material.dart';

import '../../view model/responsive.dart';
import 'about_desktop.dart';
import 'about_mobile.dart';
import 'about_tablet.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        tablet: AboutTab(),
        mobile: AboutMobile(),
        desktop: AboutDesktop(),
        largeMobile: AboutMobile());
  }
}
