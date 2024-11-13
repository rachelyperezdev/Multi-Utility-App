import 'package:equatable/equatable.dart';
import 'package:tarea_6/models/university.dart';

abstract class UniversityState extends Equatable {
  const UniversityState();

  @override
  List<Object?> get props => [];
}

class UniversityInitial extends UniversityState {}

class UniversityLoading extends UniversityState {}

class UniversitySuccess extends UniversityState {
  final List<University> universities;

  const UniversitySuccess(this.universities);

  @override
  List<Object?> get props => [universities];
}

class UniversityError extends UniversityState {
  final String errorMessage;

  const UniversityError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
