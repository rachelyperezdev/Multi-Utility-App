import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarea_6/bloc/universities/university_event.dart';
import 'package:tarea_6/bloc/universities/university_state.dart';
import 'package:tarea_6/services/university_service.dart';

class UniversityBloc extends Bloc<UniversityEvent, UniversityState> {
  final UniversityService _universityService;

  UniversityBloc(this._universityService) : super(UniversityInitial()) {
    on<FetchUniversities>(_onFetchUniversities);
  }

  Future<void> _onFetchUniversities(
      FetchUniversities event, Emitter<UniversityState> state) async {
    emit(UniversityLoading());

    try {
      final universities =
          await _universityService.getUniversities(event.country);
      emit(UniversitySuccess(universities));
    } catch (e) {
      emit(const UniversityError('No se pudieron obtener las universidades'));
    }
  }
}
