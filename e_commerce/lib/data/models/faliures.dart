class Faliure {
  String errorMessage;
  Faliure(this.errorMessage);

}
class NetworkFailure extends Faliure {
  NetworkFailure(super.errorMessage);
  
}
