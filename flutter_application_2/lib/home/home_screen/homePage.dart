import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/first_screen.dart';
import 'package:flutter_application_2/home/home_widget/favorite.dart';
import 'package:flutter_application_2/home/home_widget/season.dart';
import 'package:flutter_application_2/profile/profile_page/profile_page.dart';

// import 'package:flutter_application_2/';
class MyHomePage extends StatelessWidget {
  final String? title;
  final String? body;
  final List<File>? image;
  const MyHomePage({this.image, this.title, this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            icon: Icon(Icons.account_box),
          ),
        ],
        centerTitle: true,
        title: Text("the ${title ?? "Tree"}"),
      ),
      body: SingleChildScrollView(
        // Fixed incorrect usage
        child: Column(
          children: [
            image == null || image!.isEmpty
                ? Image.asset("assets/tree.jpg")
                : Image.file(
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  image![0],
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const FavoriteWidget(),
                IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                body ?? "fjldljgdhgjljdhlhlghgldhfdhgfd",
                textAlign: TextAlign.justify,
              ),
            ),
            image == null || image!.isEmpty
                ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const MySeasone(
                      url: "assets/tree_spring.jpg",
                      text: "Spring",
                    ),
                    const MySeasone(url: "assets/tree_fall.jpg", text: "Fall"),
                  ],
                )
                : SizedBox(
                  height: 500,
                  child: GridView.builder(
                    itemCount: image!.length,
                    itemBuilder:
                        (context, index) => Image.file(
                          image![index],
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                  ),
                ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FirstScreen()),
          );
        },
        child: const Icon(Icons.next_plan),
      ),
    );
  }
}

// class MySeasone extends StatelessWidget {
//   final String url;
//   final String text;
//   const MySeasone({required this.url, required this.text, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.bottomCenter,
//       children: [
//         Image.asset(url, height: 125, width: 125, fit: BoxFit.cover),
//         Text(text, style: const TextStyle(color: Colors.white, fontSize: 25)),
//       ],
//     );
//   }
// }

// class FavoriteWidget extends StatefulWidget {
//   const FavoriteWidget({super.key});

//   @override
//   State<FavoriteWidget> createState() => _FavoriteWidgetState();
// }

// class _FavoriteWidgetState extends State<FavoriteWidget> {
//   bool click = false;

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         setState(() {
//           click = !click;
//         });
//       },
//       icon: Icon(Icons.favorite, color: click ? Colors.red : Colors.grey),
//     );
//   }
// }
