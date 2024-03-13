import 'package:face_id/screens/autofill/autofill_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AutoFillView extends StatelessWidget {
  AutoFillView({super.key});

  final AutoFillViewModel viewModel = Get.put(AutoFillViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Auto Fill')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: AutofillGroup(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: 'Email'),
                controller: viewModel.emailTxtField,
                autofillHints: const [AutofillHints.email],
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Password'),
                controller: viewModel.passwordTxtField,
                autofillHints: const [AutofillHints.password],
                // onEditingComplete: (){
                //
                // },
              ),
              ElevatedButton(
                onPressed: () {
                    TextInput.finishAutofillContext();
                    // Submit form
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
