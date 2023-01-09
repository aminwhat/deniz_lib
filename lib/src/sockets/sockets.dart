import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:socket_io_client/socket_io_client.dart';

abstract class Sockets {
  late Socket _socket;

  String connectionName = 'Deniz-Sockets';

  factory Sockets.on(Sockets readySocket) {
    readySocket.connectSocket();
    return readySocket;
  }

  @mustCallSuper
  void connectSocket() {
    onConnect();
    onConnectError();
    onDisConnect();
  }

  @protected
  @mustCallSuper
  void onConnect() {
    _socket.onConnect((data) => log('$connectionName: Connection Established'));
  }

  @protected
  @mustCallSuper
  void onConnectError() {
    _socket.onConnectError(
        (data) => log('$connectionName: Connection Error: $data'));
  }

  @protected
  @mustCallSuper
  void onDisConnect() {
    _socket.onDisconnect(
        (data) => log('$connectionName: Socket.IO Server Disconnected'));
  }
}
