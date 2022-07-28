class ServerException implements Exception {
  final String httpStatus;
  final String message;

  ServerException(this.httpStatus, this.message);

}
