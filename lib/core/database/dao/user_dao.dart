import 'package:floor/floor.dart';

import '../../../view/_product/models/user_dto.dart';
import 'abstract_dao.dart';

@dao
abstract class UserDao extends AbstractDao<UserDto> {
  @Query('SELECT * FROM users LIMIT 1')
  Future<UserDto?> findCurrent();

  @Query('SELECT * FROM users LIMIT 1')
  Stream<UserDto?> findCurrentAsStream();

  @Query('DELETE FROM users')
  Future<void> deleteAll();
}
