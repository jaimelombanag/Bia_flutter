import 'package:bia_energy_prueba/src/models/characters/character.dart';
import 'package:flutter/material.dart';

import '../../../themes/app_themes_colors.dart';

class DetailPage extends StatefulWidget {
  final Character character;

  const DetailPage({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: "background_${widget.character.title}",
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/fondo_marvel.jpeg"),
                  fit: BoxFit.cover),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: ThemeColor.secondaryRed,
            elevation: 0,
            title: Text(widget.character.title!),
            leading: CloseButton(),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  tag: "image_${widget.character.title}",
                  child: Image(
                    height: MediaQuery.of(context).size.height / 2,
                    image: NetworkImage(widget.character.avatar!),
                  ),
                ),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, widget) => Transform.translate(
                    transformHitTests: false,
                    offset: Offset.lerp(
                        Offset(0.0, 200.0), Offset.zero, _controller.value)!,
                    child: widget,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      widget.character.description!,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
