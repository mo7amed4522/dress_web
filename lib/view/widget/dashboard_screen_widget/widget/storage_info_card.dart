// ignore_for_file: prefer_const_constructors

import 'package:dress_web/core/constant/companent.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StorageInfoCard extends StatelessWidget {
  StorageInfoCard({
    Key? key,
    required this.title,
    this.amountOfFiles,
  }) : super(key: key);

  final String title;
  String? amountOfFiles;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Color(0xFFFE270D).withOpacity(0.15)),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: haightlightAR,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          Text(
            amountOfFiles!,
          ),
        ],
      ),
    );
  }
}
