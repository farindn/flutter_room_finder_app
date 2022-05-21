import 'package:flutter/material.dart';
import 'package:flutter_room_finder_app/providers/space_provider.dart';
import 'package:flutter_room_finder_app/theme.dart';
import 'package:flutter_room_finder_app/widgets/bottom_navbar_item.dart';
import 'package:flutter_room_finder_app/widgets/city_card.dart';
import 'package:flutter_room_finder_app/widgets/space_card.dart';
import 'package:flutter_room_finder_app/widgets/tips_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 425,
            ),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Explore Now",
                        style: blackTextStyle.copyWith(
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Find the cozy places",
                        style: darkGreyTextStyle.copyWith(
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Popular Cities",
                        style: regularTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      SizedBox(
                        width: 24,
                      ),
                      CitiyCard(
                        id: 1,
                        name: "Jakarta",
                        imageUrl: 'assets/images/city_jakarta.png',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CitiyCard(
                        id: 1,
                        name: "Bandung",
                        imageUrl: 'assets/images/city_bandung.png',
                        isFavorite: true,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CitiyCard(
                        id: 1,
                        name: "Surabaya",
                        imageUrl: 'assets/images/city_surabaya.png',
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      CitiyCard(
                        id: 1,
                        name: "Palembang",
                        imageUrl: 'assets/images/city_palembang.png',
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      CitiyCard(
                        id: 1,
                        name: "Aceh",
                        imageUrl: 'assets/images/city_aceh.png',
                        isFavorite: true,
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      CitiyCard(
                        id: 1,
                        name: "Bogor",
                        imageUrl: 'assets/images/city_bogor.png',
                      ),
                      SizedBox(
                        width: 24,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Recommended Spaces",
                        style: regularTextStyle.copyWith(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      FutureBuilder(
                        future: spaceProvider.getRecommendedSpaces(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<SpaceCard> data =
                                snapshot.data as List<SpaceCard>;
                            return Column(
                              children: data
                                  .map((item) => SpaceCard(
                                        id: item.id,
                                        name: item.name,
                                        city: item.city,
                                        country: item.country,
                                        price: item.price,
                                        image_url: item.image_url,
                                        rating: item.rating,
                                        address: item.address,
                                        phone: item.phone,
                                        map_url: item.map_url,
                                        photos: item.photos,
                                        number_of_kitchens:
                                            item.number_of_kitchens,
                                        number_of_bedrooms:
                                            item.number_of_bedrooms,
                                        number_of_cupboards:
                                            item.number_of_cupboards,
                                      ))
                                  .toList(),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                      Text(
                        "Tips & Guidelines",
                        style: regularTextStyle.copyWith(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Column(
                        children: const [
                          TipsCard(
                            imageUrl: 'assets/images/tips1.png',
                            name: "City Guidelines",
                            updateDate: "20 Apr",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TipsCard(
                            imageUrl: 'assets/images/tips2.png',
                            name: "Jakarta Fairship",
                            updateDate: "11 Dec",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50 + 31 + 24,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        constraints: const BoxConstraints(
          maxWidth: 425 - 48,
        ),
        width: MediaQuery.of(context).size.width - 48,
        height: 65,
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        decoration: BoxDecoration(
          color: lightGreyColor,
          borderRadius: BorderRadius.circular(
            23,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_home.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_mail.png',
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_card.png',
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_love.png',
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
