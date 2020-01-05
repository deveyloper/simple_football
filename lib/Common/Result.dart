class Result<T> {
  T data;
  bool isSuccessful;
  Error error;

  Result.asSuccess(T data) {
    this.data = data;
    this.isSuccessful = true;
  }

  Result.asError(Error error) {
    this.data = null;
    this.isSuccessful = false;
    this.error = error;
  }
}
