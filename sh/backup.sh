#!/usr/bin/env bash
DESTDIR=/storage/self/primary/backup-tar
tar -cvzf $DESTDIR/Download.tar.gz /storage/self/primary/Download/
tar -cvzf $DESTDIR/Viper4Android.tar.gz /storage/self/primary/Viper4Android/
tar -cvzf $DESTDIR/Ringtone.tar.gz /storage/self/primary/Ringtone/
tar -cvzf $DESTDIR/Notification.tar.gz /storage/self/primary/Notification/
tar -cvzf $DESTDIR/Amazfit_WF.tar.gz /storage/self/primary/Amazfit_WF/
tar -cvzf $DESTDIR/Tasker.tar.gz /storage/self/primary/Tasker/
tar -cvzf $DESTDIR/TitaniumBackup.tar.gz /storage/self/primary/TitaniumBackup/
tar -cvzf $DESTDIR/Autotools.tar.gz /storage/self/primary/Autotools/
tar -cvzf $DESTDIR/data.tar.gz /storage/self/primary/data/
tar -cvzf $DESTDIR/Dream.tar.gz /storage/self/primary/Dream/
tar -cvzf $DESTDIR/Documents.tar.gz /storage/self/primary/Documents/