import 'package:fav_place_app/add_place.dart';
import 'package:fav_place_app/model/place.dart';
import 'package:fav_place_app/provider/places_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesList extends ConsumerWidget {
  const PlacesList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Place> places = ref.watch(placesNotifierProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Places'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) => NewPlace()));
                },
                child: const Icon(Icons.add))
          ],
        ),
        body: ListView.builder(
            itemCount: places.length,
            itemBuilder: (ctx, index) {
              return ListTile(
                title: Text(
                  places[index].name,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              );
            }));
  }
}
