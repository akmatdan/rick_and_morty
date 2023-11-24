import 'package:flutter/material.dart';
import 'package:the_rick_and_morty/data/models/episode.dart';
import 'package:the_rick_and_morty/utils/constants/colors.dart';

class EpisodeListTile extends StatelessWidget {
  final Results results;
  const EpisodeListTile({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: MediaQuery.of(context).size.height / 7,
        color: TColors.secondary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Name of episode
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.9,
                    child: Text(
                      results.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
