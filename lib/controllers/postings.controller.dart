import 'package:get/state_manager.dart';
import 'package:my_project/core/models/postinentry.model.dart';
import 'package:my_project/core/models/postings.model.dart';
import 'package:my_project/core/services/postings.service.dart';

class PostingController extends GetxController{

  var postingsList = <Postings>[].obs;

  @override
  void onInit() {
    fetchPostings();
    super.onInit();
  }
  
  void fetchPostings() async {
    var postings = await PostingServices.fetchPostings();
    if (postings!.message!.message!.endsWith('Success')){
      postingsList.value = postings.message!.response!;
    }
  }

  void addPosting({
    required AddPostModel body
  }) async {
    var postings = await PostingServices.addNewPost(
      body: body
    );
    if (postings!.message!.message!.endsWith('Success')){
      this.postingsList.insert(0, new Postings(
        description: postings.message!.response![0].description,
        id: postings.message!.response![0].id,
        likes: postings.message!.response![0].likes,
        posted: postings.message!.response![0].posted,
        trashes: postings.message!.response![0].trashes,
      ));
    }
  }

}