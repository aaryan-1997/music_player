import 'package:flutter/material.dart';
import 'dart:math' as math;

class Sliders extends StatelessWidget {
  final String? name;
  final String? type;
  final String? assetName;
  final String? subTitle;

  const Sliders({
    Key? key,
    this.name,
    this.assetName,
    this.subTitle,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: type == "artist"
          ? MediaQuery.of(context).size.width / 3
          : MediaQuery.of(context).size.width / 2 - 20,
      child: Column(
        crossAxisAlignment: type == "artist"
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(5),
            child: InkWell(
              child: type == "artist"
                  ? Container(
                      // child: ClipRRect(
                      //   borderRadius: BorderRadius.circular(60.0),
                      //   child: Image.network(
                      //     '$assetName',
                      //     height: 100.0,
                      //     width: 100.0,
                      //     alignment: Alignment(-1.00.abs(), 0),
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      decoration: new BoxDecoration(
                        border: Border.all(
                          width: 5,
                          color: Colors.black,
                        ),
                        borderRadius:
                            new BorderRadius.all(Radius.circular(60.0)),
                        shape: BoxShape.rectangle,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60.0),
                        child: Image.network(
                          '$assetName',
                          height: 100.0,
                          width: 100.0,
                          alignment: Alignment(-1.00.abs(), 0),
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                          bottom: Radius.circular(10)),
                      child: Image.network(
                        '$assetName',
                        height: 140.0,
                        width: 200.0,
                        alignment: Alignment(-1.00.abs(), 0),
                        fit: BoxFit.fill,
                      ),
                    ),
              onTap: () {
                print("on tab");
              },
            ),
          ),
          Expanded(
            child: CardContent(
              name: name,
              subTitle: subTitle,
            ),
          ),
        ],
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final String? name;
  final String? subTitle;

  const CardContent({Key? key, @required this.name, @required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(7.0).copyWith(top: 0, bottom: 0, right: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(name!,
              overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14)),
          SizedBox(height: 2),
          Text(
            subTitle!,
            maxLines: 1,
            style: TextStyle(color: Colors.grey, fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}
