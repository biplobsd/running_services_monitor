import 'dart:async';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:running_services_monitor/core/constants.dart';

@lazySingleton
class ShizukuService {
  ShizukuService();

  static const _channel = MethodChannel(AppConstants.shizukuChannelName);
  static const _streamChannel = EventChannel(AppConstants.shizukuStreamChannelName);

  bool _isInitialized = false;
  bool _hasPermission = false;

  bool get isInitialized => _isInitialized;
  bool get hasPermission => _hasPermission;

  Future<bool> isShizukuRunning() async {
    try {
      final bool isRunning = await _channel.invokeMethod('pingBinder');
      return isRunning;
    } catch (e) {
      return false;
    }
  }

  Future<bool> checkPermission() async {
    try {
      final bool granted = await _channel.invokeMethod('checkPermission');
      _hasPermission = granted;
      return _hasPermission;
    } catch (e) {
      return false;
    }
  }

  Future<bool> requestPermission() async {
    try {
      final bool granted = await _channel.invokeMethod('requestPermission');
      _hasPermission = granted;
      return _hasPermission;
    } catch (e) {
      return false;
    }
  }

  Future<bool> initialize() async {
    if (_isInitialized) {
      return true;
    }

    final isRunning = await isShizukuRunning();
    if (!isRunning) {
      return false;
    }

    final hasPermission = await checkPermission();
    if (!hasPermission) {
      final granted = await requestPermission();
      if (!granted) {
        return false;
      }
    }

    _isInitialized = true;
    _hasPermission = true;
    _hasPermission = true;
    return true;
  }

  Future<String?> executeCommand(String command) async {
    if (!_isInitialized || !_hasPermission) {
      return null;
    }

    try {
      final String? result = await _channel.invokeMethod(AppConstants.cmdMethodRunCommand, {'command': command});
      return result;
    } catch (e) {
      return null;
    }
  }

  Stream<String> executeCommandStream(String command) {
    if (!_isInitialized || !_hasPermission) {
      return Stream.error(Exception('Shizuku not initialized or no permission'));
    }

    try {
      return _streamChannel.receiveBroadcastStream(command).map((event) {
        return event.toString();
      });
    } catch (e) {
      return Stream.error(e);
    }
  }
}
