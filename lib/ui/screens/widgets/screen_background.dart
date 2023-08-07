import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager_api/ui/screens/utils/assets_utils.dart';

class ScreenBackground extends StatelessWidget {
  final Widget child;

  const ScreenBackground({Key?key, required this.child}) : super(key: key);
  
  


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SvgPicture.asset(AssetsUtils.backgroundSVG , fit: BoxFit.cover,),

        ),
        SafeArea(child: child),

      ]
    );
  }
}