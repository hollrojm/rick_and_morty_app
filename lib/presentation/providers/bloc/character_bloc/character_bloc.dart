import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_app/infrastructure/models/character_response.dart';
import '../../../../infrastructure/datasources/rick_and_morty_datasource.dart';
part 'character_bloc.freezed.dart';
part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterDatasource charactersRepository;
  CharacterBloc({required this.charactersRepository})
      : super(const CharacterState.loading()) {
    on<CharacterEventFetch>((event, emit) async {
      emit(const CharacterState.loading());
      try {
        Character characterLoaded = await charactersRepository.getCharacter(
            page: event.page, name: event.name);
        emit(CharacterState.loaded(characterLoaded: characterLoaded));
      } catch (_) {
        emit(const CharacterState.error());
      }
    });
  }
}
