import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_project/pages/shared/backgroundElements/profile.bkg.element.dart';
import 'package:my_project/shared/colors.dart';

import 'components/buttonprofile.component.dart';
import 'components/infoContainer.component.dart';
import 'components/presentationCard.component.dart';
import 'components/signOut.components.dart';
import 'components/sound.component.dart';
// import 'package:flutter/services.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with TickerProviderStateMixin {

  String username = 'jokamexd0699';
  final bodyGlobalKey = GlobalKey();
  final List<Widget> myTabs = [
    Tab(
      icon: const Icon(Icons.music_note_rounded),
      text: 'Mis postings',
    ),
    Tab(
      icon: const Icon(Icons.account_circle_rounded),
      text: 'Mi perfil',
    )
  ];
  TabController? _tabController;
  ScrollController? _scrollController;
  bool? fixedScroll = false;

  AnimationController? _animationController;
  Animation? _animation;

  @override
  void initState() {
    // scroll and tab
    _scrollController = ScrollController();
    _scrollController!.addListener(_scrollListener);
    _tabController = TabController(length: 2, vsync: this);
    _tabController!.addListener(_smoothScrollToTop);

    // profile animation
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500)
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController!);
    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    _scrollController!.dispose();
    _animationController!.dispose();
    super.dispose();
  }

  _scrollListener() {
    if (fixedScroll == true) {
      _scrollController!.jumpTo(0);
    }
  }

  _smoothScrollToTop() {
    _scrollController!.animateTo(
      1,
      duration: Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );

    setState(() {
      fixedScroll = _tabController!.index == 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Stack(
        children: [
          radianBackgrounShared(
            firstColor: ApplicationColors.kPrimaryBkgColor,
            secondColor: ApplicationColors.kSecundaryBkgColor,
          ),
          NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (context, value) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  expandedHeight: 200,
                  toolbarHeight: 200,
                  title: Column(
                    children: [
                      signOutButton(),
                      SizedBox(height: 30,),
                      presentationCard(
                        context,
                        username: 'josekaboxd06'
                      ),
                    ],
                  ),
                  stretch: false,
                ),
                SliverToBoxAdapter(
                  child: Center(
                    child: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(
                          width: 2.0,
                          color: ApplicationColors.kIndicatorTapColor,
                        ),
                        insets: EdgeInsets.symmetric(
                          horizontal:30.0
                        ),
                      ),
                      tabs: myTabs,
                    ),
                  ),
                ),
              ];
            },
            body: Container(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Sounds
                  GridView.count(
                    crossAxisCount: 1,
                    children: List.generate(10, (index) {
                      return soundItem();
                    }),
                  ),
                  // Profile
                  Container(
                    padding: EdgeInsets.only(
                      top: 15,
                      bottom: 30,
                      left: 15,
                      right: 15
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          showInfoContainer( info: 'JOSE MELITON MEDELLIN GONZALEZ', title: 'Nombre' ),
                          showInfoContainer( info: '06/06/1999', title: 'Nacimiento' ),
                          showInfoContainer( info: '22', title: 'Edad' ),
                          showInfoContainer( info: '8311169468', title: 'Telefono' ),
                          showInfoContainer( info: 'jmedellin@gmail.com', title: 'Email' ),
                          showInfoContainer( info: 'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500,', title: 'Biografia'),
                          buttonProfileShared(
                            action: 'edit',
                            kiBackgrounColor: Color(0x805D5669),
                            kiForegroundColor: Colors.blueAccent,
                            kiIcon: CupertinoIcons.pencil_outline,
                            text: 'Editar'
                          ),
                          buttonProfileShared(
                            action: 'change',
                            kiBackgrounColor: Color(0xD099153C),
                            kiForegroundColor: Colors.redAccent,
                            kiIcon: CupertinoIcons.lock_open_fill,
                            text: 'Cambiar contraseña'
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

