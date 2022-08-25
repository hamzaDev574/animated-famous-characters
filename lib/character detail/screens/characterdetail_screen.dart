import 'package:cartoon_app/common/model/app_data.dart';
import 'package:flutter/material.dart';

class CharacterDetailScreen extends StatefulWidget {
  const CharacterDetailScreen({Key? key, required this.cartoon})
      : super(key: key);
  static const routeName = '/CharacterDetailScreen';
  final Cartoons cartoon;
  @override
  State<CharacterDetailScreen> createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        Hero(
          tag: "background-${widget.cartoon.name}",
          
          child: DecoratedBox(decoration: BoxDecoration(color: widget.cartoon.color))),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 12),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.white.withOpacity(0.9),
                  iconSize: 40,
                  icon: const Icon(Icons.close),
                ),
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Hero(
                    tag: "image-${widget.cartoon.name}",
                    child: SizedBox(
                      child: widget.cartoon.image,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 32),
                child: Hero(
                tag: "name-${widget.cartoon.name}",
                  child: Text(
                    widget.cartoon.name,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.9)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 8, 16),
                child: Text(
                  widget.cartoon.description,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontWeight: FontWeight.w500,fontSize: 15),
                      
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
