import 'package:flutter/material.dart';
import 'package:todo_test/app/core/values/colors.dart';
import 'package:todo_test/app/core/values/icons.dart';

List<Icon> getIcons() => const [
      Icon(
        IconData(personIcon, fontFamily: "MaterialIcons"),
        color: purple,
      ),
      Icon(
        IconData(workIcon, fontFamily: "MaterialIcons"),
        color: deepPink,
      ),
      Icon(
        IconData(moviIcon, fontFamily: "MaterialIcons"),
        color: pink,
      ),
      Icon(
        IconData(sportIcon, fontFamily: "MaterialIcons"),
        color: green,
      ),
      Icon(
        IconData(travelIcon, fontFamily: "MaterialIcons"),
        color: yellow,
      ),
      Icon(
        IconData(shopIcon, fontFamily: "MaterialIcons"),
        color: lighBlue,
      ),
    ];
