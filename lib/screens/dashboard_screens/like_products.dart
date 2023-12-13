import 'package:flutter/material.dart';

class LikeProductScreen extends StatefulWidget {
  const LikeProductScreen({super.key});

  @override
  State<LikeProductScreen> createState() => _LikeProductScreenState();
}

class _LikeProductScreenState extends State<LikeProductScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Like products")));
  }
}
