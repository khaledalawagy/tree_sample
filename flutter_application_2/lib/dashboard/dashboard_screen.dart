import 'package:flutter/material.dart';
import 'package:flutter_application_2/add_item/item.dart';
import 'package:flutter_application_2/add_item/item_model.dart';
import 'package:flutter_application_2/details/details_screen/detailsPage.dart';
import 'package:flutter_application_2/add_item/add_item_screen.dart';
import 'package:flutter_application_2/profile/profile_page/profile_page.dart';
import 'package:flutter_application_2/profile/user_model.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final imageProfile = Provider.of<UserModel>(context).user?.image;
    final userModel = Provider.of<UserModel>(context);
    final items = Provider.of<ItemModel>(context);
    File? profileImage; // Ensure profileImage is properly defined.

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
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
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: items.Items.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              items.selectItems(
                Item(
                  images: items.Items[index].images,
                  title: items.Items[index].title,
                  body: items.Items[index].body,
                  favorite: items.Items[index].favorite,
                ),
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsPage()),
              );
            },
            child: Column(
              children: [
                Image.file(
                  items.Items[index].images.first,
                  fit: BoxFit.cover,
                  height: 125,
                  width: 200,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(items.Items[index].title),
                    IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => addItemScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
