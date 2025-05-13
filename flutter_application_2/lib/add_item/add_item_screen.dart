import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/add_item/item.dart';
import 'package:flutter_application_2/add_item/item_model.dart';
import 'package:flutter_application_2/dashboard/dashboard_screen.dart';
import 'package:flutter_application_2/details/details_screen/detailsPage.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class addItemScreen extends StatefulWidget {
  addItemScreen({super.key});

  @override
  State<addItemScreen> createState() => _addItemScreenState();
}

class _addItemScreenState extends State<addItemScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();
  @override
  void dispose() {
    title.dispose();
    body.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(backgroundColor: Colors.transparent),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/background.jpg"),
          ),
        ),

        child: Consumer<ItemModel>(
          builder:
              (context, ItemModel, child) => ListView(
                children: [
                  SizedBox(height: 30),

                  ItemModel.selectedImage!.isEmpty
                      ? Container(
                        color: Colors.white38,

                        height: 150,
                        width: MediaQuery.sizeOf(context).width - 20,

                        child: IconButton(
                          onPressed: () {
                            ItemModel.imageSelector();
                          },
                          icon: Icon(Icons.camera_alt),
                        ),
                      )
                      : Row(
                        children: [
                          Container(
                            color: Colors.white38,

                            height: 100,
                            width: 100,

                            child: IconButton(
                              onPressed: () {
                                ItemModel.imageSelector();
                              },
                              icon: Icon(Icons.camera_alt),
                            ),
                          ),

                          SizedBox(
                            height: 100,
                            width: MediaQuery.sizeOf(context).width - 120,

                            child: ListView(
                              scrollDirection: Axis.horizontal,

                              children:
                                  ItemModel.selectedImage!
                                      .map(
                                        (toElement) => Stack(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 8.0,
                                                  ),
                                              child: Image.file(
                                                toElement,
                                                height: 100,
                                                width: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            ),

                                            IconButton(
                                              onPressed: () {
                                                ItemModel.removeImage(
                                                  ItemModel.selectedImage!
                                                      .indexOf(toElement),
                                                );
                                              },
                                              icon: Icon(Icons.cancel),
                                            ),
                                          ],
                                        ),
                                      )
                                      .toList(),
                            ),
                          ),
                        ],
                      ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: title,
                      decoration: InputDecoration(
                        hintText: "Title",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: body,
                      minLines: 3,
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText: "Body",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),

        onPressed: () {
          final item = Provider.of<ItemModel>(context, listen: false);
          item.addItem(
            Item(
              images: List.from(item.selectedImage!),
              title: title.text,
              body: body.text,
              favorite: false,
            ),
          );

          item.selectedImage!.clear();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DashboardScreen()),
          );
        },
      ),
    );
  }
}
