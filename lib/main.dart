import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class CardData {
  final String name;
  final String title;
  final String imagePath;
  final String backgroundImagePath;
  final int popularity;
  final int likes;
  final int followed;
  final int ranking;

  CardData({
    required this.name,
    required this.title,
    required this.imagePath,
    required this.backgroundImagePath,
    required this.popularity,
    required this.likes,
    required this.followed,
    required this.ranking,
  });
}

class MyApp extends StatelessWidget {
  final List<CardData> cardDataList = [
    CardData(
      name: 'David Borg',
      title: 'Title: Flying wings',
      imagePath: 'assets/images/Flutter img 1.jpg',
      backgroundImagePath: 'assets/images/Flutter img 6.png',
      popularity: 2342,
      likes: 4736,
      followed: 136,
      ranking: 1,
    ),
    CardData(
      name: 'Lucy',
      title: 'Growing up trouble',
      imagePath: 'assets/images/Flutter img 2.jpg',
      backgroundImagePath: 'assets/images/Flutter img 7.png',
      popularity: 2342,
      likes: 4736,
      followed: 136,
      ranking: 2,
    ),
    CardData(
      name: 'Kayle, The Righteous',
      title: 'Why have we wings, sister, if not to fly?',
      imagePath: 'assets/images/Flutter img 3.jpeg',
      backgroundImagePath: 'assets/images/Flutter img 8.png',
      popularity: 2342,
      likes: 4736,
      followed: 136,
      ranking: 3,
    ),
    CardData(
      name: 'Morgana, The Fallen',
      title: 'Why do we have feet if not to tread upon the soil',
      imagePath: 'assets/images/Flutter img 4.jpeg',
      backgroundImagePath: 'assets/images/Flutter img 9.png',
      popularity: 2342,
      likes: 4736,
      followed: 136,
      ranking: 4,
    ),
    CardData(
      name: 'The Emperor of the Universe, Lord Frieza',
      title: 'Miserable Saiyan monkey',
      imagePath: 'assets/images/Flutter img 5.jpg',
      backgroundImagePath: 'assets/images/Flutter img 10.png',
      popularity: 2342,
      likes: 4736,
      followed: 136,
      ranking: 5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // Acción al presionar la flecha hacia atrás
              },
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  // Acción al presionar las tres barritas
                },
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: Row(
                children: [
                  SizedBox(width: 50.0),
                  Expanded(
                    child: TabBar(
                      labelStyle: TextStyle(fontSize: 20.0),
                      tabs: [
                        Tab(text: 'Designer'),
                        Tab(text: 'Category'),
                        Tab(text: 'Attention'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                itemCount: cardDataList.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildCard(cardDataList[index]);
                },
              ),
              // Contenido de las otras pestañas
              Container(),
              Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(CardData cardData) {
    return Container(
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8.0,
            spreadRadius: 2.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Card(
        margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color: Colors.purple,
        child: ClipRRect(
          // ClipRRect to apply rounded corners to the image
          borderRadius: BorderRadius.circular(25.0),
          child: Stack(
            children: [
              // Fondo con la imagen 'Flutter img6.png'
              Positioned.fill(
                child: Image.asset(
                  cardData.backgroundImagePath,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(cardData.imagePath),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            cardData.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            cardData.title,
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              _buildIconWithLabel(
                                Icons.favorite,
                                cardData.likes.toString(),
                              ),
                              SizedBox(width: 10),
                              _buildIconWithLabel(
                                Icons.star,
                                cardData.popularity.toString(),
                              ),
                              SizedBox(width: 10),
                              _buildIconWithLabel(
                                Icons.person,
                                cardData.followed.toString(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15.0),
                    Stack(
                      children: [
                        Positioned(
                          top: 0,
                          right: 0,
                          child: ClipPath(
                            clipper: DolphinClipper(),
                            child: Container(
                              width: 80,
                              height: 80,
                              color: Colors.purple.shade200,
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Image.asset(
                                  cardData.imagePath,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                _buildCircle(color: Colors.white),
                                SizedBox(width: 5),
                                _buildCircle(color: Colors.white),
                                SizedBox(width: 5),
                                _buildCircle(color: Colors.white),
                              ],
                            ),
                            SizedBox(height: 30),
                            Text(
                              cardData.ranking.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Ranking',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircle({required Color color}) {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildIconWithLabel(IconData icon, String label) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 18.0,
        ),
        SizedBox(width: 5),
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

class DolphinClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.arcToPoint(
      Offset(0, 0),
      radius: Radius.circular(size.height),
      clockwise: false,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
