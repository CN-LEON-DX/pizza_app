import 'package:user_repository/src/entities/user_entity.dart';

class MyUser {
  String userId;
  String email; 
  String name;
  bool hasActiveCart;

  MyUser({
    required this.userId,
    required this.email,
    required this.name,
    required this.hasActiveCart
  });

// Note: Notifies about change to the user's sign-in state
  static final empty = MyUser(userId: '', email: '', name: '', hasActiveCart: false);

  MyUserEntity toEntity(){
    return MyUserEntity(
      userId: userId, email: email, name: name, hasActiveCart: hasActiveCart
    );
  }

  static MyUser fromEntity(MyUserEntity entity){
    return MyUser(
      userId: entity.userId, email: entity.email, name: entity.name, hasActiveCart: entity.hasActiveCart
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'MyUser: $userId, $email, $name, $hasActiveCart';
  }
}