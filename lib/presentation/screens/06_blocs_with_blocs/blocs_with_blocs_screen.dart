import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocsWithBlocsScreen extends StatelessWidget {
  const BlocsWithBlocsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final geoLocationCubit = context.watch<GeolocationCubit>().state.location;
    final historicLocationBloc = context.watch<HistoricLocationBloc>();
    final locationState = historicLocationBloc.state;
    return Scaffold(
      appBar: AppBar(
        title: Text('Locations: ${locationState.howManyLocations}'),
      ),
      body: ListView.builder(
        itemCount: locationState.howManyLocations,
        itemBuilder: (context, index) {
          final location = locationState.locations[index];
          final (lat, lng) = location;
          return ListTile(
            title: Text('Lat: $lat, Lng: $lng'),
          );
        },
      ),
    );
  }
}
