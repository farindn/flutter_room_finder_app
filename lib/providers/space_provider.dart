import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_room_finder_app/widgets/space_card.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier {
  getRecommendedSpaces() async {
    var result = await http.get(
      Uri.parse(
        'https://bwa-cozy.herokuapp.com/recommended-spaces',
      ),
    );

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<SpaceCard> spaces =
          data.map((item) => SpaceCard.fromJson(item)).toList();
      return spaces;
    } else {
      return <SpaceCard>[];
    }
  }
}
