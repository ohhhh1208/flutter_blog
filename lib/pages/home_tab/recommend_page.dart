import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecommendPage extends StatefulWidget {
  const RecommendPage({Key? key}) : super(key: key);

  @override
  State<RecommendPage> createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("RecommendPage"),
    );
  }
}
