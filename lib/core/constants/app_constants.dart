class AppConstants {
  AppConstants._();

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Network
  static const int connectTimeoutSeconds = 30;
  static const int receiveTimeoutSeconds = 30;

  // Validation
  static const int minPasswordLength = 8;

  // Date formats
  static const String apiDateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
}
