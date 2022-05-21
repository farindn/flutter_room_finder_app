import 'package:flutter/material.dart';
import 'package:flutter_room_finder_app/theme.dart';

class BottomNavbarItem extends StatelessWidget {
  final String imageUrl;
  final bool isActive;

  const BottomNavbarItem({
    Key? key,
    required this.imageUrl,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          imageUrl,
          width: 26,
        ),
        const Spacer(),
        isActive
            ? Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                  color: purpleColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(
                      30,
                    ),
                  ),
                ),
              )
            : Container(
                color: Colors.transparent,
                width: 30,
                height: 2,
              ),
      ],
    );
  }
}
