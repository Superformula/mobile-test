import 'main_prod.dart' as main_prod;

/// This main will be used when creating the production
/// build from command line. We just call into main_prod
/// that we use in the IDE.

void main() {
  main_prod.main();
}
