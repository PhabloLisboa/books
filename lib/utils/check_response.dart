class CheckResponse<T> {
  bool ok;
  String msg;
  T result;

  CheckResponse.ok(this.result) {
    ok = true;
  }

  CheckResponse.error(this.msg) {
    ok = false;
  }
}
