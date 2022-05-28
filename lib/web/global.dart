class Global {
  final String url = 'http://localhost:8080/';

  String buildUrl(String endUrl) {
    return url + endUrl;
  }
}
