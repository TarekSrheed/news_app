// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/core/res/app_string.dart';
import 'package:news_app_flutter/core/res/app_style.dart';
import 'package:news_app_flutter/features/view/bloc/news_with_bloc/news_bloc.dart';
import 'package:news_app_flutter/features/view/bloc/news_with_bloc/news_event.dart';
import 'package:news_app_flutter/features/view/bloc/news_with_bloc/news_state.dart';
import 'package:news_app_flutter/features/view/pages/details_page.dart';
import 'package:news_app_flutter/features/view/widgets/latest_news_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc()..add(GetNews()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                if (state is SuccessToGetData) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.news.length,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  width: 341,
                                  height: 200,
                                  state.news[index].urlToImage,
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(Icons.image);
                                  },
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 30, top: 10, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LATESTNEWS,
                              style: titleStyle,
                            ),
                            Text(
                              SEEMORE,
                              style: seeMoreStyle,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: state.news.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BlocProvider(
                                        create: (context) => NewsBloc()
                                          ..add(SelectItemEvent(
                                              news: state.news[index])),
                                        child: DetailsPage(),
                                      ),
                                    ),
                                  );
                                },
                                child: LatestNewsWidget(
                                  image: state.news[index].urlToImage,
                                  date: state.news[index].publishedAt,
                                  title: state.news[index].title,
                                  name: state.news[index].source.name,
                                ),
                              );
                            }),
                      )
                    ],
                  );
                } else if (state is LoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ErrorState) {
                  return Text(PROBLEM);
                } else {
                  return const Icon(Icons.error);
                }
              },
            ),
          );
        },
      ),
    );
  }
}

// class ImageSlidePage extends StatefulWidget {
//   @override
//   _ImageSlidePageState createState() => _ImageSlidePageState();
// }

// class _ImageSlidePageState extends State<ImageSlidePage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );

//     _animation = Tween<Offset>(
//       begin: Offset(0, 0),
//       end: Offset(-1, 0),
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     ));
//   }

//   void _startAnimation() {
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Slide Animation'),
//       ),
//       body: Center(
//         child: GestureDetector(
//           onTap: _startAnimation,
//           child: Stack(
//             children: [
//               Image.asset(
//                 textLogo, // Replace with your bottom image
//                 width: 200,
//                 height: 250,
//               ),
//               SlideTransition(
//                 position: _animation,
//                 child: Image.asset(
//                   newsLogo, // Replace with your top image
//                   width: 200,
//                   height: 250,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
