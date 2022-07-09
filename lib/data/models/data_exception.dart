abstract class DataException implements Exception {
  final String message;
  final int code;
  DataException(this.message, this.code);
}

// Remote Exception Model ------------------------------------------------------
class RemoteException extends DataException {
  static const other = -1;
  static const receiveTimeout = 0;
  static const connectTimeout = 1;
  static const sendTimeout = 2;
  static const response = 3;
  static const cancel = 4;
  static const socket = 5;
  static const noInternet = 6;

  final String errorMessage;
  final int errorCode;

  RemoteException({
    required this.errorMessage,
    required this.errorCode,
  }) : super(errorMessage, errorCode);
}
