class MedicamentModel {
  final int? id;
  final int userId;
  final String nom; 
  final String dosage;
  final String forme;
  final int stockActuel;
  final int stockSeuil;

  MedicamentModel({
    this.id,
    required this.userId,
    required this.nom,
    required this.dosage,
    required this.forme,
    required this.stockActuel,
    required this.stockSeuil
  });

  //logique metier: verifier si le stock est critique
  bool isStockCritique(){
    return stockActuel <= stockSeuil;
  }

  //Convertir en Map pour SQLite
  Map<String, dynamic> toMap(){
    return {
      if (id != null) 'id': id,
      'user_id': userId,
      'nom': nom,
      'dosage': dosage,
      'forme': forme,
      'stock_actuel': stockActuel,
      'stock_seuil': stockSeuil
    };
  }

  //Creer depuis une ligne SQLite
  factory MedicamentModel.fromMap(Map<String, dynamic> map){
    return MedicamentModel(
      id: map['id'] as int?,
      userId: map['user_id'] as int,
      nom: map['nom'] as String, 
      dosage: map['dosage'] as String, 
      forme: map['forme'] as String, 
      stockActuel: map['stock_actuel'] as int, 
      stockSeuil: map['stock_seuil'] as int
    );
  }
}