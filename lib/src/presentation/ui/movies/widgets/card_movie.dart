import 'package:flutter/material.dart';

import '../../../../../shared/utils/format_date.dart';
import '../../../../domain/entities/movie_entity.dart';

class CardMovie extends StatelessWidget {
  const CardMovie({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final MovieEntity movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Container(
                width: 200,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://image.tmdb.org/t/p/w300/${movies.posterPath}',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 225, left: 10),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.black54,
                  child: TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0.0, end: (movies.voteAverage / 10)),
                    duration: const Duration(seconds: 3),
                    builder: (context, double valueA, child) {
                      return (CircularProgressIndicator(
                        value: valueA,
                        color: Colors.redAccent,
                      ));
                    },
                  ),

                  // child: PieChart(
                  //   initialAngleInDegree: 270,
                  //   centerText: movies[index].voteAverage.toStringAsFixed(2),
                  //   centerTextStyle: const TextStyle(
                  //     fontSize: 12,
                  //     color: Colors.black,
                  //   ),
                  //   chartRadius: 35,
                  //   legendOptions: const LegendOptions(showLegends: false),
                  //   ringStrokeWidth: 3,
                  //   dataMap: <String, double>{
                  //     "rank": movies[index].voteAverage,
                  //   },
                  //   chartValuesOptions: const ChartValuesOptions(
                  //     showChartValues: false,
                  //     chartValueStyle: TextStyle(
                  //       fontSize: 15,
                  //       color: Colors.black87,
                  //       fontWeight: FontWeight.w700,
                  //     ),
                  //   ),
                  //   baseChartColor: Colors.red.shade900,
                  //   chartType: ChartType.ring,
                  //   colorList: colorList,
                  //   totalValue: 10,
                  // ),
                ),
              ),
              Positioned(
                top: 241,
                left: 24,
                child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0.0, end: (movies.voteAverage / 10) * 10),
                  duration: const Duration(seconds: 3),
                  builder: (context, double valueA, child) {
                    return Text(
                      '$valueA'.toString().substring(0, 3),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movies.title,
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                formatDate(movies.releaseDate),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
