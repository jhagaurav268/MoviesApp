import 'package:flutter/material.dart';
import 'package:glorify_movies_app/utils/text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerUrl, posterUrl, vote, launchOn;

  const Description(
      {Key key,
      this.name,
      this.description,
      this.bannerUrl,
      this.posterUrl,
      this.vote,
      this.launchOn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(children: [
          Container(
              height: 250,
              child: Stack(children: [
                Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    child: ModifiedText(text: '⭐ Average Rating - ' + vote)),
              ])),
          SizedBox(height: 15),
          Container(
              padding: EdgeInsets.all(10),
              child: ModifiedText(
                  text: name != null ? name : 'Not Loaded', size: 24)),
          Container(
              padding: EdgeInsets.only(left: 10),
              child:
                  ModifiedText(text: 'Releasing On - ' + launchOn, size: 14)),
          Row(
            children: [
              Container(
                height: 200,
                width: 100,
                child: Image.network(posterUrl),
              ),
              Flexible(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: ModifiedText(text: description, size: 18)),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
