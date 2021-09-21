// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao? _userDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `users` (`userName` TEXT, `token` TEXT, `profilePhoto` TEXT, `name` TEXT, `surname` TEXT, `nameSurname` TEXT, `phoneNumber` TEXT, `lastActive` TEXT, PRIMARY KEY (`userName`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _userDtoInsertionAdapter = InsertionAdapter(
            database,
            'users',
            (UserDto item) => <String, Object?>{
                  'userName': item.userName,
                  'token': item.token,
                  'profilePhoto': item.profilePhoto,
                  'name': item.name,
                  'surname': item.surname,
                  'nameSurname': item.nameSurname,
                  'phoneNumber': item.phoneNumber,
                  'lastActive': item.lastActive
                },
            changeListener),
        _userDtoUpdateAdapter = UpdateAdapter(
            database,
            'users',
            ['userName'],
            (UserDto item) => <String, Object?>{
                  'userName': item.userName,
                  'token': item.token,
                  'profilePhoto': item.profilePhoto,
                  'name': item.name,
                  'surname': item.surname,
                  'nameSurname': item.nameSurname,
                  'phoneNumber': item.phoneNumber,
                  'lastActive': item.lastActive
                },
            changeListener),
        _userDtoDeletionAdapter = DeletionAdapter(
            database,
            'users',
            ['userName'],
            (UserDto item) => <String, Object?>{
                  'userName': item.userName,
                  'token': item.token,
                  'profilePhoto': item.profilePhoto,
                  'name': item.name,
                  'surname': item.surname,
                  'nameSurname': item.nameSurname,
                  'phoneNumber': item.phoneNumber,
                  'lastActive': item.lastActive
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserDto> _userDtoInsertionAdapter;

  final UpdateAdapter<UserDto> _userDtoUpdateAdapter;

  final DeletionAdapter<UserDto> _userDtoDeletionAdapter;

  @override
  Future<UserDto?> findCurrent() async {
    return _queryAdapter.query('SELECT * FROM users LIMIT 1',
        mapper: (Map<String, Object?> row) => UserDto(
            userName: row['userName'] as String?,
            token: row['token'] as String?,
            profilePhoto: row['profilePhoto'] as String?,
            name: row['name'] as String?,
            surname: row['surname'] as String?,
            nameSurname: row['nameSurname'] as String?,
            phoneNumber: row['phoneNumber'] as String?,
            lastActive: row['lastActive'] as String?));
  }

  @override
  Stream<UserDto?> findCurrentAsStream() {
    return _queryAdapter.queryStream('SELECT * FROM users LIMIT 1',
        mapper: (Map<String, Object?> row) => UserDto(
            userName: row['userName'] as String?,
            token: row['token'] as String?,
            profilePhoto: row['profilePhoto'] as String?,
            name: row['name'] as String?,
            surname: row['surname'] as String?,
            nameSurname: row['nameSurname'] as String?,
            phoneNumber: row['phoneNumber'] as String?,
            lastActive: row['lastActive'] as String?),
        queryableName: 'users',
        isView: false);
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM users');
  }

  @override
  Future<void> insertItem(UserDto item) async {
    await _userDtoInsertionAdapter.insert(item, OnConflictStrategy.replace);
  }

  @override
  Future<List<int>> insertItems(List<UserDto> items) {
    return _userDtoInsertionAdapter.insertListAndReturnIds(
        items, OnConflictStrategy.replace);
  }

  @override
  Future<int> updateItem(UserDto item) {
    return _userDtoUpdateAdapter.updateAndReturnChangedRows(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateItems(List<UserDto> items) {
    return _userDtoUpdateAdapter.updateListAndReturnChangedRows(
        items, OnConflictStrategy.replace);
  }

  @override
  Future<int> deleteItem(UserDto item) {
    return _userDtoDeletionAdapter.deleteAndReturnChangedRows(item);
  }

  @override
  Future<int> deleteItems(List<UserDto> items) {
    return _userDtoDeletionAdapter.deleteListAndReturnChangedRows(items);
  }
}
