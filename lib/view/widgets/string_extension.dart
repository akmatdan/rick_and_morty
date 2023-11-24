import 'package:the_rick_and_morty/view/widgets/character_status.dart';

extension StringExtension on String {
  LiveState? toLiveState() {
    switch (this) {
      case 'alive':
        return LiveState.alive;
      case 'dead':
        return LiveState.dead;
      case 'unknown':
        return LiveState.unknown;
      default:
        return null;
    }
  }

  SpeciesState? toSpeciesState() {
    switch (this) {
      case 'humane':
        return SpeciesState.human;
      case 'alien':
        return SpeciesState.alien;
      case 'humanoid':
        return SpeciesState.humanoid;
      case 'unknown':
        return SpeciesState.unknown;
      default:
        return null;
    }
  }

  GenderState? toGenderState() {
    switch (this) {
      case 'male':
        return GenderState.male;
      case 'female':
        return GenderState.female;
      case 'unknown':
        return GenderState.unknown;
      default:
        return null;
    }
  }
}
