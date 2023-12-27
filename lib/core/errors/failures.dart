abstract class Failure {
  final String message;
  final String code;

  Failure({required this.message, required this.code});
}

class AuthFailure extends Failure {
  AuthFailure({required String message, required String code})
      : super(code: code, message: message);
}

class FirebaseFailure extends Failure {
  FirebaseFailure({
    required String message,
    required String code,
  }) : super(
          code: code,
          message: message,
        );
}

class CachedFailure extends Failure {
  CachedFailure({
    required String message,
    required String code,
  }) : super(
          code: code,
          message: message,
        );
}
