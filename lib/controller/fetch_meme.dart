import 'dart:convert';

import 'package:http/http.dart';

class FetchMeme {
  static fetchNewMeme() async {
    Response response = await get(Uri.parse("https://meme-api.com/gimme"));
    // print(response.body);

    Map bodyData = jsonDecode(response.body);
    // print(bodyData["url"]);

    return bodyData["url"];
  }
}
