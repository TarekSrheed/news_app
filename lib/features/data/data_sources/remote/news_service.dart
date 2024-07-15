import 'package:dio/dio.dart';
import 'package:news_app_flutter/features/data/data_sources/remote/core_service.dart';
import 'package:news_app_flutter/features/data/model/handling_model.dart';
import 'package:news_app_flutter/features/data/model/news_model.dart';

abstract class NewsService extends CoreService {
  String baseUrl = "https://newsapi.org/v2/top-headlines?";
  Future<ResultModel> getNews();
  Future<ResultModel> searchInNews(String lexem);
  Future<ResultModel> getCategoryNews(String category);
}

class NewsServiceImp extends NewsService {
  @override
  Future<ResultModel> getNews() async {
    response = await req
        .get("${baseUrl}language=en&apiKey=7b6701ac6b7f497084b287924bd24525");

    try {
      if (response.statusCode == 200) {
        return ListOf(
          listOfData: List.generate(
            response.data['articles'].length,
            (index) => NewsModel.fromMap(response.data['articles'][index]),
          ),
        );
      } else {
        return ErrorModel(message: "There is an Error Please Try Again");
      }
    } on DioException catch (e) {
      return ExceptionModel(message: e.message!);
    }
  }
  @override
  Future<ResultModel> searchInNews(
    String lexem,
  ) async {
    response = await req
        .get("${baseUrl}q=$lexem&apiKey=7b6701ac6b7f497084b287924bd24525");
    try {
      if (response.statusCode == 200) {
        return ListOf(
          listOfData: List.generate(
            response.data["articles"].length,
            (index) => NewsModel.fromMap(response.data["articles"][index]),
          ),
        );
      } else {
        return ErrorModel(message: "there is an error");
      }
    } on DioException catch (e) {
      return ExceptionModel(message: e.message!);
    }
  }

  @override
  Future<ResultModel> getCategoryNews(String category) async {
    response = await req.get(
        "${baseUrl}category=$category&apiKey=7b6701ac6b7f497084b287924bd24525");
        print(response);
    try {
      if (response.statusCode == 200) {
        return ListOf(
          listOfData: List.generate(
            response.data["articles"].length,
            (index) => NewsModel.fromMap(response.data["articles"][index]),
          ),
        );
      } else {
        return ErrorModel(message: "there is an error");
      }
    } on DioException catch (e) {
      return ExceptionModel(message: e.message!);
    }
  }
}

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//           future: NewsServiceImp().getNews(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                   itemCount: snapshot.data!.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Text(snapshot.data![index].title),
//                     );
//                   });
//             } else {
//               return CircularProgressIndicator();
//             }
//           }),
//     );
//   }
// }
