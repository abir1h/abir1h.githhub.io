import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/projects/components/project_deatail.dart';
import 'package:flutter_portfolio/view/projects/components/video_viewer.dart';
import 'package:get/get.dart';
import '../../../model/project_model.dart';
import '../../../res/constants.dart';
import '../../../view model/getx_controllers/projects_controller.dart';
import '../project_description.dart';
import 'image_viewer.dart';

class ProjectStack extends StatelessWidget {
  final controller = Get.put(ProjectController());
  ProjectStack({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        controller.onHover(index, value);
      },
      onTap: () {
        // ImageViewer(context,projectList[index].image);

        if (projectList[index].video.isNotEmpty) {
          YoutubePlayerScreen(
            videoId: projectList[index].video,
          );
        } else if (isGitHubUrl(projectList[index].link)) {
          ImageViewer(context, projectList[index].image);
        } else {
          ImageViewer(context, projectList[index].image);
        }
      },
      borderRadius: BorderRadius.circular(30),
      child: AnimatedContainer(
        padding: const EdgeInsets.only(
            left: defaultPadding, right: defaultPadding, top: defaultPadding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: bgColor),
        duration: const Duration(milliseconds: 500),
        child: ProjectDetail(
          index: index,
        ),
      ),
    );
  }

  String? extractYouTubeVideoId(String url) {
    final youtubePattern = RegExp(
      r'^(https?:\/\/)?(www\.)?(youtube\.com\/watch\?v=|youtu\.be\/)([\w-]{11})',
    );
    final match = youtubePattern.firstMatch(url);
    if (match != null && match.groupCount >= 4) {
      return match.group(4); // The video ID is in the fourth group
    }
    return null;
  }

  bool isYouTubeUrl(String url) {
    final youtubePattern = RegExp(
      r'^(https?:\/\/)?(www\.)?(youtube\.com\/watch\?v=|youtu\.be\/)[\w-]{11}(&.*)?$',
    );
    return youtubePattern.hasMatch(url);
  }

  bool isGitHubUrl(String url) {
    final githubPattern = RegExp(
      r'^(https?:\/\/)?(www\.)?github\.com\/[\w-]+(\/[\w-]+)?(\/.*)?$',
    );
    return githubPattern.hasMatch(url);
  }
}
