import 'package:devfestdemo2023/services/network_api.dart';
import 'package:devfestdemo2023/ui/cats_detail_page.dart';
import 'package:flutter/material.dart';

import '../models/cat.dart';

class CatsHomePage extends StatefulWidget {
  const CatsHomePage({super.key});

  @override
  State<CatsHomePage> createState() => _CatsHomePageState();
}

class _CatsHomePageState extends State<CatsHomePage> {
  late Future<List<Cat>> catBreeds;

  @override
  void didChangeDependencies() {
    catBreeds = NetworkApi().fetchCatBreedList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cat Breeds")),
      body: FutureBuilder<List<Cat>>(
        future: catBreeds,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, count) {
                Cat cat = snapshot.data![count];
                return Card(
                  child: ListTile(
                    title: Text(cat.breed ?? ""),
                    subtitle: Text(cat.country ?? ""),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CatsDetailPage(
                            cat: cat,
                          )));
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
