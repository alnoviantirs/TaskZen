//DIGUNAKAN UNTUK GET ALL DATA
class SignupModel {
  final String FullName;
  final String Phonenumber;
  final String Email;
  final String Password;

  SignupModel({
    required this.FullName,
    required this.Phonenumber,
    required this.Email,
    required this.Password,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        FullName: json["FullName"],
        Phonenumber: json["Phonenumber"],
        Email: json["Email"],
        Password: json["Password"],
      );

  Map<String, dynamic> toJson() => {
        "FullName": FullName,
        "Phonenumber": Phonenumber,
        "Email": Email,
        "Password": Password,
      };
}

//DIGUNAKAN UNTUK FORM INPUT
class SignupInput {
  final String FullName;
  final String Phonenumber;
  final String Email;
  final String Password;

  SignupInput({
    required this.FullName,
    required this.Phonenumber,
    required this.Email,
    required this.Password,
  });

  Map<String, dynamic> toJson() => {
        "FullName": FullName,
        "Phonenumber": Phonenumber,
        "Email": Email,
        "Password": Password,
      };
}

//DIGUNAKAN UNTUK RESPONSE
class SignupResponse {
  final String? insertedId;
  final String message;
  final int status;

  SignupResponse({
    this.insertedId,
    required this.message,
    required this.status,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) => SignupResponse(
        insertedId: json["inserted_id"],
        message: json["message"],
        status: json["status"],
      );
}
