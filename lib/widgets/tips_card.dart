import 'package:flutter/material.dart';
import 'package:flutter_room_finder_app/theme.dart';

class TipsCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String updateDate;

  const TipsCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.updateDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Row(
        children: [
          Image.asset(
            imageUrl,
            width: 80,
            height: 80,
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "Updated $updateDate",
                style: darkGreyTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const Spacer(),
          Icon(
            Icons.keyboard_arrow_right_sharp,
            size: 24,
            color: greyColor,
          ),
        ],
      ),
    );
  }
}
