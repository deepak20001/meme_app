import 'package:flutter/material.dart';
import 'package:meme_app/controller/save_my_data.dart';
import '../controller/fetch_meme.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future<void> updateImg() async {
    String getImgUrl = await FetchMeme.fetchNewMeme();

    setState(() {
      imageUrl = getImgUrl;
      isLoading = false;
    });
  }

  getInitMeme() async {
    // on starting of new app memeNo = 0
    memeNo = await SaveMyData.fetchData() ?? 0;
    setState(() {});
  }

  String imageUrl = "";
  int? memeNo;
  int targetMemeNo = 100;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInitMeme();
    updateImg();
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
            Text(
              "Meme #$memeNo",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Text(
              "Target $targetMemeNo Memes",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            isLoading
                ? Container(
                    height: 40,
                    width: 40,
                    child: CircularProgressIndicator(),
                  )
                : Image.network(
                    imageUrl,
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.contain,
                  ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                isLoading = true;
                await SaveMyData.saveData(memeNo! + 1);
                if (memeNo == 100) targetMemeNo = 500;
                if (memeNo == 500) targetMemeNo = 1000;
                getInitMeme();
                updateImg();
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
