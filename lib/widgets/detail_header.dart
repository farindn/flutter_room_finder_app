import 'package:flutter/material.dart';

class DetailHeader extends StatelessWidget {
  late String image_url;

  DetailHeader({
    Key? key,
    required this.image_url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          image_url,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: 350,
        ),
      ],
    );
  }
}
