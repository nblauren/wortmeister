import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wortmeister/core/services/locator_service.dart';

class SyncNotifier extends ChangeNotifier {
  DateTime? _lastSyncTime;

  SyncNotifier() {
    _initializeLastSyncTime();
  }

  DateTime? get lastSyncTime => _lastSyncTime;

  Future<void> _initializeLastSyncTime() async {
    _lastSyncTime = await LocatorService.syncService.getLastSyncTime();
    notifyListeners();
  }

  Future<void> sync() async {
    await LocatorService.syncService.fullSync();
    _lastSyncTime = await LocatorService.syncService.getLastSyncTime();
    notifyListeners();
  }

  Future<void> deleteLocalData() async {
    await LocatorService.isarService.clearAllData();
    notifyListeners();
  }

  Future<void> clearSyncTime() async {
    await LocatorService.syncService.removeLastSyncTime();
    _lastSyncTime = null;
    notifyListeners();
  }
}

class SyncScreen extends StatelessWidget {
  const SyncScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SyncNotifier(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sync Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.vertical,
            spacing: 15,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await context.read<SyncNotifier>().sync();
                },
                child: const Text('Sync'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await context.read<SyncNotifier>().deleteLocalData();
                },
                child: const Text('Delete Local Data'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await context.read<SyncNotifier>().clearSyncTime();
                },
                child: const Text('Clear Sync Time'),
              ),
              Consumer<SyncNotifier>(
                builder: (context, syncNotifier, child) {
                  return Text(
                    syncNotifier.lastSyncTime != null
                        ? 'Last Sync Time: ${syncNotifier.lastSyncTime}'
                        : 'No Sync Time Available',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
