import 'package:agportfolio/core/controllers/portfolio_data/create_portfolio_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PortfolioScreen extends StatelessWidget {
  final PortfolioControllerCreate controller = Get.put(PortfolioControllerCreate());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio Data'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextField('Title', controller.titleController),
            buildTextField('Image URL', controller.imageController),
            buildTextField('Cover Image URL', controller.coverImageController),
            buildTextField('Image Size', controller.imageSizeController, isNumber: true),
            buildTextField('Subtitle', controller.subtitleController),
            buildTextField('Portfolio Description', controller.portfolioDescriptionController),
            buildTextField('Technology Used', controller.technologyUsedController),
            buildTextField('GitHub URL', controller.gitHubUrlController),
            buildTextField('Play Store URL', controller.playStoreUrlController),
            buildTextField('Web URL', controller.webUrlController),
            buildSwitch('Is Public', controller.isPublic),
            buildSwitch('Is On Play Store', controller.isOnPlayStore),
            buildSwitch('Is Live', controller.isLive),
            buildSwitch('Has Been Released', controller.hasBeenReleased),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.addPortfolioData,
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
            const Text('Portfolio Items:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            StreamBuilder<QuerySnapshot>(
              stream: controller.fetchPortfolioData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Text('No portfolio data found.');
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final data = snapshot.data!.docs[index];
                    return ListTile(
                      title: Text(data['title'] ?? ''),
                      subtitle: Text(data['subtitle'] ?? ''),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () =>
                            controller.deletePortfolioData(data.id),
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
