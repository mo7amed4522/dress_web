// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CircleAvatarWidget extends StatelessWidget {
  final VoidCallback onCameraTap;
  final Widget backgroundImage;
  const CircleAvatarWidget({super.key, required this.onCameraTap, required this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            child: CircleAvatar(
              radius: 100.0,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 85,
                child: InkWell(
                  onTap: onCameraTap,
                  child: ClipOval(
                    child: backgroundImage,
                  ),
                ),
              ),
            ),
          )),
    ]);
  }
}
