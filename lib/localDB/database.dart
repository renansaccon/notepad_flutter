import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

class PhraseData extends Table {
  TextColumn get phrase => text()();
  TextColumn get author => text()();
}

  @DriftDatabase(tables: [PhraseData])
  class AppDatabase extends _$AppDatabase {
    AppDatabase() : super (_openConnection());

    @override
    int get schemaVersion => 1;

    static QueryExecutor _openConnection() {
      return driftDatabase(name: 'phrasedatabase');
    }
  }