
import 'package:untitled7/network/api_provider.dart';
import 'package:untitled7/network/universal_response.dart';

import '../model/card_model.dart';

class ApiRepository{


  final ApiProvider apiProvider;

  ApiRepository({required this.apiProvider});

  Future <List<CardModel>> fetchCardModel () async {
    UniversalResponse universalResponse = await apiProvider.getCardInfo();
    if(universalResponse.error.isEmpty){
      return universalResponse.data  as List<CardModel> ;
    }
    return [];
  }
  }