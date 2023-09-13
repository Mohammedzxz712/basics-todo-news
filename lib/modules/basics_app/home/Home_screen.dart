import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.menu,
          ),
          title: const Text("FirstApp"),
          actions: [
            IconButton(
                onPressed: () {
                  print("Notification");
                },
                icon: const Icon(
                  Icons.notification_important,
                )),
            IconButton(
                onPressed: () {
                  print("Search");
                },
                icon: const Icon(
                  Icons.search,
                )),
          ],
          // backgroundColor: Colors.greenAccent,
          centerTitle: true,
          //toolbarHeight: 70,
          //foregroundColor: Colors.green,
          //elevation: 30,
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 50,
                horizontal: 50,
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: const Image(
                      image: NetworkImage(
                          'https://static.pexels.com/photos/36753/flower-purple-lical-blosso.jpg'),
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    width: 200,
                    color: Colors.black.withOpacity(.6),
                    alignment: Alignment.center,
                    child: const Text(
                      'Flower',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
