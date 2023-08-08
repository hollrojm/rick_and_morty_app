// ignore: file_names
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/config/theme/app_theme.dart';
import 'package:rick_and_morty_app/infrastructure/models/location_response.dart';

class LocationDetailScreen extends StatefulWidget {
  const LocationDetailScreen({
    super.key,
    required this.location,
  });
  final Location location;

  @override
  State<LocationDetailScreen> createState() => _LocationDetailScreenState();
}

class _LocationDetailScreenState extends State<LocationDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        'assets/images/background.jpg',
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              '${widget.location.id}. ${widget.location.name}',
              overflow: TextOverflow.ellipsis,
              style: AppTheme().getTheme().textTheme.displaySmall,
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Dimesion : ${widget.location.dimension}',
                      style: AppTheme().getTheme().textTheme.displaySmall,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Tipo : ${widget.location.type}',
                      style: AppTheme().getTheme().textTheme.displaySmall,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Creación : ${widget.location.created}',
                  style: AppTheme().getTheme().textTheme.displaySmall,
                ),
              ],
            ),
          )),
    ]);
  }
}
