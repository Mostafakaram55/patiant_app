abstract class ErrorApp{
  final String error;
  ErrorApp(this.error);
}
class FireBaseError extends ErrorApp{
  FireBaseError(super.error);
}