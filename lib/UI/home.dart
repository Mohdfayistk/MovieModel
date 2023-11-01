import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled11/UI/second.dart';

import '../Bloc/movie_bloc.dart';
import '../Repository/modelclass/MovieModel.dart';
import 'home.dart';
import 'home.dart';
import 'home.dart';
import 'home.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

late MovieModel data;

class _homeState extends State<home> {
  @override
  void initState() {
    BlocProvider.of<MovieBloc>(context).add(FetchMovie());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
        if (state is MovieblocLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MovieblocError) {
          return Text('error');
        }
        if (state is MovieblocLoaded) {
          data = BlocProvider.of<MovieBloc>(context).animeModel;
          return GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            shrinkWrap: true,
            children: List.generate(
              data.results!.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => second(
                                image: data.results![index].imageurl!.isEmpty
                                    ? "assets/1.png"
                                    : data.results![index].imageurl![0]
                                        .toString(),
                                tile: data.results![index].title.toString(),
                                description:
                                    data.results![index].synopsis.toString(),
                              )));
                    },
                    child: Container(
                      width: 174.50.w,
                      height: 189.11.h,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(width: 1.r, color: Color(0xB2F8A44C)),
                          borderRadius: BorderRadius.circular(18.r),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x00000000),
                            blurRadius: 12.r,
                            offset: Offset(0, 6),
                            spreadRadius: 0.r,
                          )
                        ],
                      ),
                      child: data.results![index].imageurl!.isEmpty
                          ? Image.asset("assets/1.png")
                          : Image.network(
                              data.results![index].imageurl![0].toString()),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return SizedBox();
        }
      }),
    );
  }
}
