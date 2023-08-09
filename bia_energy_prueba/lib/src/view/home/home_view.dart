import 'package:bia_energy_prueba/src/models/characters/character.dart';
import 'package:bia_energy_prueba/src/view/detail/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/app_themes_colors.dart';
import '../../viewmodels/home/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homecontroller = Get.put(HomeController());
  final TextEditingController _searchController = TextEditingController();
  PageController? _controller;

  _goToDetail(Character character) {
    final page = DetailPage(character: character);
    Navigator.of(context).push(
      PageRouteBuilder<Null>(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return AnimatedBuilder(
                animation: animation,
                builder: (BuildContext context, Widget? child) {
                  return Opacity(
                    opacity: animation.value,
                    child: page,
                  );
                });
          },
          transitionDuration: Duration(milliseconds: 400)),
    );
  }

  _pageListener() {
    setState(() {});
  }

  void filterSearchResults(String query) {
    setState(() {
      homecontroller.itemsFilter.value = homecontroller.listCharacter
          .where(
              (item) => item.title!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    homecontroller.getCharacters();
    _controller = PageController(viewportFraction: 0.6);
    _controller!.addListener(_pageListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.removeListener(_pageListener);
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        title: Column(
          children: [
            const SizedBox(height: 10),
            const Text("Marvel"),
            TextField(
              controller: _searchController,
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                filterSearchResults(value);
              },
            ),
          ],
        ),
        backgroundColor: ThemeColor.primaryBlue,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/fondo_marvel3.jpeg"),
              fit: BoxFit.cover),
        ),
        child: Obx(
          () => PageView.builder(
            scrollDirection: Axis.vertical,
            controller: _controller,
            //itemCount: homecontroller.listCharacter.length,
            itemCount: homecontroller.itemsFilter.length,
            itemBuilder: (context, index) {
              double? currentPage = 0;
              try {
                currentPage = _controller!.page;
              } catch (_) {}

              final num resizeFactor =
                  (1 - (((currentPage! - index).abs() * 0.3).clamp(0.0, 1.0)));
              //final currentCharacter = homecontroller.listCharacter[index];
              final currentCharacter = homecontroller.itemsFilter[index];
              return ListItem(
                character: currentCharacter,
                resizeFactor: resizeFactor as double,
                onTap: () => _goToDetail(currentCharacter),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final Character character;
  final double resizeFactor;
  final VoidCallback onTap;

  const ListItem({
    Key? key,
    required this.character,
    required this.resizeFactor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width * 0.9;
    return InkWell(
      onTap: onTap,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: width * resizeFactor,
          height: height * resizeFactor,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: height / 5,
                bottom: 0,
                child: Hero(
                  tag: "background_${character.title}",
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/fondo_marvel.jpeg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          character.title!,
                          style: TextStyle(
                              fontSize: 24 * resizeFactor,
                              fontWeight: FontWeight.w600,
                              color: ThemeColor.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Hero(
                  tag: "image_${character.title}",
                  child: Image(
                    width: width / 2,
                    height: height,
                    image: NetworkImage(character.avatar!),
                  ),

                  // Image.asset(
                  //   character.avatar!,
                  //   width: width / 2,
                  //   height: height,
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
