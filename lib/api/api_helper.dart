const String uatServerBaseUrl = 'http://dev-bee.com:8008/';
const String liveServerBaseUrl = 'http://43.206.124.140/';
const String localServerBaseUrl='http://192.168.0.147/';

const String versionName = '1.1.0'; //TODO: NEED TO CHANGE BEFORE BUILD

class ApiBaseUrl {
  static String baseUrl = //TODO: NEED TO CHANGE BEFORE BUILD
  uatServerBaseUrl; //UAT
//liveServerBaseUrl; //LIVE
//localServerBaseUrl;

}

class BuildVersion {
  static String versionNameSuffix =
  ApiBaseUrl.baseUrl == liveServerBaseUrl ? 'L' : 'U';
  static String buildName = 'V $versionName $versionNameSuffix';
}

class ApiEndPoint {
  static String sendOtp='api/v1/auth/send_otp';
  static String validateOtp='api/v1/auth/validate_otp';

  static String createFare='api/v1/fare/create-fare';
  static String getFare='api/v1/fare/get-fare-by-id';

  static String updateProfile='api/v1/user/update-user-details';

  static String createComplaint='api/v1/complaint/add-complaint';
  static String getComplaint='api/v1/complaint/get-complaint';

  static String getTriphistory='api/v1/trip/trip-history';
  static String tripComplete='api/v1/trip/trip-complete';
  static String updateFare='api/v1/fare/update-fare';

}

