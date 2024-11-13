import 'package:equatable/equatable.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object?> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsSuccess extends NewsState {
  final List<dynamic> newsArticles;

  const NewsSuccess(this.newsArticles);
}

class NewsError extends NewsState {
  final String errorMessage;

  const NewsError(this.errorMessage);
}
