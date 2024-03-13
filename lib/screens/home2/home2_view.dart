import 'package:face_id/screens/home2/home2_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../face_id_auth.dart';

class Home2View extends StatelessWidget {
  Home2View({super.key});

  final Home2ViewModel viewModel = Get.put(Home2ViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        children: [
          authStatus(),
          const Divider(),
          Obx(
            () => viewModel.faceAuthSupported.value
                ? IconButton(
                    onPressed: () async {
                      viewModel.authenticated.value =
                          await FaceIdAuth.authenticate();
                    },
                    icon: const Icon(Icons.face_unlock_sharp),
                  )
                : const SizedBox(),
          ),
          IconButton(
            onPressed: () async {
              viewModel.authenticated.value =
              await FaceIdAuth.authenticate();
            },
            icon: const Icon(Icons.login),
          ),
          const Divider(),
          // Obx(
          //   () => viewModel.authenticated.value
          //       ? TextButton(
          //           onPressed: () {
          //             viewModel.authenticated.value = false;
          //           },
          //           child: const Text('Logout'),
          //         )
          //       : const SizedBox(),
          // )
        ],
      ),
    );
  }

  Widget authStatus() {
    return Obx(
      () => Text(
        viewModel.authenticated.value ? 'Authenticated' : 'Not Authenticated',
      ),
    );
  }
}
