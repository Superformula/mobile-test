import 'package:qrGenerator/domain/models/seed_dto.dart';
import 'package:qrGenerator/domain/models/seed.dart';

import 'mapper.dart';

/// Maps a Seed DTO (server model) to a Domain model.
///
/// Why are two models necessary?
/// A best practice for apps at scale; the app's internal logic can stay dependent on the
/// domain model and enjoy some separation from the vagaries of the external/server model.
///
/// In this case there is a one-to-one correlation of both models' attributes, but that could
/// potentially not always be the case.
class SeedModelMapper implements Mapper<SeedDTO, Seed> {
  @override
  Seed map(SeedDTO input) {
    return Seed(
      seed: input.seed,
      expiresAt: input.expiresAt
    );
  }
}