import 'package:flutter/material.dart';
import 'package:fav_place_app/provider/places_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewPlace extends ConsumerStatefulWidget {
  const NewPlace({super.key});

  @override
  ConsumerState<NewPlace> createState() => _NewPlaceState();
}

class _NewPlaceState extends ConsumerState<NewPlace> {
  final _formKey = GlobalKey<FormState>();
  String _namePlace = '';

  void _onSaveBtn() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ref.read(placesNotifierProvider.notifier).addPlaces(_namePlace);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Place'),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
                maxLength: 50,
                decoration: InputDecoration(
                  label: Text(
                    'Title',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                ),
                validator: (value) {
                  if (value == null ||
                      value.trim().length <= 1 ||
                      value.isEmpty) {
                    return 'Must be greater than 1 character';
                  }
                  return null;
                },
                onSaved: (value) => _namePlace = value!,
              ),
              ElevatedButton(
                  onPressed: _onSaveBtn,
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add),
                      SizedBox(
                        width: 4,
                      ),
                      Text('Add')
                    ],
                  ))
            ],
          )),
    );
  }
}
