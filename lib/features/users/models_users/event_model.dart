class UserModel {
   int? id;
   String? nomComplet;
   int? telephone;
   String? adresse;
   String? statut;
   String? image;
   String? email;
   String? emailVerifiedAt;
   String? password;
   int? roleId;
   bool? rememberToken;
   String? createdAt;
   String? updatedAt;
   List<Pack>? pack;
   Role? role;

   UserModel({
     this.id,
     this.nomComplet,
     this.telephone,
     this.adresse,
     this.statut,
     this.image,
     this.email,
     this.emailVerifiedAt,
     this.password,
     this.roleId,
     this.rememberToken,
     this.createdAt,
     this.updatedAt,
     this.pack,
     this.role,
  });
  
  UserModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    nomComplet = json['nom_complet'];
    telephone = json['telephone'];
    adresse = json['adresse'];
    statut = json['statut'];
    image = json['image'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    roleId = json['role_id'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pack = List.from(json['pack']).map((e)=>Pack.fromJson(e)).toList();
    role = Role.fromJson(json['role']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nom_complet'] = nomComplet;
    _data['telephone'] = telephone;
    _data['adresse'] = adresse;
    _data['statut'] = statut;
    _data['image'] = image;
    _data['email'] = email;
    _data['email_verified_at'] = emailVerifiedAt;
    _data['password'] = password;
    _data['role_id'] = roleId;
    _data['remember_token'] = rememberToken;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['pack'] = pack?.map((e)=>e.toJson()).toList();
    _data['role'] = role?.toJson();
    return _data;
  }
}

class Pack {
  
   int? id;
   String? dateExpire;
   String? libelle;
   String? montant;
   int? nbreEvents;
   int? nbreJrPubs;
   int? typePackId;
   int? userId;
   String? createdAt;
   String? updatedAt;


   Pack({
     this.id,
     this.dateExpire,
     this.libelle,
     this.montant,
     this.nbreEvents,
     this.nbreJrPubs,
     this.typePackId,
     this.userId,
     this.createdAt,
     this.updatedAt,
  });
  
  Pack.fromJson(Map<String, dynamic> json){
    id = json['id'];
    dateExpire = json['date_expire'];
    libelle = json['libelle'];
    montant = json['montant'];
    nbreEvents = json['nbre_events'];
    nbreJrPubs = json['nbre_jr_pubs'];
    typePackId = json['type_pack_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['date_expire'] = dateExpire;
    _data['libelle'] = libelle;
    _data['montant'] = montant;
    _data['nbre_events'] = nbreEvents;
    _data['nbre_jr_pubs'] = nbreJrPubs;
    _data['type_pack_id'] = typePackId;
    _data['user_id'] = userId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Role {
 
   int? id;
   String? libelle;
   String? description;
   String? createdAt;
   String? updatedAt;

    Role({
     this.id,
     this.libelle,
     this.description,
     this.createdAt,
     this.updatedAt,
  });
  
  Role.fromJson(Map<String, dynamic> json){
    id = json['id'];
    libelle = json['libelle'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['libelle'] = libelle;
    _data['description'] = description;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}