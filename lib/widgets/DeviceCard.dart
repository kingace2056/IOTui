// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeviceCard extends StatefulWidget {
  String deviceName;
  IconData deviceIcon;
  bool deviceStatus;
  Color gradientStart;
  Color gradientEnd;
  Color btnActiveColor;
  String route;

  DeviceCard(
      {Key? key,
      required this.deviceName,
      required this.deviceIcon,
      required this.deviceStatus,
      required this.gradientStart,
      required this.gradientEnd,
      required this.btnActiveColor,
      required this.route})
      : super(key: key);
  @override
  State<DeviceCard> createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, widget.route,
            arguments: widget.deviceStatus);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                spreadRadius: 2,
                offset: const Offset(2, 2)),
          ],
          borderRadius: BorderRadius.circular(30),
          gradient: widget.deviceStatus == true
              ? LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    // Color.fromARGB(255, 243, 83, 90),
                    // Color.fromARGB(255, 243, 82, 82),
                    widget.gradientStart,
                    widget.gradientEnd,
                  ],
                )
              : const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.white, Colors.white],
                ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                widget.deviceIcon,
                color:
                    widget.deviceStatus == true ? Colors.white : Colors.black,
                size: 55,
              ),
              Text(
                widget.deviceName,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: widget.deviceStatus == true
                        ? Colors.white
                        : Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              CupertinoSwitch(
                  activeColor: widget.btnActiveColor,
                  trackColor: Colors.black,
                  value: widget.deviceStatus,
                  onChanged: (value) {
                    if (widget.deviceStatus == true) {
                      setState(() {
                        widget.deviceStatus = false;
                      });
                    } else {
                      setState(() {
                        widget.deviceStatus = true;
                      });
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
