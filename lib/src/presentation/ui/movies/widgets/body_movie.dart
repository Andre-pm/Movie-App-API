import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../domain/entities/movie_entity.dart';
import 'card_movie.dart';

class BodyMovie extends StatelessWidget {
  const BodyMovie({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final List<MovieEntity> movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://wallpaper.dog/large/20493501.jpg',
              ),
              fit: BoxFit.cover,
              opacity: 0.6,
              colorFilter: ColorFilter.mode(Color.fromARGB(151, 14, 13, 13), BlendMode.darken),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Trending',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'The daily and weekly top movies',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Visibility(
            visible: movies.isNotEmpty,
            replacement: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              enabled: true,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(15),
                          height: 290.0,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(15),
                          height: 290.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            child: GridView.builder(
                padding: const EdgeInsets.all(10),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 5,
                  childAspectRatio: 0.47,
                ),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return CardMovie(movies: movies[index]);
                }),
          ),
        ),
      ],
    );
  }
}
