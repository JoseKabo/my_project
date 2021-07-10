import 'package:get/state_manager.dart';
import 'package:my_project/core/models/basicInfo.model.dart';
import 'package:my_project/core/models/postings.model.dart';
import 'package:my_project/core/models/stadistics.models.dart';
import 'package:my_project/core/services/myprofile.service.dart';

class ProfileController extends GetxController{

  var myPostingsList = <Postings>[].obs;
  var basicInfo = new BasicInfoModel();
  var stadistics = new StadisticsModel();


  @override
  void onInit() {
    fetchMyPostings();
    getMyBasicInfo();
    getMyStadistics();
    super.onInit();
  }
  
  void fetchMyPostings() async {
    var postings = await ProfileService.fetchMyPostings(id: '6ba7b810-9dad-11d1-80b4-00c04fd430c8');
    if ( postings!.message!.message!.length > 0 && postings.message!.message!.endsWith('Success')){
      myPostingsList.value = postings.message!.response!;
    }
  }

  void getMyBasicInfo() async {
    var infoResponse = await ProfileService.getMyBasicInfo(id: '6ba7b810-9dad-11d1-80b4-00c04fd430c8');
    if ( infoResponse!.status == 200 && infoResponse.message!.response!.length > 0 ){
      this.basicInfo = infoResponse.message!.response![0];
    }
  }

  void getMyStadistics() async {
    var infoResponse = await ProfileService.getMyStadistics(id: '6ba7b810-9dad-11d1-80b4-00c04fd430c8');
    if ( infoResponse!.status == 200 && infoResponse.message!.response!.length > 0 ){
      this.stadistics = infoResponse.message!.response![0];
    }
  }

}