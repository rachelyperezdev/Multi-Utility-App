import 'package:equatable/equatable.dart';

abstract class AgeEvent extends Equatable {
  const AgeEvent();

  @override
  List<Object?> get props => [];
}

class PredictAge extends AgeEvent {
  final String name;

  const PredictAge(this.name);

  @override
  List<Object?> get props => [name];
}
