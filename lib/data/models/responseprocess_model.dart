import 'dart:convert';

ResponseProcessModel responseProcessModelFromJson(String str) =>
    ResponseProcessModel.fromJson(json.decode(str));

String responseProcessModelToJson(ResponseProcessModel data) =>
    json.encode(data.toJson());

class ResponseProcessModel {
  ResponseProcessModel({
    required this.status,
    required this.response,
  });

  final bool status;
  final String response;

  factory ResponseProcessModel.fromJson(Map<String, dynamic> json) =>
      ResponseProcessModel(
        status: json["status"],
        response: json["response"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "response": response,
      };
}
