import 'package:flutter/material.dart';
import '../controller/fetch_meme.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future<void> UpdateImg() async {
    String getImgUrl = await FetchMeme.fetchNewMeme();

    setState(() {
      imageUrl = getImgUrl;
    });
  }

  String imageUrl = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UpdateImg();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              "Created for Fun only!!",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Meme #01",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            const Text(
              "Target 500 Memes",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            imageUrl == ""
                ? const CircularProgressIndicator()
                : Image.network(imageUrl),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                UpdateImg();
              },
              child: Container(
                height: 50,
                width: 150,
                child: const Center(
                  child: Text(
                    "More Fun!!",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
