import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:untitled7/network/universal_response.dart';

import '../model/card_model.dart';

class ApiProvider {
  Future<UniversalResponse> getCardInfo() async {
    try {
      https.Response response = await https
          .get(Uri.parse("https://banking-api.free.mockoapp.net/user_cards"));
      var data = UniversalResponse(
          data: (jsonDecode(response.body) as List?)
                  ?.map((e) => CardModel.fromJson(e))
                  .toList() ??
              []);
      return data;
    } catch (e) {
      return UniversalResponse(error: e.toString());
    }
  }
}
