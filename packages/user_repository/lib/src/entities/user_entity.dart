class MyUserEntity {
  String userId;
  String email; 
  String name;
  bool hasActiveCart;

  MyUserEntity({
    required this.userId,
    required this.email,
    required this.name,
    required this.hasActiveCart
  });

  Map<String, Object?>  toDocument(){
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'hasActiveCart': hasActiveCart,
    };
  }
  static MyUserEntity fromDocument(Map<String, dynamic> doc){
    return MyUserEntity(userId: doc['userId'].toString(), email: doc['email'].toString(), name: doc['name'].toString(), hasActiveCart: bool.parse(doc['hasActiveCart'].toString()));
  }
}