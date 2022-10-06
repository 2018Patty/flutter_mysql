import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  const UserList({Key key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final List attractions = [
    {
      'name': 'Arc de Triomphe',
      'address': 'Place Charles de Gaulle, Paris, France',
      'info':
          'The Arc de Triomphe  is one of the most famous monuments in Paris, France, standing at the western end of the Champs-Élysées at the centre of Place Charles de Gaulle.'
    },
    {
      'name': 'Louvre Museum',
      'address': 'Place Charles de Gaulle, Paris, France',
      'info':
          'The Arc de Triomphe  is one of the most famous monuments in Paris, France, standing at the western end of the Champs-Élysées at the centre of Place Charles de Gaulle.'
    },
    {
      'name': 'Versailles',
      'address': 'Place Charles de Gaulle, Paris, France',
      'info':
          'The Arc de Triomphe  is one of the most famous monuments  in Paris, France, standing at the western end of the Champs-Élysées at the centre of Place Charles de Gaulle.'
    }
  ];

  final List member = [
    {
      "name": "Ram",
      "email": "Ram@gmail.com",
      "picture": "https://randomuser.me/api/portraits/thumb/women/71.jpg"
    },
    {
      "name": "Bob",
      "email": "bob32@gmail.com",
      "picture": "https://randomuser.me/api/portraits/thumb/men/91.jpg"
    },
    {
      "name": "Shyam",
      "email": "shyamjaiswal@gmail.com",
      "picture": "https://randomuser.me/api/portraits/thumb/men/14.jpg"
    },
    {
      "name": "Bob",
      "email": "bob32@gmail.com",
      "picture": "https://randomuser.me/api/portraits/thumb/men/39.jpg"
    },
    {
      "name": "Jai",
      "email": "jai87@gmail.com",
      "picture": "https://randomuser.me/api/portraits/thumb/men/69.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attractions'),
      ),
      // body: UserCard(
      //   attraction: attractions[0],
      // ),
      // body: ListView.builder(
      //     itemCount: member.length,
      //     itemBuilder: (context, index) {
      //       return UserCard(member: member[index]);
      //     }),
      body: ListView.builder(
          itemCount: attractions.length,
          itemBuilder: (context, index) {
            return AttractionCard(attraction: attractions[index]);
          }),
    );
  }
}

class AttractionCard extends StatelessWidget {
  final attraction;
  const AttractionCard({
    Key key,
    this.attraction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
      // child: Center(child: Text(attraction['name'])),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'images/paris.jpg',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(attraction['name'],
                            style: Theme.of(context).textTheme.headline1),
                        // Text('Arc de Triomphe',
                        //     style: Theme.of(context).textTheme.headline1),
                        Text(attraction['address'],
                            style: Theme.of(context).textTheme.bodyText2),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Time: 8.00-17.00',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            attraction['info'],
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final member;
  const UserCard({
    Key key,
    this.member,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
      // child: Center(child: Text(attraction['name'])),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    member['picture'],
                    width: 60,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(member['name'],
                        style: Theme.of(context).textTheme.headline1),
                    // Text('Arc de Triomphe',
                    //     style: Theme.of(context).textTheme.headline1),
                    Text(member['email'],
                        style: Theme.of(context).textTheme.bodyText2),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
