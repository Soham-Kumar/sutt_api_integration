import 'package:flutter/material.dart';
//import 'package:sutt_task_2/post_main_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:sutt_task_2/constants.dart';

String startStation = '';

class TrainDetails extends StatefulWidget {
  TrainDetails({required this.trainNo});
  int trainNo;
  @override
  State<TrainDetails> createState() => _TrainDetailsState();
}

Map trainResponse = {};
List listResponse2 = [];

class _TrainDetailsState extends State<TrainDetails> {

  Uri uri = Uri.https("https://irctc1.p.rapidapi.com/api/v1/getTrainSchedule?trainNo=1296");

  Future detailsApiCall() async {
    http.Response response;
    response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "18af1cdc35msh487e0f4a2175322p1a4673jsnea2c3e98dd82",
      "X-RapidAPI-Host": "irctc1.p.rapidapi.com",});
    if (response.statusCode == 200) {
      setState(() {
        trainResponse = json.decode(response.body);
        listResponse2 = trainResponse['data']['route'];
      });
    }
  }


  @override
  void initState() {
    detailsApiCall();
    super.initState();
  }

  TextEditingController stationInputTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                style: const TextStyle(
                  color: Colors.black,
                ),
                controller: stationInputTEC,
              ),
            ),
            ListView.builder(itemBuilder: (context, index){
              return Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Station Code : ",
                      ),
                      Text(
                        listResponse2[index]['station_code'].toString(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Station Name : ",
                      ),
                      Text(
                        listResponse2[index]['station_name'].toString(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Train will arrive on : ",
                      ),
                      Text(
                        listResponse2[index]['day'].toString(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Distance from source is: ",
                      ),
                      Text(
                        listResponse2[index]['distance_from_source'].toString(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Will the train stop at the station or not: ",
                      ),
                      Text(
                        listResponse2[index]['stop'].toString(),
                      ),
                    ],
                  ),
                ],
              );
            },
              itemCount: listResponse2.length,
            ),
          ],
        )
    );
  }
}
