import 'package:flutter/material.dart';

class CustomSizedBox extends StatelessWidget {
  final String? label;
  final String? title;
  final sicon;


  const CustomSizedBox(
      {Key? key, this.label, this.title, this.sicon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 60,
      width: width,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 5,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child:
                        Text(label!, style: const TextStyle(color: Colors.grey)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Text(title!,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5)),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: sicon)
            ],
          ),
        ),
      ),
    );
  }
}
