import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class Db{

  static Database? _db;

  Future<Database?> get db async{
    if(_db==null){
      _db=await initDb();
      return _db;
    }else{
      return _db;
    }
  }


  initDb()async{
    String dbpath=await getDatabasesPath();
    String path=join(dbpath,'mostafa.db');
    Database mydb=await openDatabase(path,onCreate: _onCreate,version: 1);
    print("Crrrrrreat***********************************");
    return mydb;
  
  }
  _onCreate(Database db,int version)async{
    await db.execute(''' 
    CREATE TABLE notes (
    id integer primary key autoincrement,
    note text not null
    )
    ''');
  }

  readData()async{
    Database? mydb=await db;
    List<Map> response=await mydb!.rawQuery("SELECT * FROM notes ");
    
    return response;
  }
  insertData(String note)async{
    Database? mydb=await db;
    int response=await mydb!.rawInsert("INSERT INTO notes (note) VALUES('$note')");
    print("AHHH ******************************");
    return response;
  }
  updateData(int id,String note)async{
    Database? mydb=await db;
    int response=await mydb!.rawUpdate("UPDATE notes SET note = '$note' WHERE id = '$id'");
    return response;
  }
  deleteData(int id)async{
    Database? mydb=await db;
    int response=await mydb!.rawDelete("DELETE FROM notes WHERE id = '$id' ");
    return response;
  }

}