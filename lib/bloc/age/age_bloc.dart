import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarea_6/bloc/age/age_event.dart';
import 'package:tarea_6/bloc/age/age_state.dart';
import 'package:flutter/material.dart';
import 'package:tarea_6/services/age_service.dart';

class AgeBloc extends Bloc<AgeEvent, AgeState> {
  final AgeService _ageService;

  AgeBloc(this._ageService) : super(AgeInitial()) {
    on<PredictAge>(_onPredictAge);
  }

  Future<void> _onPredictAge(PredictAge event, Emitter<AgeState> emit) async {
    emit(AgeLoading());
    try {
      final age = await _ageService.getAge(event.name);

      String message;
      Image image;

      if (age < 18) {
        message = 'Joven';
        image = Image.network(
          'https://media.istockphoto.com/id/866676036/photo/group-of-teens.jpg?s=612x612&w=0&k=20&c=-cS86Hziu8PbJD82xabIElemPGKFXr8xaFnWrtZkBHg=',
          width: double.infinity,
          height: 250,
        );
      } else if (age < 60) {
        message = 'Adulto';
        image = Image.network(
          'https://images.unsplash.com/photo-1572021335469-31706a17aaef?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          width: double.infinity,
          height: 250,
        );
      } else {
        message = 'Anciano';
        image = Image.network(
          'https://plus.unsplash.com/premium_photo-1663100162202-c1e6fa87bc5a?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          width: double.infinity,
          height: 250,
        );
      }

      emit(AgeSuccess(age: age, message: message, image: image));
    } catch (e) {
      emit(const AgeError("Error al obtener la edad"));
    }
  }
}
