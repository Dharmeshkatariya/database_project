// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
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

  PersonDao? _personDaoInstance;

  ProductDao? _productDaoInstance;

  CardDao? _cardDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 3,
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
            'CREATE TABLE IF NOT EXISTS `Person` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Product` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `desc` TEXT NOT NULL, `price` REAL NOT NULL, `qty` INTEGER NOT NULL, `discount` REAL NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `CardItem` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `desc` TEXT NOT NULL, `price` REAL NOT NULL, `qty` INTEGER NOT NULL, `discount` REAL NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PersonDao get personDao {
    return _personDaoInstance ??= _$PersonDao(database, changeListener);
  }

  @override
  ProductDao get productDao {
    return _productDaoInstance ??= _$ProductDao(database, changeListener);
  }

  @override
  CardDao get cardDao {
    return _cardDaoInstance ??= _$CardDao(database, changeListener);
  }
}

class _$PersonDao extends PersonDao {
  _$PersonDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _personInsertionAdapter = InsertionAdapter(
            database,
            'Person',
            (Person item) =>
                <String, Object?>{'id': item.id, 'name': item.name},
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Person> _personInsertionAdapter;

  @override
  Future<List<Person>> findAllPersons() async {
    return _queryAdapter.queryList('SELECT * FROM Person',
        mapper: (Map<String, Object?> row) =>
            Person(row['id'] as int, row['name'] as String));
  }

  @override
  Stream<Person?> findPersonById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Person WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            Person(row['id'] as int, row['name'] as String),
        arguments: [id],
        queryableName: 'Person',
        isView: false);
  }

  @override
  Future<void> insertPerson(Person person) async {
    await _personInsertionAdapter.insert(person, OnConflictStrategy.abort);
  }
}

class _$ProductDao extends ProductDao {
  _$ProductDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _productInsertionAdapter = InsertionAdapter(
            database,
            'Product',
            (Product item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'desc': item.desc,
                  'price': item.price,
                  'qty': item.qty,
                  'discount': item.discount
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Product> _productInsertionAdapter;

  @override
  Future<List<Product>> findAllProducts() async {
    return _queryAdapter.queryList('SELECT * FROM Product',
        mapper: (Map<String, Object?> row) => Product(
            row['id'] as int,
            row['name'] as String,
            row['desc'] as String,
            row['price'] as double,
            row['qty'] as int,
            row['discount'] as double));
  }

  @override
  Stream<Product?> findProductById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Product WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Product(
            row['id'] as int,
            row['name'] as String,
            row['desc'] as String,
            row['price'] as double,
            row['qty'] as int,
            row['discount'] as double),
        arguments: [id],
        queryableName: 'Product',
        isView: false);
  }

  @override
  Future<Product?> updateProductById(
    int id,
    String name,
    String desc,
    double price,
    int qty,
    double discount,
  ) async {
    return _queryAdapter.query(
        'Update Product SET name = ?2, desc = ?3, price = ?4, qty = ?5, discount = ?6 WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Product(row['id'] as int, row['name'] as String, row['desc'] as String, row['price'] as double, row['qty'] as int, row['discount'] as double),
        arguments: [id, name, desc, price, qty, discount]);
  }

  @override
  Future<void> insertProduct(Product product) async {
    await _productInsertionAdapter.insert(product, OnConflictStrategy.abort);
  }
}

class _$CardDao extends CardDao {
  _$CardDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _cardItemInsertionAdapter = InsertionAdapter(
            database,
            'CardItem',
            (CardItem item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'desc': item.desc,
                  'price': item.price,
                  'qty': item.qty,
                  'discount': item.discount
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CardItem> _cardItemInsertionAdapter;

  @override
  Future<List<CardItem>> findAllCards() async {
    return _queryAdapter.queryList('SELECT * FROM CardItem',
        mapper: (Map<String, Object?> row) => CardItem(
            row['id'] as int,
            row['name'] as String,
            row['desc'] as String,
            row['price'] as double,
            row['qty'] as int,
            row['discount'] as double));
  }

  @override
  Stream<CardItem?> findCardById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM CardItem WHERE id = ?1',
        mapper: (Map<String, Object?> row) => CardItem(
            row['id'] as int,
            row['name'] as String,
            row['desc'] as String,
            row['price'] as double,
            row['qty'] as int,
            row['discount'] as double),
        arguments: [id],
        queryableName: 'CardItem',
        isView: false);
  }

  @override
  Future<CardItem?> updateCardById(
    int id,
    String name,
    String desc,
    double price,
    int qty,
    double discount,
  ) async {
    return _queryAdapter.query(
        'Update CardItem SET name = ?2, desc = ?3, price = ?4, qty = ?5, discount = ?6 WHERE id = ?1',
        mapper: (Map<String, Object?> row) => CardItem(row['id'] as int, row['name'] as String, row['desc'] as String, row['price'] as double, row['qty'] as int, row['discount'] as double),
        arguments: [id, name, desc, price, qty, discount]);
  }

  @override
  Future<void> insertCard(CardItem cardItem) async {
    await _cardItemInsertionAdapter.insert(cardItem, OnConflictStrategy.abort);
  }
}
