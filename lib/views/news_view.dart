import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarea_6/bloc/news/news_bloc.dart';
import 'package:tarea_6/bloc/news/news_event.dart';
import 'package:tarea_6/bloc/news/news_state.dart';
import 'package:tarea_6/services/news_service.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(NewsService())..add(FetchNewsEvent()),
      child: Scaffold(
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is NewsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is NewsError) {
              return Center(child: Text('Error: ${state.errorMessage}'));
            } else if (state is NewsSuccess) {
              return _buildNewsList(state.newsArticles);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildNewsList(List<dynamic> newsArticles) {
    const String logoUrl =
        'https://images.squarespace-cdn.com/content/v1/5416f6d7e4b03a1356fc6cff/1576551158047-IQ9D3JIGSKIHGO4E4MCA/logo_designmilk.png';

    return Column(
      children: [
        const SizedBox(
          height: 4,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.network(logoUrl, height: 80),
        ),
        const SizedBox(
          height: 4,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: newsArticles.length > 3 ? 3 : newsArticles.length,
            itemBuilder: (context, index) {
              final article = newsArticles[index];
              return Card(
                color: const Color.fromARGB(255, 238, 242, 255),
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Text(
                    article['title']['rendered'] ?? 'No title',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 84, 124, 255),
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    article['content']['rendered']
                            .replaceAll(RegExp(r'<[^>]*>'), '')
                            .substring(0, 100) +
                        '...',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 98, 110, 148)),
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.link,
                      color: Color.fromARGB(255, 84, 124, 255),
                    ),
                    onPressed: () => launchUrl(Uri.parse(article['link'])),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
