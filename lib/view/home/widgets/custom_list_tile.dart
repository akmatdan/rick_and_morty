import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:the_rick_and_morty/data/models/character.dart';
import 'package:the_rick_and_morty/view/home/widgets/character_status.dart';

class CustomListTile extends StatelessWidget {
  final Results results;
  const CustomListTile({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: MediaQuery.of(context).size.height / 7,
        color: const Color.fromRGBO(86, 86, 86, 0.8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Image of character
            CachedNetworkImage(
              imageUrl: results.image,
              placeholder: (context, url) => const Padding(
                padding: EdgeInsets.only(left: 20),
                child: CircularProgressIndicator(
                  color: Colors.grey,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),

            // Name of character
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Character name
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.9,
                    child: Text(
                      results.name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Character status
                  CharacterStatus(
                      liveState: results.status == 'Alive'
                          ? LiveState.alive
                          : results.status == 'Dead'
                              ? LiveState.dead
                              : LiveState.unknown),
                  const SizedBox(height: 20),

                  // Character species and gender
                  SpeciesAndGender(results: results),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SpeciesAndGender extends StatelessWidget {
  const SpeciesAndGender({
    super.key,
    required this.results,
  });

  final Results results;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Species:',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 2),
                Text(
                  results.species,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Gender:',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 2),
                Text(
                  results.gender,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            )
          ]),
    );
  }
}
