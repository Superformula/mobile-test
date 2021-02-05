/// Interface for mapping operations from DTOs to Domain models.
abstract class Mapper<I, O> {
  O map(I input);
}