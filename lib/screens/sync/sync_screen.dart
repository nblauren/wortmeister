import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wortmeister/core/services/locator_service.dart';

class SyncNotifier extends ChangeNotifier {
  DateTime? _lastSyncTime;

  SyncNotifier() {
    _initializeLastSyncTime();
  }

  DateTime? get lastSyncTime => _lastSyncTime;

  bool isFullsyncing = false;
  bool isDeletingLocalData = false;
  bool isResetingSrs = false;

  Future<void> _initializeLastSyncTime() async {
    _lastSyncTime = await LocatorService.syncService.getLastSyncTime();
    notifyListeners();
  }

  Future<void> sync() async {
    isFullsyncing = true;
    notifyListeners();
    await LocatorService.syncService.fullSync();
    _lastSyncTime = await LocatorService.syncService.getLastSyncTime();
    isFullsyncing = false;
    notifyListeners();
  }

  Future<void> deleteLocalData() async {
    isDeletingLocalData = true;
    notifyListeners();
    await LocatorService.isarService.clearAllData();
    isDeletingLocalData = false;
    notifyListeners();
  }

  Future<void> resetSrs() async {
    isResetingSrs = true;
    notifyListeners();
    await LocatorService.syncService.resetSrs();
    isResetingSrs = false;
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
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 15,
              children: [
                Consumer<SyncNotifier>(
                  builder: (_, syncNotifier, __) {
                    return ElevatedButton(
                      onPressed: () async {
                        await syncNotifier.sync();
                      },
                      child: syncNotifier.isFullsyncing
                          ? CircularProgressIndicator()
                          : const Text('Sync'),
                    );
                  },
                ),
                Consumer<SyncNotifier>(
                  builder: (_, syncNotifier, __) {
                    return ElevatedButton(
                      onPressed: () async {
                        await syncNotifier.deleteLocalData();
                      },
                      child: syncNotifier.isDeletingLocalData
                          ? CircularProgressIndicator()
                          : const Text('Delete Local Data'),
                    );
                  },
                ),
                Consumer<SyncNotifier>(
                  builder: (_, syncNotifier, __) {
                    return ElevatedButton(
                      onPressed: () async {
                        await syncNotifier.clearSyncTime();
                      },
                      child: const Text('Clear Sync Time'),
                    );
                  },
                ),
                Consumer<SyncNotifier>(
                  builder: (_, syncNotifier, __) {
                    return ElevatedButton(
                      onPressed: () async {
                        await syncNotifier.resetSrs();
                      },
                      child: syncNotifier.isResetingSrs
                          ? CircularProgressIndicator()
                          : const Text('Reset SRS'),
                    );
                  },
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
      ),
    );
  }
}
