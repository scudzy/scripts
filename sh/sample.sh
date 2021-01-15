#!/bin/bash
# backup_dirs_to_tars.sh - back up directories in $backupdir to 
# individual tars in $outputdir
# NB ignores .hidden (dotted) directories

backupdir=/var/www/
outputdir=/storage/self/primary/backup-tar

cd $backupdir

for dir in */; do
        tar -cvzf "$outputdir/$(basename $dir).tar.gz" "$dir"
done