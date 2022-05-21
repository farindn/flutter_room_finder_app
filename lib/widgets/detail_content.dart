import 'package:flutter/material.dart';
import 'package:flutter_room_finder_app/pages/404_page.dart';
import 'package:flutter_room_finder_app/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailContent extends StatelessWidget {
  late String name;
  late String city;
  late int price;
  late String image_url;
  late int rating;
  late String address;
  late String phone;
  late String map_url;
  late List photos;
  late int number_of_kitchens;
  late int number_of_bedrooms;
  late int number_of_cupboards;
  int index = 0;

  DetailContent({
    Key? key,
    required this.name,
    required this.city,
    required this.price,
    required this.image_url,
    required this.rating,
    required this.address,
    required this.phone,
    required this.map_url,
    required this.photos,
    required this.number_of_kitchens,
    required this.number_of_bedrooms,
    required this.number_of_cupboards,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    launch(String url) async {
      if (await canLaunchUrl(Uri.parse(url))) {
        launchUrl(Uri.parse(url));
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ErrorPage(),
          ),
        );
      }
    }

    return Column(
      children: [
        const SizedBox(
          height: 328,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(
                20,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: blackTextStyle.copyWith(
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Text(
                              "\$$price",
                              style: purpleTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              " / month",
                              style: darkGreyTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 108,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: rating >= 1 ? orangeColor : greyColor,
                            size: 20,
                          ),
                          Icon(
                            Icons.star_rounded,
                            color: rating >= 2 ? orangeColor : greyColor,
                            size: 20,
                          ),
                          Icon(
                            Icons.star_rounded,
                            color: rating >= 3 ? orangeColor : greyColor,
                            size: 20,
                          ),
                          Icon(
                            Icons.star_rounded,
                            color: rating >= 4 ? orangeColor : greyColor,
                            size: 20,
                          ),
                          Icon(
                            Icons.star_rounded,
                            color: rating >= 5 ? orangeColor : greyColor,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Main Facilities",
                  style: regularTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/icon_kitchen.png',
                          width: 32,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              "$number_of_kitchens",
                              style: purpleTextStyle.copyWith(fontSize: 14),
                            ),
                            Text(
                              " Kitchen",
                              style: darkGreyTextStyle.copyWith(fontSize: 14),
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/icon_bedroom.png',
                          width: 32,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              "$number_of_bedrooms",
                              style: purpleTextStyle.copyWith(fontSize: 14),
                            ),
                            Text(
                              " Bedroom",
                              style: darkGreyTextStyle.copyWith(fontSize: 14),
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/icon_cupboard.png',
                          width: 32,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              "$number_of_cupboards",
                              style: purpleTextStyle.copyWith(fontSize: 14),
                            ),
                            Text(
                              " Big Cupboard",
                              style: darkGreyTextStyle.copyWith(fontSize: 14),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Photos",
                  style: regularTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ),
        Container(
          color: whiteColor,
          child: Column(
            children: [
              SizedBox(
                height: 88,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: photos.map(
                    (item) {
                      index++;
                      return Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: index == 1 ? 24 : 0,
                              right: 24,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                16,
                              ),
                              child: Image.network(
                                item,
                                width: 110,
                                height: 88,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Location",
                      style: regularTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 213,
                          child: Text(
                            "$address\n$city",
                            style: darkGreyTextStyle.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            launch(map_url);
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: lightGreyColor,
                              borderRadius: BorderRadius.circular(
                                40,
                              ),
                            ),
                            child: Icon(
                              Icons.location_on_sharp,
                              size: 22,
                              color: greyColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
