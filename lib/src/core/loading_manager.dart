import 'dart:async';

/// Manages the application loading state
///
/// The actual ui will be shown/hidden in [DialogManager]
class LoadingManager {
  final _loadingStreamController = StreamController<bool>();

  Stream<bool> get loadingStream => _loadingStreamController.stream;

  void showLoading() => _setLoading(true);

  void hideLoading() => _setLoading(false);

  void _setLoading(bool isLoading) {
    _loadingStreamController.add(isLoading);
  }
}
