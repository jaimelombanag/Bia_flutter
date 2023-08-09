import 'package:bia_energy_prueba/src/core/constants.dart';
import 'package:bia_energy_prueba/src/view/home/widgets/list_item_character.dart';
import 'package:bia_energy_prueba/src/view/home/widgets/search.widget.dart';
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

  _pageListener() {
    setState(() {});
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
            const Text(Constants.titleHome),
            search(
                homecontroller: homecontroller,
                searchController: _searchController)
          ],
        ),
        backgroundColor: ThemeColor.primaryBlue,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Constants.fondoMarvel3), fit: BoxFit.cover),
        ),
        child: Obx(
          () => PageView.builder(
            scrollDirection: Axis.vertical,
            controller: _controller,
            itemCount: homecontroller.itemsFilter.length,
            itemBuilder: (context, index) {
              double? currentPage = 0;
              try {
                currentPage = _controller!.page;
              } catch (_) {}
              final num resizeFactor =
                  (1 - (((currentPage! - index).abs() * 0.3).clamp(0.0, 1.0)));
              final currentCharacter = homecontroller.itemsFilter[index];
              return ListItem(
                character: currentCharacter,
                resizeFactor: resizeFactor as double,
                onTap: () =>
                    homecontroller.goToDetail(currentCharacter, context),
              );
            },
          ),
        ),
      ),
    );
  }
}
