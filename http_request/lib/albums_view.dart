import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_request/models/album_model.dart';
// as
// show
// hide
// export

class AlbumsView extends StatefulWidget {
  const AlbumsView({Key? key}) : super(key: key);

  @override
  _AlbumsViewState createState() => _AlbumsViewState();
}

class _AlbumsViewState extends State<AlbumsView> {
  late Future<List<Album>> _listofAlbum;
  Future<List<Album>> fetchAlbum() async {
    List<Album> _listofAlbum = [];
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    if (response.statusCode == 200) {
      var mapData = json.decode(response.body);
      _listofAlbum =
          mapData.map<Album>((e) => Album.fromJson(e)).toList() as List<Album>;
      await Future.delayed(const Duration(milliseconds: 25000));
      return _listofAlbum;
    } else {
      throw "error";
    }
  }

  @override
  void initState() {
    _listofAlbum = fetchAlbum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FUture with "),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _listofAlbum = fetchAlbum();
          setState(() {});
        },
        child: const Icon(Icons.read_more),
      ),
      body: FutureBuilder(
          future: _listofAlbum,
          builder: (context, AsyncSnapshot<List<Album>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, int index) => ListTile(
                          title: Text("${snapshot.data![index].userId}"),
                          subtitle: Text(snapshot.data![index].title),
                        ));
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
