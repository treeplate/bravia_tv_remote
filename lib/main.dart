import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tv_remote/protocol.dart';

void main() {
  runApp(TVRemote());
}

class TVRemote extends StatefulWidget {
  const TVRemote({super.key});

  @override
  State<TVRemote> createState() => _TVRemoteState();
}

class _TVRemoteState extends State<TVRemote> {
  bool connected = false;
  @override
  void initState() {
    InternetAddress.lookup('tv').then((addresses) {
      connect(addresses.single).then((_) {
        setState(() {
          connected = true;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!connected) {
      return CircularProgressIndicator();
    }
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            double width = constraints.maxWidth;
            double height = constraints.maxHeight;
            if (5 * width < height) {
              height = 5 * width;
            } else {
              width = height / 5;
            }
            double buttonSize = width / 5;
            return Center(
              child: Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
                    side: BorderSide(color: Colors.white),
                  ),
                  color: const Color(0xFF121212),
                ),
                width: width,
                height: height,
                child: Padding(
                  padding: EdgeInsets.all(buttonSize / 2),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleButton(
                            command: 98,
                            size: buttonSize,
                            child: Icon(
                              Icons.power_settings_new,
                              size: buttonSize / 2,
                              color: Colors.teal,
                            ),
                          ),
                          SizedBox(),
                        ],
                      ),
                      SizedBox(height: buttonSize / 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleButton(
                            command: 100,
                            size: buttonSize,
                            child: Text(
                              'TV',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(width: buttonSize),
                          CircleButton(
                            command: 7,
                            size: buttonSize,
                            child: Icon(
                              Icons.settings_outlined,
                              color: Colors.white,
                              size: buttonSize / 2,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: buttonSize / 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleButton(
                            command: 101,
                            size: buttonSize,
                            child: Icon(Icons.input, color: Colors.white),
                          ),
                        ],
                      ),
                      Container(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(side: BorderSide()),
                        ),
                        height: buttonSize * 3 + 2,
                        width: buttonSize * 3 + 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleButton(
                              command: 9,
                              size: buttonSize,
                              withBorder: false,
                              child: Icon(
                                Icons.arrow_drop_up,
                                color: Colors.black,
                                size: buttonSize,
                              ),
                            ),
                            Row(
                              children: [
                                CircleButton(
                                  command: 12,
                                  size: buttonSize,
                                  withBorder: false,
                                  child: Icon(
                                    Icons.arrow_left,
                                    color: Colors.black,
                                    size: buttonSize,
                                  ),
                                ),
                                CircleButton(
                                  command: 13,
                                  size: buttonSize,
                                  child: Icon(Icons.add, size: buttonSize / 2),
                                ),
                                CircleButton(
                                  command: 11,
                                  size: buttonSize,
                                  withBorder: false,
                                  child: Icon(
                                    Icons.arrow_right,
                                    color: Colors.black,
                                    size: buttonSize,
                                  ),
                                ),
                              ],
                            ),
                            CircleButton(
                              command: 10,
                              size: buttonSize,
                              withBorder: false,
                              child: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                                size: buttonSize,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleButton(
                            command: 8,
                            size: buttonSize,
                            child: Icon(
                              Icons.arrow_back,
                              size: buttonSize / 2,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: buttonSize),
                          CircleButton(
                            command: 6,
                            size: buttonSize,
                            child: Icon(
                              Icons.home,
                              size: buttonSize / 2,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: buttonSize / 2),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(),
                                borderRadius: BorderRadiusGeometry.all(
                                  Radius.circular(buttonSize / 2),
                                ),
                              ),
                            ),
                            height: buttonSize * 3 + 2,
                            width: buttonSize,
                            child: Column(
                              children: [
                                CircleButton(
                                  command: 30,
                                  size: buttonSize,
                                  withBorder: false,
                                  child: Icon(
                                    Icons.volume_up,
                                    size: buttonSize / 2,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: buttonSize),
                                CircleButton(
                                  command: 31,
                                  size: buttonSize,
                                  withBorder: false,
                                  child: Icon(
                                    Icons.volume_down,
                                    size: buttonSize / 2,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: buttonSize / 2),
                          CircleButton(
                            command: 32,
                            size: buttonSize,
                            child: Icon(
                              Icons.volume_mute,
                              size: buttonSize / 2,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: buttonSize / 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleButton(
                            command: 130,
                            size: buttonSize,
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: buttonSize/2,
                            ),
                          ),
                          CircleButton(
                            command: 84,
                            size: buttonSize,
                            child: Icon(
                              Icons.pause,
                              color: Colors.white,
                              size: buttonSize/2,
                            ),
                          ),
                          CircleButton(
                            command: 2,
                            size: buttonSize,
                            child: Icon(
                              Icons.table_chart_outlined,
                              color: Colors.white,
                              size: buttonSize/2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    required this.command,
    required this.child,
    required this.size,
    this.withBorder = true,
  });

  final int? command;
  final Widget child;
  final double size;
  final bool withBorder;

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      onPressed: command == null ? null : () {
        sendIIRC(command!);
      },
      style: IconButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        fixedSize: Size(size, size),
        side: withBorder
            ? BorderSide(color: Colors.black)
            : BorderSide(color: Color(0xFF121212)),
      ),
      icon: child,
    );
  }
}
