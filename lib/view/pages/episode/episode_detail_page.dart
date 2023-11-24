import 'package:flutter/material.dart';
import 'package:the_rick_and_morty/data/models/episode.dart';

class EpisodeDetail extends StatelessWidget {
  final Results results;

  const EpisodeDetail({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Episodes'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Name: ${results.name}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'Air Date: ${results.air_date}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Episode: ${results.episode}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'Characters',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            if (results.characters.isNotEmpty)
              Column(
                children: results.characters
                    .map((characterUrl) => _buildCharacterLink(characterUrl))
                    .toList(),
              ),
            const SizedBox(height: 16),
            Text(
              'URL: ${results.url}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCharacterLink(String characterUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: GestureDetector(
        onTap: () {
          // TODO: Navigate to the character detail page
        },
        child: Text(
          'Character Details',
          style: TextStyle(
            fontSize: 16,
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
