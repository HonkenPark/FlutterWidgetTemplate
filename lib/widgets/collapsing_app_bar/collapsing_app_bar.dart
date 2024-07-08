import 'package:flutter/material.dart';

class CollapsingAppbar extends StatelessWidget {
  const CollapsingAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.longestSide / 9,
            floating: false,
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                collapseMode: CollapseMode.parallax,
                title: const Text(
                  "Collabsed App Bar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                background: Image.network(
                  // "https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                  "https://images.unsplash.com/photo-1718095581132-0c0559e2ccdf?q=80&w=2370&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  fit: BoxFit.cover,
                )),
          ),
        ];
      },
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("Item $index", textAlign: TextAlign.center));
        },
      ),
    );
  }
}
