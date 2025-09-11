class ApiEndpoints {
  static const String baseUrl = 'https://techmed-api.vercel.app/api/v1';

  static const String login = '$baseUrl/auth/login';

  static const String register = '$baseUrl/auth/register';

  static const String vaccinations = '$baseUrl/vaccination';

  static String getSingleVaccinationEndPoint(int id) =>
      "$baseUrl/vaccination/$id";

  static String deleteVaccinationEndPoint(int id) => "$baseUrl/vaccination/$id";
}
