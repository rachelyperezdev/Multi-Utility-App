import 'package:equatable/equatable.dart';

abstract class GenderEvent extends Equatable {
  const GenderEvent();

  @override
  List<Object?> get props => [];
}

class PredictGender extends GenderEvent {
  final String name;

  const PredictGender(this.name);

  @override
  List<Object?> get props => [name];
}
