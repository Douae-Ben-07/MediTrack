class TraitementModel {
    final int? id;
    final int medicamentId;
    final String heurePrise;
    final String frequence;

    TraitementModel({
        this.id,
        required this.medicamentId,
        required this.heurePrise,
        required this.frequence
    });

    //Convertir en Map pour SQLite
    Map<String, dynamic> toMap(){
        return {
            if(id != null) 'id': id,
            'medicament_id': medicamentId,
            'heure_prise': heurePrise,
            'frequence': frequence
        };
    }

    //Creer depuis une ligne SQLite
    factory TraitementModel.fromMap(Map<String, dynamic> map){
        return TraitementModel(
            id: map['id'] as int?,
            medicamentId: map['medicament_id'] as int, 
            heurePrise: map['heure_prise'] as String, 
            frequence: map['frequence'] as String
        );
    }
}