import 'dart:convert';
/// userId : 1
/// id : 1
/// title : "sunt aut facere repellat provident occaecati excepturi optio reprehenderit"
/// body : "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"

Model1 model1FromJson(String str) => Model1.fromJson(json.decode(str));
String model1ToJson(Model1 data) => json.encode(data.toJson());
class Model1 {
  Model1({
      num? userId, 
      num? id, 
      String? title, 
      String? body,}){
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
}

  Model1.fromJson(dynamic json) {
    _userId = json['userId'];
    _id = json['id'];
    _title = json['title'];
    _body = json['body'];
  }
  num? _userId;
  num? _id;
  String? _title;
  String? _body;
Model1 copyWith({  num? userId,
  num? id,
  String? title,
  String? body,
}) => Model1(  userId: userId ?? _userId,
  id: id ?? _id,
  title: title ?? _title,
  body: body ?? _body,
);
  num? get userId => _userId;
  num? get id => _id;
  String? get title => _title;
  String? get body => _body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['id'] = _id;
    map['title'] = _title;
    map['body'] = _body;
    return map;
  }

}