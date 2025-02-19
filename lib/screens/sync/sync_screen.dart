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
          title: Text('Sync Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await context.read<SyncNotifier>().sync();
                },
                child: Text('Sync'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await context.read<SyncNotifier>().deleteLocalData();
                },
                child: Text('Delete Local Data'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await context.read<SyncNotifier>().clearSyncTime();
                },
                child: Text('Clear Sync Time'),
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
