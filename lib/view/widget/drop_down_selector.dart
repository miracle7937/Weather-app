import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton(
      {Key? key, this.handleClick, required this.cities})
      : super(key: key);
  final Function(String)? handleClick;
  final List<String> cities;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: SizedBox(
        width: MediaQuery.of(context).size.height * 0.07,
        height: MediaQuery.of(context).size.height * 0.07,
        child: const Icon(
          CupertinoIcons.location,
          color: Colors.white,
        ),
      ),
      onSelected: handleClick,
      itemBuilder: (BuildContext context) {
        return cities.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black)),
          );
        }).toList();
      },
    );
  }
}
