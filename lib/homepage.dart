import 'package:flutter/material.dart';

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
              onPressed: () {
                textNotifier.value = userTextController.text;
              },
              icon: const Icon(Icons.create_outlined),
              label: const Text("Create"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.read_more),
              label: const Text("Read"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {
                textNotifier.value = userTextController.text;
              },
              icon: const Icon(Icons.update),
              label: const Text("Update"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.delete_forever),
              label: const Text("Delete"),
            )
          ],
        ),
      ),
    );
  }
}
