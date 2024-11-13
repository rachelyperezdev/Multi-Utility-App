import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarea_6/bloc/news/news_event.dart';
import 'package:tarea_6/bloc/news/news_state.dart';
import 'package:tarea_6/services/news_service.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsService _newsService;

  NewsBloc(this._newsService) : super(NewsLoading()) {
    on<FetchNewsEvent>((event, emit) async {
      emit(NewsLoading());
      try {
        final newsArticles = await _newsService.getNews();
        emit(NewsSuccess(newsArticles));
      } catch (e) {
        emit(NewsError(e.toString()));
      }
    });
  }
}
