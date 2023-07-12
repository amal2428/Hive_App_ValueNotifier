import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_valuenotifier/db_functions.dart';

class HomePage extends StatelessWidget {
  final TextEditingController userTextController = TextEditingController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> textNotifier = ValueNotifier<String>("");

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hive App",
          style: TextStyle(color: Colors.white60, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple[700],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: userTextController,
              decoration: const InputDecoration(
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.redAccent),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ValueListenableBuilder(
              valueListenable: textNotifier,
              builder: (context, text, child) {
                return Text(text);
              },
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton.icon(
              onPressed: () async {
                try {
                  textNotifier.value = userTextController.text;
                  int key = await HiveFunctions.create(
                      value: userTextController.text);
                  textNotifier.value = key.toString();
                } catch (e) {
                  log("Create error: $e");
                }
              },
              icon: const Icon(Icons.create_outlined),
              label: const Text("Create"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () async {
                try {
                  int key = int.parse(userTextController.text);
                  String data = await HiveFunctions.read(key: key);
                  textNotifier.value = data;
                  log("Read success: $data");
                } catch (e) {
                  log("Read error: $e");
                }
              },
              icon: const Icon(Icons.read_more),
              label: const Text("Read"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () async {
                try {
                  int key = int.parse(userTextController.text);
                  String data = await HiveFunctions.read(key: key);
                  textNotifier.value = data;
                  log("Read success: $data");
                } catch (e) {
                  log("Read error: $e");
                }
              },
              icon: const Icon(Icons.update),
              label: const Text("Update"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () async {
                try {
                  int key = int.parse(userTextController.text);
                  await HiveFunctions.delete(key: key);
                  textNotifier.value = "Delete success";
                  log("Delete success");
                } catch (e) {
                  log("Delete error: $e");
                }
              },
              icon: const Icon(Icons.delete_forever),
              label: const Text("Delete"),
            )
          ],
        ),
      ),
    );
  }
}
