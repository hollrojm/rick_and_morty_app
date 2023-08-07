import 'package:flutter/material.dart';

Widget dataCard(String textInfoOne, String textInfoTwo) {
  return Expanded(
    child: Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            textInfoOne,
            style: const TextStyle(color: Colors.black),
          ),
          Text(
            textInfoTwo,
            style: const TextStyle(
                overflow: TextOverflow.ellipsis, color: Colors.black),
          )
        ],
      ),
    ),
  );
}
