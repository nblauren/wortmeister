import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wortmeister/core/services/locator_service.dart';

class SyncProvider with ChangeNotifier {
  bool _isSyncing = false;

  bool get isSyncing => _isSyncing;

  Future<void> startSync() async {
    _isSyncing = true;
    notifyListeners();

    await LocatorService.syncService.fullSync();

    _isSyncing = false;
    notifyListeners();
  }
}

class SyncButton extends StatelessWidget {
  const SyncButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SyncProvider(),
      child: Consumer<SyncProvider>(
        builder: (context, syncProvider, child) {
          return FloatingActionButton(
            onPressed:
                syncProvider.isSyncing ? null : () => syncProvider.startSync(),
            child: syncProvider.isSyncing
                ? SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(),
                  )
                : Icon(Icons.sync),
          );
        },
      ),
    );
  }
}
