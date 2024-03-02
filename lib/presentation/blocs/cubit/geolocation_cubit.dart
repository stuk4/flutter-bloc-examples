import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'geolocation_state.dart';

class GeolocationCubit extends Cubit<GeolocationState> {
  GeolocationCubit() : super(const GeolocationState());
}
