import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rest_api_template/data/data_sources/base_client.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // show response
  void showResponse(BuildContext context, String response) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      // isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Container(
              child: Text(response),
            ),
          ),
        );
      },
    );
  }

  // show snackbar
  void showSnackBar(BuildContext context, String response) {
    if (ScaffoldMessenger.of(context).mounted) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(response),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("REST API TEMPLATE"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            spacing: 16.0,
            children: [
              // get
              SizedBox(
                width: mediaQuery.width,
                height: 40.0,
                child: OutlinedButton(
                  onPressed: () async {
                    var response = await BaseClient().get('/posts').catchError(
                          (error) => log("Error: $error"),
                        );
                    log("Response: $response");

                    if (context.mounted) {
                      showResponse(context, response);
                    }
                  },
                  child: const Text("GET"),
                ),
              ),

              //   post
              SizedBox(
                width: mediaQuery.width,
                height: 40.0,
                child: OutlinedButton(
                  onPressed: () async {
                    var postData = {
                      "title": "annapurna",
                      "body": "annapurna post description",
                      "userId": 1
                    };
                    var response = await BaseClient().post('/posts', postData);

                    log("Response: $response");

                    if (context.mounted) {
                      showSnackBar(context, response);
                    }
                  },
                  child: const Text("POST"),
                ),
              ),

              //   put
              SizedBox(
                width: mediaQuery.width,
                height: 40.0,
                child: OutlinedButton(
                  onPressed: () async {
                    var id = 1;
                    var postData = {
                      "title": "sagarmatha",
                      "body": "sagarmatha post description",
                      "userId": 1
                    };
                    var response =
                        await BaseClient().put('/posts/$id', postData);

                    log("Response: $response");

                    if (context.mounted) {
                      showSnackBar(context, response);
                    }
                  },
                  child: const Text("PUT"),
                ),
              ),

              // delete
              SizedBox(
                width: mediaQuery.width,
                height: 40.0,
                child: OutlinedButton(
                  onPressed: () async {
                    var id = 1;
                    var response = await BaseClient().delete('/posts/$id');

                    log(response);

                    if (context.mounted) {
                      showSnackBar(context, response);
                    }
                  },
                  child: const Text("DELETE"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
