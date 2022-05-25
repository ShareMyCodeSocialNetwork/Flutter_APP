class UserResponse{
  int id;
  String lastname;
  String firstname;
  String email;
  String pseudo;
  String profilePicture;

  UserResponse({
    required this.id,
    required this.lastname,
    required this.firstname,
    required this.email,
    required this.pseudo,
    required this.profilePicture
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