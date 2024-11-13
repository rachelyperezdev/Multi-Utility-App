import 'package:bloc/bloc.dart';
import 'package:tarea_6/services/gender_service.dart';
import 'gender_event.dart';
import 'gender_state.dart';
import 'package:flutter/material.dart';

class GenderBloc extends Bloc<GenderEvent, GenderState> {
  final GenderService _genderService;

  GenderBloc(this._genderService) : super(GenderInitial()) {
    on<PredictGender>(_onPredictGender);
  }

  Future<void> _onPredictGender(
      PredictGender event, Emitter<GenderState> emit) async {
    emit(GenderLoading());
    try {
      final gender = await _genderService.getGender(event.name);
      final displayGender = gender == 'male' ? 'masculino' : 'femenino';
      final color = gender == 'male'
          ? Colors.blueAccent.shade200
          : Colors.pinkAccent.shade100;

      emit(GenderSuccess(displayGender, color));
    } catch (e) {
      emit(const GenderError('Género no encontrado'));
    }
  }
}
