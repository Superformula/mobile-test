import 'package:qr_generator/data/sqlite_persistence.dart';
import 'package:qr_generator/model/seed_model.dart';

class SuperformulaStorage {
  final SqlitePersistence _repository;

  static Future<SuperformulaStorage> createFrom(
      {required Future<SqlitePersistence> future}) async {
    final repository = await future;
    final ret = SuperformulaStorage(repository);
    return ret;
  }

  const SuperformulaStorage(this._repository);

  ///Saving  new seed
  Future<void> addToSeed(SeedModel seedModel) async {
    await _repository.createOrUpdateObject(seedModel.id, seedModel.toJson());
  }

  ///Saving  List of seeds
  void addListOfSeed(List<SeedModel> seedModel) async {
    await _repository
        .createOrUpdateBatchObject(seedModel.map((e) => e.toJson()).toList());
  }

  ///Getting seed list by query
  Future<List<SeedModel>> seedList(String query) async {
    final objects = query.isNotEmpty == true
        ? await _repository.findObjects(query)
        : await _repository.getUniqueObjects();
    return objects.map((map) => SeedModel.fromJson(map)).toList();
  }

  ///Deleting seed
  Future<void> removeSeed(SeedModel seedModel) async {
    await _repository.removeObject(seedModel.id);
  }
}
