import 'package:agportfolio/core/controllers/experience_data/create_experience_data_controller.dart';
import 'package:agportfolio/core/controllers/portfolio_data/create_portfolio_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExperienceScreen extends StatelessWidget {
  final CreateExperienceDataController controller = Get.put(CreateExperienceDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experience Data'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextField('position', controller.position),
            buildTextField('location', controller.location),
            buildTextField('duration', controller.duration),
            buildTextField('Company', controller.company),
            buildTextField('companyUrl', controller.companyUrl),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.addExperienceData,
              child: const Text('Submit',),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Add logic to delete a specific document
              },
              child: const Text('Delete'),
            ),
            const SizedBox(height: 20),
            const Text('Experience Items:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            StreamBuilder<QuerySnapshot>(
              stream: controller.fetchExperienceData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Text('No Experience data found.');
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final data = snapshot.data!.docs[index];
                    return ListTile(
                      title: Text(data['position'] ?? ''),
                      subtitle: Text(data['company'] ?? ''),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () =>
                            controller.deleteExperienceData(data.id),
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller,
      {bool isNumber = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter $label',
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget buildSwitch(String label, RxBool value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Obx(() => Switch(
          value: value.value,
          onChanged: (val) => value.value = val,
        )),
      ],
    );
  }
}
