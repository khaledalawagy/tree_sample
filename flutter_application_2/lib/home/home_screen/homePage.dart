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

  const MyHomePage({this.title, this.body, this.image, super.key});

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
        title: Text("The ${title ?? "Tree"}"),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            image == null || image!.isEmpty
                ? Image.asset("assets/tree.jpg")
                : Image.file(
                  image![0],
                  height: 300,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,

              children: [
                FavoriteWidget(),
                IconButton(onPressed: () {}, icon: Icon(Icons.share)),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textAlign: TextAlign.justify,
                body ??
                    "Plants and flowers play a crucial role in nature, as they produce oxygen that sustains life for most organisms on Earth. They also absorb carbon dioxide, helping to maintain the planet’s balance and improve air quality. Flowers add beauty to the environment and support pollinators like bees and butterflies, which are vital for ecosystems. Additionally, many plants provide food, medicine, and materials that humans and animals rely on for survival.",
              ),
            ),

            image == null || image!.isEmpty
                ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const MySeason(
                      url: "assets/tree_spring.jpg",
                      text: "Spring",
                    ),
                    const MySeason(url: "assets/tree_fall.jpg", text: "Fall"),
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
        child: Icon(Icons.next_plan),
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
