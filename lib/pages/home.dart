import 'package:flutter/material.dart';
import 'package:retrofit_flutter_sample/services/api_service.dart';
import 'package:dio/dio.dart';

import '../model/post_model.dart';

class Home extends StatelessWidget {
  const Home({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text("Retroft Sample"),
          centerTitle: true,
        ),
        body: _body()
    );
  }

  FutureBuilder _body() {
  /*  final dio = Dio(); // Initialize Dio instance
    final apiService = ApiService(dio);
*/
   final apiService = ApiService(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder(
        future: apiService.getRequestModel(),
        builder: (context, snapshot) {
          print("snapshot.......1......${snapshot}");

          if (snapshot.connectionState == ConnectionState.done) {
            print("snapshot.......2......${snapshot.data}");

            final List<PostModel> requestModel = snapshot.data!;
            print("requestModel....$requestModel");

            return _resuest(requestModel);
          } else if (snapshot.hasError) {
            // Handle DioException here
            final dioError = snapshot.error as DioError;
            return Text('DioError: ${dioError.message}');
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }


  Widget _resuest(List<PostModel> requestModel) {
    return ListView.builder(
        itemCount: requestModel.length,
        itemBuilder: (context, index) {

          print("requestModel..length.............${requestModel.length}");
          print("requestModel..length.............${requestModel[index].title}");

          return Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 1),

            ), child: Column(
            children: [
              Text(requestModel[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text(requestModel[index].body,
                  style: TextStyle(fontWeight: FontWeight.bold))

            ],
          ),

          );
        }

    );
  }
}
