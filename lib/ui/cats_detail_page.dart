import 'package:flutter/material.dart';

import '../models/cat.dart';

class CatsDetailPage extends StatelessWidget {
  final Cat? cat;

  const CatsDetailPage({this.cat, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cats Breed Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Breed: ${cat?.breed ?? ""}"),
          const SizedBox(
            height: 5.0,
          ),
          Text("Country: ${cat?.country ?? ""}"),
          const SizedBox(
            height: 5.0,
          ),
          Text("Origin: ${cat?.origin ?? ""}"),
          const SizedBox(
            height: 5.0,
          ),
          Text("Origin: ${cat?.coat ?? ""}"),
          const SizedBox(
            height: 5.0,
          ),
          Text("Pattern: ${cat?.pattern ?? ""}"),
          const SizedBox(
            height: 5.0,
          ),
        ]),
      ),
    );
  }
}
