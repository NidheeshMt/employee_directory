import 'dart:io';

import 'package:employee_directory/model/employee_model.dart';
import "package:path/path.dart";
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Tables {
  Tables._();

  static const empTable = "tb_EmpInfo";
}

class DatabaseHelper {
  static final DatabaseHelper _instance =  DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  // create database
  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "UserData.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  // create tables
  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE IF NOT EXISTS  ${Tables.empTable}( )");
  }


  // Future<int> saveEmployees(List<EmployeeModel> employees) async {
  //   int res;
  //   Database? dbClient = await db;
  //
  //   final List<Map<String, dynamic>> maps = await dbClient?.rawQuery(
  //       "SELECT * FROM tb_UserInfo where  mobilenumber= " + user.mobilenumber,
  //       null)??[];
  //
  //   // res = await dbClient?.insert(
  //   //       "tb_UserInfo",
  //   //       user.toMap(),
  //   //       conflictAlgorithm: ConflictAlgorithm.replace,
  //   //     ) ??
  //   //     -1;
  //
  //   return res;
  // }

  // retrieve user from db

  // Future<List<UserInfo>> getAll() async {
  //   var dbClient = await db;
  //   final List<Map<String, dynamic>> maps =
  //       await dbClient?.rawQuery("SELECT * FROM tb_UserInfo") ?? [];
  //   return List.generate(maps.length, (i) {
  //     return UserInfo(
  //       //userid: maps[i]['userid'],
  //       userid: maps[i]['userid'],
  //       mobilenumber: maps[i]['mobilenumber'],
  //       location: maps[i]['location'],
  //       selectedTown: maps[i]['selected_town'],
  //
  //       state: maps[i]['selected_state'],
  //       district: maps[i]['selected_district'],
  //       apitoken: maps[i]['apitoken'],
  //       islogeddIn: maps[i]['islogeddIn'],
  //       userType: maps[i]['userType'],
  //     );
  //   });
  // }

  //delete use when logout
  Future<int> deleteUser() async {
    var dbClient = await db;
    int res = await dbClient?.delete("tb_UserInfo") ?? -1;
    return res;
  }





  Future<UserDTO> getLoginUser() async {
    var dbClient = await db;
    List<Map<String, dynamic>> maps =
        await dbClient?.rawQuery("SELECT * FROM ${Tables.empTable}")??[];
    return maps
        .map((user) => UserDTO(
              userId: user["user_id"],
              mobileNumber: user['mobilenumber'],
              location: user['location'],
              selectedTown: user["selected_town"],
              selectedState: user["selected_state"],
              selectedDistrict: user["selected_district"],
              apiToken: user['apitoken'],
              userType: user['userType'],
            ))
        .first;
  }
}

class UserDTO {
  final String? _mobileNumber;
  final String? _location;
  final String? _selectedTown;
  final String? _selectedState;
  final String? _selectedDistrict;
  final String? _apiToken;
  final int? _userId;
  final String? _userType;

  UserDTO({
    int? userId,
    String? mobileNumber,
    String? location,
    String? selectedTown,
    String? selectedState,
    String? selectedDistrict,
    String? apiToken,
    bool? islogeddIn,
    String? userType,
  })  : this._mobileNumber = mobileNumber,
        this._location = location,
        this._selectedTown = selectedTown,
        this._selectedState = selectedState,
        this._selectedDistrict = selectedDistrict,
        this._apiToken = apiToken,
        this._userId = userId,
        this._userType = userType;
}

class UserDAO {
  final Database db;

  UserDAO(this.db);

  Future<void> createTable() async {
    return db.execute("CREATE TABLE IF NOT EXISTS  ${Tables.empTable}"
        "(mobilenumber TEXT PRIMARY KEY,"
        "location TEXT,"
        "selected_town TEXT,"
        "selected_state TEXT,"
        "selected_district TEXT,"
        "user_id INTEGER,"
        "apitoken TEXT,"
        "islogeddIn bool,"
        "userType TEXT )");
  }

  // Map<String, dynamic> insertUser(UserInfo user) {
  //   return {
  //     'userid': user.userid,
  //     'mobilenumber': user.mobilenumber,
  //     'location': user.location,
  //     'apitoken': user.apitoken,
  //     'islogeddIn': user.islogeddIn,
  //     "selected_town": user.location,
  //     "selected_state": user.state,
  //     "selected_district": user.district,
  //     "userType": user.userType
  //   };
  // }

  Future<UserDTO> getLoginUser() async {
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM ${Tables.empTable}");
    return maps
        .map((user) => UserDTO(
              mobileNumber: user['mobilenumber'],
              location: user['location'],
              apiToken: user['apitoken'],
            ))
        .first;
  }
}
