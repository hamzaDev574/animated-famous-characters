import 'package:cartoon_app/character%20detail/screens/characterdetail_screen.dart';
import 'package:cartoon_app/common/model/app_data.dart';
import 'package:flutter/material.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);
  static const routeName = '/CharacterScreen';

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: const Text('Cartoon App',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        actions: const [
          Icon(
            Icons.search,
            color: Colors.black,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                    text: 'Famous Cartoons\n',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black)),
                TextSpan(
                    text: 'Characters',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500))
              ]))
            ],
          ),
          AspectRatio(
              aspectRatio: 2 / 2,
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cartoondata.length,
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, CharacterDetailScreen.routeName,arguments: {
                          'cartoon':cartoondata[index],
                        });
                      },
                      child: Stack(children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: ClipPath(
                            clipper: Clip1Clipper(),
                            child: Hero(
                              tag: "background-${cartoondata[index].name}",
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  color: cartoondata[index].color,
                                ),
                                width: 300,
                                height: 350,
                                margin: const EdgeInsets.symmetric(horizontal: 30),
                              
                              ),
                            ),
                          ),
                        ),
                      
                           Hero(
                            tag: "image-${cartoondata[index].name}",
                             child: Align(
                             alignment: Alignment.topCenter,
                              child: cartoondata[index].image),
                           ),
                    
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Padding(padding: EdgeInsets.symmetric(horizontal:130,)),
                              Hero(
                                tag: "name-${cartoondata[index].name}",
                                child: Text(cartoondata[index].name,style: const TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),)),
                              const Text('tap to read more',style: TextStyle(color: Colors.white),),
                            ],)
                    
                                       
                      ]),
                    );
                  })))
        ],
      ),
    );
  }
}

class Clip1Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    // path.quadraticBezierTo(size.height, 0, 0, 0);

    path.moveTo(0, size.height * 0.45);

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
