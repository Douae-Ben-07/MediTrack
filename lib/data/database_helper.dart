import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

//get database
  Future<Database> get database async{
    if(_database != null) return _database!;
    _database = await _initDB('meditrack.db');
    return _database!;
  }

//initialiser database
  Future<Database> _initDB(String filePath) async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB
    );
  }

//creation tables
  Future<void> _createDB(Database db, int version) async{
    //Table utilisateurs (authentificaton)
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL,
        nom_complet TEXT
      )
    ''');

    //table des medicaments
    await db.execute('''
      CREATE TABLE medicaments(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER,
        nom TEXT NOT NULL,
        dosage TEXT NOT NULL,
        forme TEXT NOT NULL,
        stock_actuel INTEGER NOT NULL,
        stock_seuil INTEGER NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
      )
    ''');

    //table des traitements programmés
    await db.execute('''
      CREATE TABLE traitements(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        medicament_id INTEGER NOT NULL,
        heure_prise TEXT NOT NULL,
        frequence TEXT NOT NULL,
        FOREIGN KEY (medicament_id) REFERENCES medicaments (id) ON DELETE CASCADE
      )
    ''');

    //table d'historique des prises (observance)
    await db.execute('''
      CREATE TABLE prises_log(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        traitement_id INTEGER NOT NULL,
        date_heure TEXT NOT NULL,
        statut TEXT NOT NULL,
        FOREIGN KEY (traitement_id) REFERENCES traitements (id) ON DELETE CASCADE
      )
    ''');
  }

  //  AUTHENTIFICATION
  //inscription(register)
  Future<int> registerUser(String username, String password, {String? nomComplet}) async{
    final db = await instance.database;
    return await db.insert('users', {
      'username': username,
      'password': password, //hashage simple
      'nom_complet': nomComplet ?? username
    });
  }

  //connexion (Login)
  Future<Map<String, Object?>?> loginUser( String username, String password) async {
    final db = await instance.database;
    final res = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password]
    );
    if(res.isNotEmpty){
      return res.first;
    }
    return null;
  }

  //Medicament & stocks
  Future<int> insertMedicament(Map<String, dynamic> row) async{
    final db = await instance.database;
    return await db.insert('medicaments', row);
  }

  Future<List<Map<String, Object?>>> getMedicamentsByUser(int userId) async {
  final db = await instance.database;

  return await db.query(
    'medicaments',
    where: 'user_id = ?',
    whereArgs: [userId],
  );
}

  //decrementer le stock -1 lors de la validation d'une prise
  Future<int> decrementStock(int medicamentId) async{
    final db = await instance.database;
    return await db.rawUpdate('''
      UPDATE medicaments
      SET stock_actuel = stock_actuel - 1
      WHERE id = ? AND stock_actuel > 0
    ''', [medicamentId]);
  }

  //Enregistrer une prise validee
  Future<int> insertPriseLog(int traitementId, String statut)async{
    final db = await instance.database;
    return await db.insert('prises_log', {
      'traitement_id': traitementId,
      'date_heure': DateTime.now().toIso8601String(),
      'statut': statut
    });
  }

  Future<void> close() async{
    final db = await instance.database;
    db.close();
  }
}