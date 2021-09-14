import 'package:mav_chat/core/database/dao/user_dao.dart';
import 'package:mav_chat/view/_product/models/user_dto.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(
  version: 1,
  entities: [UserDto],
)
abstract class AppDatabase extends FloorDatabase {
  //Dao getters
  UserDao get userDao;
}
