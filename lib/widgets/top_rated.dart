import 'package:flutter/material.dart';
import 'package:glorify_movies_app/utils/text.dart';

class TopRatedMovies extends StatelessWidget {
  final List topRated;

  const TopRatedMovies({Key key, this.topRated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(
            text: 'Top Rated Movies',
            size: 26,
          ),
          SizedBox(height: 10),
          Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: topRated.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        topRated[index]['poster_path']),
                              ),
                            ),
                            height: 200,
                          ),
                          SizedBox(height: 5),
                          Container(
                            child: ModifiedText(
                                size: 15,
                                text: topRated[index]['title'] != null
                                    ? topRated[index]['title']
                                    : 'Loading'),
                          )
                        ],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
