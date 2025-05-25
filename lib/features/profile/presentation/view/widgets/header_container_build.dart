import 'package:bookapp/features/profile/presentation/view/widgets/profile_header_build.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/colors.dart';


class HeaderContainerBuild extends StatelessWidget {
  const HeaderContainerBuild({super.key, this.image});

  @override
  final String? image;

  Widget build(BuildContext context) {
    return   SizedBox(
      height: 235,
      width: double.infinity,
      child: Stack(
        alignment: const Alignment(0, -12),
        children: [
          Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorsManager.bluecolor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
          ),
          ProfileHeaderBuild(
            image: image ?? '',
          ),
        ],
      ),
    );
  }
}
