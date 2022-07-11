class Sucess{
  bool? isSucess;
  String? message;
  Sucess({this.isSucess, this.message});
  Sucess.fromJson(Map<String, dynamic> json){
    isSucess = json['Sucess'];
    message = json['Message'];
  }
}