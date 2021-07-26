import 'dart:io';
import 'package:dukka_samasys/core/model/employee_data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Database db;

class DatabaseHelper {
  static const employeeTable = 'employee';
  static const fullName = 'full_name';
  static const phoneNumber = 'phone_number';
  static const email = 'email';
  static const id = 'id';
  static const position = 'position';
  static const salary = 'salary';

  static Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    if (await Directory(dirname(path)).exists()) {
      //await deleteDatabase(path);
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }

  static Future<void> initDatabase() async {
    final path = await getDatabasePath('samasys_db');
    db = await openDatabase(path,
        version: 2, onCreate: onCreate, onUpgrade: onUpgrade);
  }

  static Future<void> onCreate(Database db, int version) async {
    print('function to create tables ');
    await createTables(db);
  }

  static onUpgrade(Database db, int oldVersion, int newVersion) {
    if (oldVersion < newVersion) {
      db.execute("ALTER TABLE foldersTable ADD COLUMN date TEXT;");
    }
  }

  static Future<void> createTables(Database db) async {
    final messagesTable = '''CREATE TABLE $employeeTable(
      $id INTEGER PRIMARY KEY,
   $fullName TEXT,
   $phoneNumber TEXT,
   $email      TEXT,
   $position   TEXT,
   $salary      TEXT

    )''';

    await db.execute(messagesTable);
  }

  static Future<int> insertEmployee(EmployeeData employeeData) async {
    int messageId = await db.insert(
      employeeTable,
      employeeData.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print('EmployeeMessage inserted to the database $messageId');
    return messageId;
  }

  Future<List<EmployeeData>> getEmployeeList() async {
    var result = await db.query(employeeTable, orderBy: '$id ASC');

    if (result.length > 0) {
      List<EmployeeData> chatMessages = [];

      if (result.length > 0) {
        for (int i = 0; i < result.length; i++) {
          chatMessages.add(EmployeeData.fromJson(result[i]));
        }
      }
      return chatMessages;
      //return ChatMessage.fromMap(maps.first);
    }
    return null;
  }



  Future<int> updateEmployee(EmployeeData employeeData) async {
    var result = await db.update(employeeTable, employeeData.toJson(),
        where: '$phoneNumber= ?', whereArgs: [employeeData.phoneNumber]);
    return result;
  }

  //Delete Operation: Delete an Employee object from database
  Future<int> deleteEmployee(int employeeId) async {
    int result =
        await db.rawDelete('DELETE FROM $employeeTable WHERE $id  = $employeeId');
    return result;
  }
}
