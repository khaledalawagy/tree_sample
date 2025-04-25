import 'package:flutter/material.dart';
import 'package:flutter_application_2/first_screen.dart';
import 'package:flutter_application_2/home/home_screen/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const MyHomePage(),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   final String ? title;
//   final String ? body;
//   const MyHomePage({ this.title,  this.body, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(centerTitle: true, title: Text("the ${title ?? "Tree"}")),
//       body: SingleChildScrollView(
//         // Fixed incorrect usage
//         child: Column(
//           children: [
//             Image.asset("assets/tree.jpg"),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 const FavoriteWidget(),
//                 IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(body ??"fjldljgdhgjljdhlhlghgldhfdhgfd", textAlign: TextAlign.justify),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 const MySeasone(url: "assets/tree_spring.jpg", text: "Spring"),
//                 const MySeasone(url: "assets/tree_fall.jpg", text: "Fall"),
//               ],
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: const Icon(Icons.next_plan),
//       ),
//     );
//   }
// }

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
