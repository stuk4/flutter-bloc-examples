import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
part 'guests_event.dart';
part 'guests_state.dart';

const uuid = Uuid();

class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {
  GuestsBloc()
      : super(GuestsState(guests: [
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now()),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now()),
        ])) {
    on<SetCustomFilterEvent>((event, emit) {
      emit(state.copyWith(filter: event.newFilter));
    });
    on<AddGuestEvent>(_addGuestHandler);
    on<ToggleGuestEvent>(_toggleGuestHandler);
  }

  void changeFilter(GuestFilter newFilter) {
    add(SetCustomFilterEvent(newFilter));
  }

  void addGuest(String name) {
    add(AddGuestEvent(name));
  }

  void _addGuestHandler(AddGuestEvent event, Emitter<GuestsState> emit) {
    final newGuest =
        Todo(id: uuid.v4(), description: event.name, completedAt: null);
    emit(state.copyWith(guests: [...state.guests, newGuest]));
  }

  void toggleGuest(String id) {
    add(ToggleGuestEvent(id));
  }

  void _toggleGuestHandler(ToggleGuestEvent event, Emitter<GuestsState> emit) {
    final newGuests = state.guests.map((guest) {
      if (guest.id == event.id) {
        return guest.copyWith(
            completedAt: guest.completedAt == null ? DateTime.now() : null);
      }
      return guest;
    }).toList();

    emit(state.copyWith(guests: newGuests));
  }
}
