import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class GenderState extends Equatable {
  const GenderState();

  @override
  List<Object?> get props => [];
}

class GenderInitial extends GenderState {}

class GenderLoading extends GenderState {}

class GenderSuccess extends GenderState {
  final String gender;
  final Color color;

  const GenderSuccess(this.gender, this.color);

  @override
  List<Object?> get props => [gender, color];
}

class GenderError extends GenderState {
  final String message;

  const GenderError(this.message);

  @override
  List<Object?> get props => [message];
}
