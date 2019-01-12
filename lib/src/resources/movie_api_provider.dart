import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = '7778d8128b38d33c11e3f1fb028e54c9';

  Future<ItemModel> fetchMovieList() async {
    print('entered');
    final response = await client
    .get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");
    print(response.body.toString());
    if (response.statusCode == 200) {
      //If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      //If the call was note successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
