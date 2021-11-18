import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:http/http.dart' show Client;

import 'package:qr_code_test/model/constants.dart';

import 'package:qr_code_test/model/seed_model.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_test/model/time_provider.dart';

//Makes a get request to server
//
//Creates a seed then returns that seed.
//Returns null if response is not 200
//Throws an exception if returned with an error
class Networking {
  Client client = Client();

  ///Requests seed from server
  Future<Seed?> getSeed(BuildContext context, Box<Seed> box) async {
    //Loads hive database
    // final box = HiveServices.getSeedFromMemory();

    //Sets URI to base url + specific route
    //Uri url = Uri.parse(baseUrl + "/default/random-qr-seed_seed");
    Uri url = Uri.parse(testUrl);
    //Map<String, String> headers = {'x-api-key': apiKey};
    Map<String, String> headers = {'x-api-key': testKey};
    final response = await client.get(url, headers: headers);
    switch (response.statusCode) {
      case 200:
        Seed seed = Seed.fromJson(json.decode(response.body));

        //Saves seed to Hive database at index 0
        box.putAt(0, seed);

        //Saves state of timer duration in seconds
        context
            .read<TimerProvider>()
            .getTimeToExpire(seed.expiresAt, DateTime.now());
        return seed;
      case 400:
        context.read<TimerProvider>().updateStartTime(60);
        throw Error();

      case 401:
        context.read<TimerProvider>().updateStartTime(60);
        log(response.body);
        throw Error();

      case 403:
        context.read<TimerProvider>().updateStartTime(60);
        log(response.body);
        throw Error();

      case 429:
        context.read<TimerProvider>().updateStartTime(60);
        log(response.body);
        throw Error();
      default:
        context.read<TimerProvider>().updateStartTime(60);
        log(response.body);
        throw Error();
    }

    // if (response.statusCode == 200) {
    //   //Takes json response and converts it to a Seed
    //   Seed seed = Seed.fromJson(json.decode(response.body));

    //   //Saves seed to Hive database at index 0
    //   box.putAt(0, seed);

    //   //Saves state of timer duration in seconds
    //   context
    //       .read<TimerProvider>()
    //       .getTimeToExpire(seed.expiresAt, DateTime.now());

    //   return seed;
    // } else {
    //   return null;
    //   // }
  }
}
