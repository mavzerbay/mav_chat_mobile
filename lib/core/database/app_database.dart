import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../view/_product/models/user_dto.dart';
import 'dao/user_dao.dart';

part 'app_database.g.dart';

@Database(
  version: 1,
  entities: [UserDto],
)
abstract class AppDatabase extends FloorDatabase {
  //Dao getters
  UserDao get userDao;
}
