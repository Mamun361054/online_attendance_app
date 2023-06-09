import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_attendance_app/presentation/attendance/attendance_page.dart';
import '../../dependency_injection.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(storeNotifierProvider);
    final controller = ref.read(storeNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: const Color(0xFF294677),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF294677),
              Color(0xFF0E4FCE),
            ]),
          ),
        ),
        title: const Text('Stores'),
        centerTitle: true,
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                controller: controller.controller,
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                itemCount: state.stores.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AttendancePage(
                                store: state.stores.elementAt(index))));
                      },
                      title: Text(state.stores.elementAt(index).name),
                      subtitle: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(state.stores.elementAt(index).address),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
