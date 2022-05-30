class UserResponse{
  int? id;
  String? lastname;
  String? firstname;
  String? email;
  String? pseudo;
  String? profilePicture;

  UserResponse({
     this.id,
     this.lastname,
     this.firstname,
     this.email,
     this.pseudo,
    this.profilePicture
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      id: json['id'],
      lastname: json['lastname'],
      firstname: json['firstname'],
      email: json['email'],
      pseudo: json['pseudo'],
      profilePicture: json['profilePicture'],
    );
  }
}