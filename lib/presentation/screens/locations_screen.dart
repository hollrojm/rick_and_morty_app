import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/config/theme/app_theme.dart';
import 'package:rick_and_morty_app/presentation/providers/provider/location_provider.dart';
import 'package:rick_and_morty_app/presentation/screens/location_detail_screen.dart';

class LocationsList extends StatefulWidget {
  const LocationsList({super.key});

  @override
  State<LocationsList> createState() => _LocationsListState();
}

class _LocationsListState extends State<LocationsList> {
  @override
  void initState() {
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);
    locationProvider.getLocations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);
    final locations = locationProvider.locations;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Rick and Morty Locations',
          style: AppTheme().getTheme().textTheme.displaySmall,
        ),
      ),
      backgroundColor: Colors.black,
      body: SizedBox(
        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            final location = locations[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LocationDetailScreen(
                      location: location,
                    ),
                  ),
                );
              },
              child: ListTile(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 2, color: Colors.amberAccent),
                  borderRadius: BorderRadius.circular(10),
                ),
                leading: CircleAvatar(
                  backgroundColor: const Color(0xff6ae792),
                  child: Text(
                    locations[index].id.toString(),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                title: Text(location.name!,
                    style: AppTheme().getTheme().textTheme.bodyLarge),
                subtitle: Text(location.type!,
                    style: AppTheme().getTheme().textTheme.bodyMedium),
                trailing: Text(location.dimension!,
                    style: AppTheme().getTheme().textTheme.bodyMedium),
              ),
            );
          },
        ),
      ),
    );
  }
}
