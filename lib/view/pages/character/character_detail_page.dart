import 'package:flutter/material.dart';
import 'package:the_rick_and_morty/data/models/character.dart';
import 'package:the_rick_and_morty/utils/constants/sizes.dart';
import 'package:the_rick_and_morty/view/widgets/character_status.dart';

class CharacterDetail extends StatelessWidget {
  final Results results;

  const CharacterDetail({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Character Image with Circular Border and Status
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // Circular Border and Status
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: results.status == 'Alive'
                        ? Colors.green
                        : results.status == 'Dead'
                            ? Colors.red
                            : Colors.grey,
                  ),
                  child: CharacterStatus(
                    liveState: results.status == 'Alive'
                        ? LiveState.alive
                        : results.status == 'Dead'
                            ? LiveState.dead
                            : LiveState.unknown,
                  ),
                ),

                // Image
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  width: 190,
                  height: 190,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(results.image),
                    ),
                  ),
                ),

                // Status Text
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: results.status == 'Alive'
                        ? Colors.green
                        : results.status == 'Dead'
                            ? Colors.red
                            : Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    results.status == 'Alive'
                        ? 'Alive'
                        : results.status == 'Dead'
                            ? 'Dead'
                            : 'Unknown',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Character Details
            Text(
              results.name,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              'Properties',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Species: ${results.species}',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Gender: ${results.gender}',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),

            // Button to navigate to episodes
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to episodes page
              },
              child: Text('Episodes'),
            ),
          ],
        ),
      ),
    );
  }
}
