import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

 final TextEditingController editText = TextEditingController();

   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
            TextFormField(controller: editText,


              decoration: const InputDecoration(
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.redAccent),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text("Click the button to show the text"),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.done_outline),
              label: const Text("Upload Text"),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.done_outline),
              label: const Text("Show Text"),
            )
          ],
        ),
      ),
    );
  }
}
