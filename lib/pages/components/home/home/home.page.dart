import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controllers/postings.controller.dart';
import 'package:my_project/pages/components/home/posting/posting.page.dart';
import 'package:my_project/pages/components/home/profile/components/sound.component.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePlayerState createState() => _HomePlayerState();
}

class _HomePlayerState extends State<HomePage> {
  PostingController postingsController = Get.put(PostingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F111A),
      appBar: AppBar(
        title: Text('Postings'),
        backgroundColor: Color(0xff0F111A),
        actions: [
          TextButton(
            onPressed: () {
              _showPostingForm(context);
            },
            child: new Text(
              'Nuevo posting',
              style: TextStyle(
                color: Colors.blueAccent
              ),
            ),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _pullRefresh,
        child: SafeArea(
          child: Obx(
            () => GridView.count(
              crossAxisCount: 1,
              children: List.generate(postingsController.postingsList.length, (index) {
                return soundItem(
                  description: postingsController.postingsList[index].description,
                  id: postingsController.postingsList[index].id,
                  likes: postingsController.postingsList[index].likes,
                  posted: postingsController.postingsList[index].posted,
                  trashes: postingsController.postingsList[index].trashes,
                );
              }),
            )
          )
        ),
      ),
    );
  }

  Future<void> _pullRefresh() async {
    var cont = Get.put(PostingController());
    cont.onInit();
  }


  void _showPostingForm(context){
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context)
      {
      return DraggableScrollableSheet(
        initialChildSize: 0.9,
        maxChildSize: 1,
        minChildSize: 0.25,
        builder: (
          BuildContext context,
          ScrollController scrollController
        ){
          return PostingPage(
            context: context,
          );
        },
      );
    });
  }
}

