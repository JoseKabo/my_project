import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controllers/profile.controller.dart';
import 'package:my_project/pages/components/home/home/home.page.dart';
import 'package:my_project/pages/components/home/posting/posting.page.dart';
import 'package:my_project/pages/components/home/profile/profile.page.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( _ ) => new _SelectedPageModel() ,
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _NavigationBar(),
      ),
    );
  }
}

class _NavigationBar extends StatelessWidget {
  const _NavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final selectedPageModel = Provider.of<_SelectedPageModel>(context);

    return BottomNavigationBar(
      currentIndex: selectedPageModel.selectedPage,
      onTap: (i) => selectedPageModel.selectedPage = i,
      items: [
        BottomNavigationBarItem(
          icon: new Icon(
            Icons.home_rounded
          ),
          label: 'Inicio'
        ),
        BottomNavigationBarItem(
          icon: new Icon(
            CupertinoIcons.person_alt
          ),
          label: 'Perfil'
        )
      ],
      backgroundColor: Color(0xff0F111A),
      // fixedColor: Colors.white,
      unselectedItemColor: Colors.white60,
      selectedItemColor: Colors.white,
      selectedLabelStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700
      )
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final selctedpage = Provider.of<_SelectedPageModel>(context);

    return PageView(
      controller: selctedpage.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        HomePage(),
        ProfilePage(),
      ],
    );
  }
}


class _SelectedPageModel extends ChangeNotifier{
  int _selectedPage = 0;
  PageController _pageController = new PageController();
  int get selectedPage => this._selectedPage;

  set selectedPage(int value) {
    this._selectedPage = value;
    _pageController.animateToPage(value, duration: Duration(milliseconds: 350), curve: Curves.bounceInOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}