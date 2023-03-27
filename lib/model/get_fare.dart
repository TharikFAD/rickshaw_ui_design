///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class FareResponseResultData {
/*
{
  "id": 3,
  "fare_name": "fare 1",
  "currency_id": 1,
  "fraction_digit": 2,
  "base_fare": 40,
  "min_km": 1.7999999523162842,
  "cost_per_minute": 0.15000000596046448,
  "created_at": "2023-03-20 14:41:25",
  "updated_at": "2023-03-20 14:41:25"
}
*/

  int? id;
  String? fareName;
  int? currencyId;
  int? fractionDigit;
  int? baseFare;
  double? minKm;
  double? costPerMinute;
  String? createdAt;
  String? updatedAt;

  FareResponseResultData({
    this.id,
    this.fareName,
    this.currencyId,
    this.fractionDigit,
    this.baseFare,
    this.minKm,
    this.costPerMinute,
    this.createdAt,
    this.updatedAt,
  });
  FareResponseResultData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    fareName = json['fare_name']?.toString();
    currencyId = json['currency_id']?.toInt();
    fractionDigit = json['fraction_digit']?.toInt();
    baseFare = json['base_fare']?.toInt();
    minKm = json['min_km']?.toDouble();
    costPerMinute = json['cost_per_minute']?.toDouble();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['fare_name'] = fareName;
    data['currency_id'] = currencyId;
    data['fraction_digit'] = fractionDigit;
    data['base_fare'] = baseFare;
    data['min_km'] = minKm;
    data['cost_per_minute'] = costPerMinute;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class FareResponseResult {
/*
{
  "data": [
    {
      "id": 3,
      "fare_name": "fare 1",
      "currency_id": 1,
      "fraction_digit": 2,
      "base_fare": 40,
      "min_km": 1.7999999523162842,
      "cost_per_minute": 0.15000000596046448,
      "created_at": "2023-03-20 14:41:25",
      "updated_at": "2023-03-20 14:41:25"
    }
  ],
  "Messsage": ""
}
*/

  List<FareResponseResultData?>? data;
  String? Messsage;

  FareResponseResult({
    this.data,
    this.Messsage,
  });
  FareResponseResult.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <FareResponseResultData>[];
      v.forEach((v) {
        arr0.add(FareResponseResultData.fromJson(v));
      });
      this.data = arr0;
    }
    Messsage = json['Messsage']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['data'] = arr0;
    }
    data['Messsage'] = Messsage;
    return data;
  }
}

class FareResponse {
/*
{
  "result": {
    "data": [
      {
        "id": 3,
        "fare_name": "fare 1",
        "currency_id": 1,
        "fraction_digit": 2,
        "base_fare": 40,
        "min_km": 1.7999999523162842,
        "cost_per_minute": 0.15000000596046448,
        "created_at": "2023-03-20 14:41:25",
        "updated_at": "2023-03-20 14:41:25"
      }
    ],
    "Messsage": ""
  },
  "message": "Request Processed Succesfully",
  "status": "Success"
}
*/

  FareResponseResult? result;
  String? message;
  String? status;

  FareResponse({
    this.result,
    this.message,
    this.status,
  });
  FareResponse.fromJson(Map<String, dynamic> json) {
    result = (json['result'] != null) ? FareResponseResult.fromJson(json['result']) : null;
    message = json['message']?.toString();
    status = json['status']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}