class BaseError implements Exception {
  final int statusCode;
  final String message;

  BaseError(this.statusCode, this.message);

  @override
  String toString() {
    return message;
  }
}
