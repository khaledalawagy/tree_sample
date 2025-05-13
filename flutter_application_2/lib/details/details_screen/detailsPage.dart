import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/add_item/add_item_screen.dart';
import 'package:flutter_application_2/add_item/item_model.dart';
import 'package:flutter_application_2/details/details_widget/favorite.dart';
import 'package:flutter_application_2/details/details_widget/season.dart';
import 'package:flutter_application_2/profile/profile_page/profile_page.dart';
import 'package:flutter_application_2/profile/user_model.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  // final String? title;
  // final String? body;
  // final List<File>? image;

  const DetailsPage({title, body, image, super.key});

  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserModel>(context);
    final profileImage = userModel.user?.image;
    final items = Provider.of<ItemModel>(context);

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
            icon:
                profileImage == null
                    ? Icon(Icons.account_box)
                    : CircleAvatar(
                      backgroundImage: FileImage(profileImage),
                      radius: 20,
                    ),
          ),
        ],
        centerTitle: true,
        title: Text("The ${items.selectedItem!.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // image == null || image!.isEmpty
            //     ? Image.asset(
            //       "assets/tree.jpg",
            //       height: 300,
            //       width: double.infinity,
            //       fit: BoxFit.cover,
            //     )
            Image.file(
              items.selectedItem!.images.first,
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
                items.selectedItem!.body,
                //  ??
                //     "Plants and flowers play a crucial role in nature, as they produce oxygen that sustains life for most organisms on Earth. They also absorb carbon dioxide, helping to maintain the planet’s balance and improve air quality. Flowers add beauty to the environment and support pollinators like bees and butterflies, which are vital for ecosystems. Additionally, many plants provide food, medicine, and materials that humans and animals rely on for survival."
                //     ,
              ),
            ),
            // image == null || image!.isEmpty
            //     ? Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: [
            //         const MySeason(
            //           url: "assets/tree_spring.jpg",
            //           text: "Spring",
            //         ),
            //         const MySeason(url: "assets/tree_fall.jpg", text: "Fall"),
            //       ],
            //     )
            //     :
            SizedBox(
              height: 500,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: items.selectedItem!.images.length,
                itemBuilder:
                    (context, index) => Image.file(
                      items.selectedItem!.images[index],
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
            MaterialPageRoute(builder: (context) => addItemScreen()),
          );
        },
        child: Icon(Icons.next_plan),
      ),
    );
  }
}
