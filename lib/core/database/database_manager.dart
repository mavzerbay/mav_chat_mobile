import 'package:mav_chat/core/database/app_database.dart';

class DatabaseManager {
  static AppDatabase? database;

  Future<AppDatabase> prepareDatabase() async {
    if (database != null) return database!;
    database = await $FloorAppDatabase.databaseBuilder('mav_chat.db').build();
    return database!;
  }
}
