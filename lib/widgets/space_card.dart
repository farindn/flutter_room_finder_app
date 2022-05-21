import 'package:flutter/material.dart';
import 'package:flutter_room_finder_app/pages/detail_page.dart';
import 'package:flutter_room_finder_app/theme.dart';

class SpaceCard extends StatelessWidget {
  late int id;
  late String name;
  late String city;
  late String country;
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

  SpaceCard({
    Key? key,
    required this.id,
    required this.name,
    required this.city,
    required this.country,
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

  SpaceCard.fromJson(json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    country = json['country'];
    price = json['price'];
    image_url = json['image_url'];
    rating = json['rating'];
    address = json['address'];
    phone = json['phone'];
    map_url = json['map_url'];
    photos = json['photos'];
    number_of_kitchens = json['number_of_kitchens'];
    number_of_bedrooms = json['number_of_bedrooms'];
    number_of_cupboards = json['number_of_cupboards'];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  name: name,
                  city: city,
                  price: price,
                  image_url: image_url,
                  rating: rating,
                  address: address,
                  phone: phone,
                  map_url: map_url,
                  photos: photos,
                  number_of_kitchens: number_of_kitchens,
                  number_of_bedrooms: number_of_bedrooms,
                  number_of_cupboards: number_of_cupboards,
                ),
              ),
            );
          },
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  18,
                ),
                child: SizedBox(
                  width: 130,
                  height: 110,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.network(
                            image_url,
                            width: 130,
                            height: 110,
                            fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 70,
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
                                  top: 4,
                                  bottom: 4,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star_rounded,
                                      color: orangeColor,
                                      size: 18,
                                    ),
                                    const SizedBox(
                                      width: 0,
                                    ),
                                    Text(
                                      " $rating/5",
                                      style: whiteTextStyle.copyWith(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
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
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "$city, $country",
                    style: darkGreyTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
