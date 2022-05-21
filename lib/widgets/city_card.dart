import 'package:flutter/material.dart';
import 'package:flutter_room_finder_app/theme.dart';

class CitiyCard extends StatelessWidget {
  final int id;
  final String name;
  final String imageUrl;
  final bool isFavorite;

  const CitiyCard({
    Key? key,
    required this.id,
    required this.name,
    required this.imageUrl,
    this.isFavorite = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Container(
          width: 120,
          height: 150,
          color: lightGreyColor,
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                  isFavorite
                      ? Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: 50,
                            height: 30,
                            decoration: BoxDecoration(
                              color: purpleColor,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(
                                  30,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 16,
                                right: 10,
                                top: 2,
                                bottom: 2,
                              ),
                              child: Icon(
                                Icons.star_rounded,
                                color: orangeColor,
                                size: 22,
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
              const SizedBox(
                height: 11,
              ),
              Text(
                name,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
