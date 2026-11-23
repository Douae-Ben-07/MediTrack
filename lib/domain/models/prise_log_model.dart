class PriseLogModel {
  final int? id;
  final int traitementId;
  final String dateHeure;
  final String statut;  // pris, manque, en attente
  final int tempsRetardMax;  // en minutes avant declenchement SOS

  PriseLogModel({
    this.id,
    required this.traitementId,
    required this.dateHeure,
    required this.statut,
    this.tempsRetardMax=30
  });

  //Convertir en Map pour SQLite
  Map<String, dynamic> toMap(){
    return {
      if(id != null) 'id': id,
      'traitement_id': traitementId,
      'date_heure': dateHeure,
      'statut': statut,
      'temps_retard_max': tempsRetardMax
    };
  }

  //Creer depuis une ligne SQLite
  factory PriseLogModel.fromMap(Map<String, dynamic> map){
    return PriseLogModel(
      id: map['id'] as int?,
      traitementId: map['traitement_id'] as int, 
      dateHeure: map['date_heure'] as String, 
      statut: map['statut'] as String,
      tempsRetardMax: (map['temps_retard_max'] as int?) ?? 30
      );
  }
}