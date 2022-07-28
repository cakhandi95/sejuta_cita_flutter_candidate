import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String httpStatus;
  final String message;

  const Failure(this.httpStatus, this.message);

  @override
  List<Object> get props => [httpStatus, message];
}

class ServerFailure extends Failure {
  const ServerFailure(String httpStatus, String message) : super(httpStatus, message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(String httpStatus, String message) : super(httpStatus, message);
}

class CommonFailure extends Failure {
  const CommonFailure(String httpStatus, String message) : super(httpStatus, message);
}
