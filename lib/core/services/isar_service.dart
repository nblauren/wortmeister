import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wortmeister/data/models/deck.dart';
import 'package:wortmeister/data/models/srs.dart';
import 'package:wortmeister/data/models/word.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = _initDb();
  }

  Future<Isar> _initDb() async {
    final dir = await getApplicationDocumentsDirectory();
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return await Isar.open(
      [
        WordSchema,
        DeckSchema,
        SrsSchema,
      ],
      directory: dir.path,
    );
  }

  Future<void> addItem<T>(T item) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.collection<T>().putSync(item));
  }

  Future<List<T>> getItems<T>() async {
    final isar = await db;
    return await isar.collection<T>().where().findAll();
  }

  Stream<List<T>> watchCollection<T>() {
    return db.asStream().asyncExpand((isar) {
      return isar.collection<T>().where().watch(fireImmediately: true);
    });
  }

  Future<void> deleteItem<T>(int id) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.collection<T>().deleteSync(id));
  }

  Future<void> clearAllData() async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.words.clear();
      await isar.decks.clear();
      await isar.srs.clear();
    });
  }
}
