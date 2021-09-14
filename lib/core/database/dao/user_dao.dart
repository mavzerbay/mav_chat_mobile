import 'package:floor/floor.dart';
import 'package:mav_chat/core/database/dao/abstract_dao.dart';
import 'package:mav_chat/view/_product/models/user_dto.dart';

@dao
abstract class UserDao extends AbstractDao<UserDto> {
  @Query('SELECT * FROM users LIMIT 1')
  Future<UserDto> findCurrent();

  @Query('SELECT * FROM users LIMIT 1')
  Stream<UserDto> findCurrentAsStream();

  @Query('DELETE FROM users')
  Future<void> deleteAll();
}
