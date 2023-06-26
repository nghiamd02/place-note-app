import 'package:fav_place_app/screens/add_place.dart';
import 'package:fav_place_app/model/place.dart';
import 'package:fav_place_app/provider/places_provider.dart';
import 'package:fav_place_app/screens/place_detals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesList extends ConsumerWidget {
  const PlacesList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Place> places = ref.watch(placesNotifierProvider);

    Widget content;
    if (places.isEmpty) {
      content = Center(
        child: Text(
          'No places added yet!',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      );
    } else {
      content = ListView.builder(
          itemCount: places.length,
          itemBuilder: (ctx, index) {
            return ListTile(
              leading: CircleAvatar(
                  radius: 24, backgroundImage: FileImage(places[index].image)),
              title: Text(
                places[index].name,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => PlaceDetails(place: places[index]))),
            );
          });
    }

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
        body: content);
  }
}
