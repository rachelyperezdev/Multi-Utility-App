import 'package:equatable/equatable.dart';

abstract class UniversityEvent extends Equatable {
  const UniversityEvent();

  @override
  List<Object?> get props => [];
}

class FetchUniversities extends UniversityEvent {
  final String country;

  const FetchUniversities(this.country);

  @override
  List<Object?> get props => [country];
}
