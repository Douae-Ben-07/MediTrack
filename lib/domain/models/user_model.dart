class UserModel {
  final int? id;
  final String username;
  final String password;
  final String nomComplet;

  UserModel({
    this.id,
    required this.username,
    required this.password,
    required this.nomComplet
  });
  
  //convertir un objet UserModel en Map pour SQlite
  Map<String, dynamic> toMap() {
    return {
      if(id != null) 'id': id,
      'username': username,
      'password':password,
      'nom_complet': nomComplet
    };
  }

  //creer un objet UserModel depuis une ligne SQLite
  factory UserModel.fromMap(Map<String, dynamic> map){
    return UserModel(
      id: map['id'] as int?,
      username: map['username'] as String, 
      password: map['password'] as String,
      nomComplet: map['nom_complet'] as String
    );
  }
}