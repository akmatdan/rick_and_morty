import 'package:flutter/material.dart';
import 'package:the_rick_and_morty/data/models/character.dart';
import 'package:the_rick_and_morty/utils/constants/colors.dart';
import 'package:the_rick_and_morty/utils/constants/sizes.dart';

class CharacterDetail extends StatelessWidget {
  final Results results;

  const CharacterDetail({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
        backgroundColor: TColors.secondary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Character Image with Circular Border and Status
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  // Circular Border and Status
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: results.status == 'Alive'
                          ? Colors.green
                          : results.status == 'Dead'
                              ? Colors.red
                              : Colors.grey,
                    ),
                  ),

                  // Image
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    width: 290,
                    height: 290,
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
                '-Properties-',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Text(
                      'Species: ',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      results.species,
                      style: Theme.of(context).textTheme.headlineSmall,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),

              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Text(
                      'Gender: ',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      results.gender,
                      style: Theme.of(context).textTheme.headlineSmall,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),

              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Text(
                      'Status: ',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      results.status,
                      style: Theme.of(context).textTheme.headlineSmall,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),

              _buildOriginExpansionTile(results.origin, context),

              const SizedBox(height: 8),
              _buildLocationExpansionTile(results.location, context),

              ElevatedButton(
                onPressed: () {},
                child: Text('Episodes'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOriginExpansionTile(Origin origin, context) {
    return ExpansionTile(
      title: Text(
        'Origin: ${origin.name}',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      children: [
        Text('URL: ${origin.url}'),
      ],
    );
  }

  Widget _buildLocationExpansionTile(Location location, context) {
    return ExpansionTile(
      title: Text(
        'Location: ${location.name}',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      children: [
        Text('URL: ${location.url}'),
      ],
    );
  }
}
