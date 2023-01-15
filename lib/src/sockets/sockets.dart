import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart';

abstract class Sockets {
  late Socket theSocket;

  String name = 'Deniz-Sockets';

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
    theSocket.onConnect((data) => log('$name: Connection Established'));
  }

  @protected
  @mustCallSuper
  void onConnectError() {
    theSocket.onConnectError((data) => log('$name: Connection Error: $data'));
  }

  @protected
  @mustCallSuper
  void onDisConnect() {
    theSocket
        .onDisconnect((data) => log('$name: Socket.IO Server Disconnected'));
  }
}
