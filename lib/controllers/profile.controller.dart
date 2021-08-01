import 'package:get/state_manager.dart';
import 'package:my_project/core/datasource/local.data.dart';
import 'package:my_project/core/models/basicInfo.model.dart';
import 'package:my_project/core/models/newuserInfo.model.dart';
import 'package:my_project/core/models/postings.model.dart';
import 'package:my_project/core/models/signInResponse.model.dart';
import 'package:my_project/core/models/stadistics.models.dart';
import 'package:my_project/core/models/updateinfo.model.dart';
import 'package:my_project/core/services/myprofile.service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController{

  final LocalData localData = new LocalData();
  Rx<UserInfo> user = UserInfo().obs;

  var myPostingsList = <Postings>[].obs;
  var stadistics = new StadisticsModel();

  ProfileController(){
    this.getMyBasicInfo();
  }

  @override
  void onInit()  {
    fetchMyPostings();
    super.onInit();
    // getMyStadistics();
  }

  @override
  void onReady() {
    super.onReady();
    getMyBasicInfo();
  }
  
  void fetchMyPostings() async {
    if (user.value.id!.length > 0){
      String id = user.value.id ?? '';
      var postings = await ProfileService.fetchMyPostings(id: id);
      if ( postings!.message!.message!.length > 0 && postings.message!.message!.endsWith('Success')){
        myPostingsList.value = postings.message!.response!;
      }
    }
  }

  Future<bool> updateMyInfo({
    required NewUserInfoModel infoModel
  }) async {
    var response = await ProfileService.updateInfo(newuserInfo: infoModel);
    if(response!.error == false && response.message!.response!.length > 0){
      final userinfo = response.message!.response![0];
      localData.updateBasicInfo(
        new UserInfo(
          biography: userinfo.biography,
          birthday: DateTime.parse(userinfo.birthday ?? DateTime.now().toIso8601String()),
          email: userinfo.email,
          id: this.user.value.id,
          name: this.user.value.name,
          username: userinfo.username
        )
      );
      this.user.value.biography = userinfo.biography;
      this.user.value.birthday = DateTime.parse(userinfo.birthday ?? DateTime.now().toIso8601String());
      this.user.value.email = userinfo.email;
      this.user.value.username = userinfo.username;
      return true;
    }
    return false;
  }

  void getMyBasicInfo() async {
    await localData.getUser().then((value) => {
      if( value!.name!.length > 0)
        user(value)
    });
    print(user.value.name);
    // var infoResponse = await ProfileService.getMyBasicInfo(id: '6ba7b810-9dad-11d1-80b4-00c04fd430c8');
    // if ( infoResponse!.status == 200 && infoResponse.message!.response!.length > 0 ){
    //   this.basicInfo = new Rx(infoResponse.message!.response![0]);
    //   print('Username is: ' + basicInfo.value.username!);
    // }
  }

  void getMyStadistics() async {
    var infoResponse = await ProfileService.getMyStadistics(id: '6ba7b810-9dad-11d1-80b4-00c04fd430c8');
    if ( infoResponse!.status == 200 && infoResponse.message!.response!.length > 0 ){
      this.stadistics = infoResponse.message!.response![0];
    }
  }

}