import 'package:flutter/material.dart';
import 'package:untitled7/network/api_provider.dart';
import 'package:untitled7/network/api_repository.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../model/card_model.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final ApiRepository apiRepository = ApiRepository(apiProvider: ApiProvider());
  List<CardModel> cardModel = [];

  bool isLoading = false;

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    cardModel = await apiRepository.fetchCardModel();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("card info",style: TextStyle(color: Colors.blue),
      )),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
                  children: List.generate(cardModel.length, (index) {
                  CardModel card = cardModel[index];
                  String a = "0xFF${(card.colors.colorA.replaceAll('#', ''))}";
                  String b = "0xFF${(card.colors.colorB.replaceAll('#', ''))}";
                  return ZoomTapAnimation(
                    child: Container(
                      margin: EdgeInsets.all(15),
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                            color: Colors.blue,
                            gradient: LinearGradient(colors: [
                             Color(int.parse(a)),
                             Color(int.parse(b)),
                            ])),
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           Row(children: [Container(
                               width:  MediaQuery.of(context).size.width /3.1,
                               child: Text(card.bankName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white),)),
                      SizedBox(width: MediaQuery.of(context).size.width / 2.5,),
                      Container(
                          width: 50,
                          height: 50,
                          child: Image.network("${card.iconImage}")),
                      ],),
                            SizedBox(height:  MediaQuery.of(context).size.height / 30,),
                            Text("${card.moneyAmount}   ${card.cardCurrency}"),
                            SizedBox(height: MediaQuery.of(context).size.height / 30,),
                         Row(children: [
                           Text("${card.cardNumber}",),
                           SizedBox(width: MediaQuery.of(context).size.width / 2.3,),
                           Text("${card.expireData.substring(2,4)}/${card.expireData.substring(5,7)}")
                         ],),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 130),
                              child: Text("${card.cardType}"),
                            ),
                          ],
                        )),
                  );
                })),
    );
  }
}
