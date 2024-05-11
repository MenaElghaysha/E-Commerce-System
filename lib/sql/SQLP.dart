import 'package:e_commerce/sql/sqlModels/sql_productsModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String tableProducts = 'tableProducts';
const String columnId = 'id';
const String columnTitle = 'title';
const String columnImage = 'image';
const String columnPrice = 'price';
const String columnCategory = 'category';

class ProductsData {
  late Database db;
  static final ProductsData instance = ProductsData._internal();
  factory ProductsData() {
    return instance;
  }
  ProductsData._internal();

  Future open() async {
    db = await openDatabase(join(await getDatabasesPath(), 'ndb.db'),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableProducts ( 
  $columnId integer not null, 
  $columnTitle text not null,
  $columnImage text not null,
  $columnCategory text not null,
  $columnPrice real not null)
''');
    });
  }

  Future<List<SQLProduct>> getAllProducts() async {
    List<Map<String, dynamic>> Productsmap = await db.query(tableProducts);
    if (Productsmap.isEmpty) {
      return [];
    } else {
      List<SQLProduct> allProducts = [];
      for (var element in Productsmap) {
        allProducts.add(SQLProduct.fromData(element));
      }
      return allProducts;
    }
  }

  Future<SQLProduct> insert(SQLProduct sqlproduct) async {
    sqlproduct.id = await db.insert(tableProducts, sqlproduct.toData());
    return sqlproduct;
  }

  Future<int> delete(int id) async {
    return await db
        .delete(tableProducts, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(SQLProduct sqlproduct) async {
    return await db.update(tableProducts, sqlproduct.toData(),
        where: '$columnId = ?', whereArgs: [sqlproduct.id]);
  }

  Future close() async => db.close();
}

class FavProducts {
  late Database bd;
  static final FavProducts instance = FavProducts._internal();
  factory FavProducts() {
    return instance;
  }
  FavProducts._internal();

  Future open() async {
    bd = await openDatabase(join(await getDatabasesPath(), 'favb.db'),
        version: 1, onCreate: (Database bd, int version) async {
      await bd.execute('''
create table $tableProducts ( 
  $columnId integer not null, 
  $columnTitle text not null,
  $columnImage text not null,
  $columnCategory text not null,
  $columnPrice real not null)
''');
    });
  }

  Future<List<SQLProduct>> getAllProducts() async {
    List<Map<String, dynamic>> Productsmap = await bd.query(tableProducts);
    if (Productsmap.isEmpty) {
      return [];
    } else {
      List<SQLProduct> allProducts = [];
      for (var element in Productsmap) {
        allProducts.add(SQLProduct.fromData(element));
      }
      return allProducts;
    }
  }

  Future<SQLProduct> insert(SQLProduct sqlproduct) async {
    sqlproduct.id = await bd.insert(tableProducts, sqlproduct.toData());
    return sqlproduct;
  }

  Future<int> delete(int id) async {
    return await bd
        .delete(tableProducts, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(SQLProduct sqlproduct) async {
    return await bd.update(tableProducts, sqlproduct.toData(),
        where: '$columnId = ?', whereArgs: [sqlproduct.id]);
  }

  Future close() async => bd.close();
}
// class DatabaseHelper {
//   static const _databaseName = 'cart_database.db';
//   static const _databaseVersion = 1;

//   DatabaseHelper._privateConstructor();
//   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

//   static Database? _database;

//   Future<Database> get database async {
//     if (_database != null) return _database!;

//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     String path = join(await getDatabasesPath(), _databaseName);
//     return await openDatabase(
//       path,
//       version: _databaseVersion,
//       onCreate: _onCreate,
//     );
//   }

//   Future<void> _onCreate(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE cart_items (
//         id INTEGER PRIMARY KEY,
//         product_id INTEGER,
//         quantity INTEGER
//       )
//     ''');
//   }
// }
