import 'package:json_annotation/json_annotation.dart';
part 'request_model.g.dart';

@JsonSerializable()
class RequestModel {

  String id;
  String question;
  String answer;

  RequestModel({required this.id, required this.question, required this.answer});

/*String copyright;
  String date;
  String explanation;
  String hdurl;
  String media_type;
  String service_version;
  String title;
  String url;


  RequestModel(
      {required this.copyright,
      required this.date,
      required this.explanation,
      required this.hdurl,
      required this.media_type,
      required this.service_version,
      required this.title,
      required this.url});

*/
  factory RequestModel.fromJson(Map<String, dynamic> json) => _$RequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$RequestModelToJson(this);
}
