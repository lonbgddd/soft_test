import 'package:flutter/material.dart';

Widget buildTitleProductWidget({String title = ''}) => SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8, left: 16, top: 12),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
          textAlign: TextAlign.start,
        ),
      ),
    );
