import 'package:flutter/material.dart';

class SideBarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 100,
            child: DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    child: ClipOval(
                      child: Image.network(
                        'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Positioned(
                        // bottom: 8.0,
                        // left: 4.0,
                        child: Text(
                          "Sakri wassim",
                          style: TextStyle(
                              color: Color.fromARGB(255, 183, 27, 27),
                              fontSize: 20),
                        ),
                      ),
                      Positioned(
                        // bottom: 8.0,
                        // left: 4.0,
                        child: Text(
                          "sakri@gmail.com",
                          style: TextStyle(
                              color: Color.fromARGB(255, 183, 27, 27),
                              fontSize: 15),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            //height: 20,
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text('Friends'),
              onTap: () => null,
            ),
          ),
          ListTile(
            leading: Icon(Icons.event),
            title: Text('Evenements'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text('Favorites'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text('Contacter-nous'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Request'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('aide & FAQs'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Don'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Tontine'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Enquete'),
            onTap: () => null,
          ),
          ListTile(
            title: Text('Se deconnecter'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
