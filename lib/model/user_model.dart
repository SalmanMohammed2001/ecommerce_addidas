class UserModel {
  String name;
  String image;
  String email;
  String uid;
  List<String> favId;


  UserModel(
      {required this.name,
      required this.image,
      required this.email,
      required this.uid,
        required this.favId
      });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(

        name: json["name"],
        image: json["image"],
        email: json["email"],
        uid: json["uid"],
        favId: json["favorite"] ==null ? [] : List<String>.from(json["favorite"])
    );
  }

  Map<String,dynamic> toJson(){
    return {
      "name":name,
      "email":email,
      "image":image,
      "uid":uid
    };
  }
}
