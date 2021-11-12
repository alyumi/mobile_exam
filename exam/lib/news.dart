import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart'


class news extends StatefulWidget {
  String host = "";
  String endpoint = "";
  final link = await http.get(Uri.parse("$host$endpoint", headers: header));
  
  const news({ Key? key, required this.link}) : super(key: key);

  @override
  _newsState createState() => _newsState();
}

class _newsState extends State<news> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}