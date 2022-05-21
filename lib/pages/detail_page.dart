import 'package:flutter/material.dart';
import 'package:flutter_room_finder_app/theme.dart';
import 'package:flutter_room_finder_app/widgets/detail_content.dart';
import 'package:flutter_room_finder_app/widgets/detail_header.dart';
import 'package:flutter_room_finder_app/widgets/space_card.dart';
import 'package:url_launcher/url_launcher.dart';
import '404_page.dart';

class DetailPage extends StatefulWidget {
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

  DetailPage({
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
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isClicked = false;

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

    Future<void> showConfirmation() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirmation'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Are you sure will call the space\'s owner?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Call'),
                onPressed: () {
                  Navigator.of(context).pop();
                  launch('tel:+${widget.phone}');
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 425,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: [
                        DetailHeader(image_url: widget.image_url),
                        SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: ListView(
                            children: [
                              DetailContent(
                                name: widget.name,
                                city: widget.city,
                                price: widget.price,
                                image_url: widget.image_url,
                                rating: widget.rating,
                                address: widget.address,
                                phone: widget.phone,
                                map_url: widget.map_url,
                                photos: widget.photos,
                                number_of_kitchens: widget.number_of_kitchens,
                                number_of_bedrooms: widget.number_of_bedrooms,
                                number_of_cupboards: widget.number_of_cupboards,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 24,
                                  right: 24,
                                  bottom: 40,
                                ),
                                child: SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      showConfirmation();
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              purpleColor),
                                      elevation: MaterialStateProperty.all(0),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            17,
                                          ),
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Book Now",
                                        style: whiteTextStyle.copyWith(
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 30,
                            left: 24,
                            right: 24,
                          ),
                          child: SizedBox(
                            child: Row(
                              children: [
                                InkWell(
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(
                                        40,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.keyboard_arrow_left_sharp,
                                      color: purpleColor,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isClicked = !isClicked;
                                    });
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(
                                        40,
                                      ),
                                    ),
                                    child: !isClicked
                                        ? Icon(
                                            Icons.favorite_outline_sharp,
                                            color: purpleColor,
                                            size: 20,
                                          )
                                        : Icon(
                                            Icons.favorite_sharp,
                                            color: orangeColor,
                                            size: 20,
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
