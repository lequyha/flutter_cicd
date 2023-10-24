import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/src/core/loading_manager.dart';

class LoadingDialogManager {
  LoadingDialogManager(
    this._globalNavigationKey,
    this._loadingManager,
  );

  final GlobalKey<NavigatorState> _globalNavigationKey;
  final LoadingManager _loadingManager;

  BuildContext get _globalContext => _globalNavigationKey.currentState!.context;

  void init() {
    _loadingManager.loadingStream.listen(_onLoadingStateChanged);
  }

  void _onLoadingStateChanged(bool isLoading) {
    if (isLoading) {
      _showLoadingDialog(_globalContext);
    } else {
      _hideLoadingDialog(_globalContext);
    }
  }

  void _showLoadingDialog(BuildContext context) => showDialog(
        context: _globalContext,
        builder: (context) => Center(
          child: Container(
            height: 100,
            width: 100,
            padding: EdgeInsets.all(32.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: CircularProgressIndicator(),
          ),
        ),
      );

  void _hideLoadingDialog(BuildContext context) => Navigator.pop(context);
}
