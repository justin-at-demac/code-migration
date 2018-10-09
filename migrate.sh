#!/bin/sh
src="$1"
dst="$2"
m1="$3"
m2="$4"

#migration
php bin/migrate.php migrateModuleStructure $src $dst
php bin/migrate.php convertLayout $dst
php bin/migrate.php convertConfig $dst
php bin/migrate.php convertPhpCode $dst $m1 $m2

#cleanup
find $dst -name "*.php" -type f -delete
find . -name "*.php.converted" -exec bash -c 'mv "$1" "${1%.php.converted}".php' - '{}' \;
