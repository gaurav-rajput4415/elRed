class ApiConstant {
  static const  String JSON_DATA ='https://www.jsonkeeper.com/b/96KZ';
}

enum ApiStatus {
  idle,
  started,
  completed,
  loading,
  searching,
  empty,
  failed,
  timeout
}
