class NoInternetException {
  final String error;
  final String message = 'Aucune connection internet :(';
  NoInternetException(this.error);
}
