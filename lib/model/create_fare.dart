
class CreateFareRequestBodyFareInfo {
/*
{
  "fare_name": "fare 1",
  "currency_id": 1,
  "fraction_digit": 2,
  "measure_unit": "KM | MILES",
  "base_fare": 40,
  "min_km": 1.8,
  "cost_per_minute": 0.15,
  "cost_per_unit": 18,
  "additional_fare": 20
}
*/

  String? fareName;
  int? currencyId;
  int? fractionDigit;
  String? measureUnit;
  int? baseFare;
  double? minKm;
  double? costPerMinute;
  int? costPerUnit;
  int? additionalFare;

  CreateFareRequestBodyFareInfo({
    this.fareName,
    this.currencyId,
    this.fractionDigit,
    this.measureUnit,
    this.baseFare,
    this.minKm,
    this.costPerMinute,
    this.costPerUnit,
    this.additionalFare,
  });
  CreateFareRequestBodyFareInfo.fromJson(Map<String, dynamic> json) {
    fareName = json['fare_name']?.toString();
    currencyId = json['currency_id']?.toInt();
    fractionDigit = json['fraction_digit']?.toInt();
    measureUnit = json['measure_unit']?.toString();
    baseFare = json['base_fare']?.toInt();
    minKm = json['min_km']?.toDouble();
    costPerMinute = json['cost_per_minute']?.toDouble();
    costPerUnit = json['cost_per_unit']?.toInt();
    additionalFare = json['additional_fare']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['fare_name'] = fareName;
    data['currency_id'] = currencyId;
    data['fraction_digit'] = fractionDigit;
    data['measure_unit'] = measureUnit;
    data['base_fare'] = baseFare;
    data['min_km'] = minKm;
    data['cost_per_minute'] = costPerMinute;
    data['cost_per_unit'] = costPerUnit;
    data['additional_fare'] = additionalFare;
    return data;
  }
}

class CreateFareRequestBody {
/*
{
  "identification_key": "azep0099",
  "fare_info": {
    "fare_name": "fare 1",
    "currency_id": 1,
    "fraction_digit": 2,
    "measure_unit": "KM | MILES",
    "base_fare": 40,
    "min_km": 1.8,
    "cost_per_minute": 0.15,
    "cost_per_unit": 18,
    "additional_fare": 20
  }
}
*/

  String? identificationKey;
  CreateFareRequestBodyFareInfo? fareInfo;

  CreateFareRequestBody({
    this.identificationKey,
    this.fareInfo,
  });
  CreateFareRequestBody.fromJson(Map<String, dynamic> json) {
    identificationKey = json['identification_key']?.toString();
    fareInfo = (json['fare_info'] != null) ? CreateFareRequestBodyFareInfo.fromJson(json['fare_info']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['identification_key'] = identificationKey;
    if (fareInfo != null) {
      data['fare_info'] = fareInfo!.toJson();
    }
    return data;
  }
}


//------------------------------------------------------------------------------------------------

///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class CreateFareResponseResult {
/*
{
  "Messsage": "Fare Added Successfully"
}
*/

  String? Messsage;

  CreateFareResponseResult({
    this.Messsage,
  });
  CreateFareResponseResult.fromJson(Map<String, dynamic> json) {
    Messsage = json['Messsage']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Messsage'] = Messsage;
    return data;
  }
}

class CreateFareResponse {
/*
{
  "result": {
    "Messsage": "Fare Added Successfully"
  },
  "message": "Request Processed Succesfully",
  "status": "Success"
}
*/

  CreateFareResponseResult? result;
  String? message;
  String? status;

  CreateFareResponse({
    this.result,
    this.message,
    this.status,
  });
  CreateFareResponse.fromJson(Map<String, dynamic> json) {
    result = (json['result'] != null) ? CreateFareResponseResult.fromJson(json['result']) : null;
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