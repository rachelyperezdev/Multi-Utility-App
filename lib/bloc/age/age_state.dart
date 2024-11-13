import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AgeState extends Equatable {
  const AgeState();

  @override
  List<Object?> get props => [];
}

class AgeInitial extends AgeState {}

class AgeLoading extends AgeState {}

class AgeSuccess extends AgeState {
  final int age;
  final String message;
  final Image image;

  const AgeSuccess(
      {required this.age, required this.message, required this.image});

  @override
  List<Object?> get props => [age, message, image];
}

class AgeError extends AgeState {
  final String errorMessage;

  const AgeError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
