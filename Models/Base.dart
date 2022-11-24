Map<String, dynamic> _ApiBase = {};
Map<String, dynamic> _LocalBase = {};

class Base {
  final bool isAPI;

  Base({this.isAPI = true});

  void add(Map<String, dynamic> _map) {
    if (isAPI) {
      _ApiBase.addAll(_map);
    } else {
      _LocalBase.addAll(_map);
    }
  }

  Map<String, dynamic> get() {
    if (isAPI) {
      return _ApiBase;
    } else {
      return _LocalBase;
    }
  }
}
