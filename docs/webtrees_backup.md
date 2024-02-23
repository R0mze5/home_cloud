# Backup and restore

## Backup

Backups are good. Whatever problem you have, it can always be fixed from a good
backup.

To make a backup of **webtrees**, you need to make a copy of the following

1. The files in the *webtrees/data* folder.
2. The tables in the database. Freely available tools such as
   [phpMyAdmin](https://www.phpmyadmin.net) allow you to do this in one click. Alternatively, You can also make a backup running a mysqldump command (just replace the words *[localhost]*, *[username]*, *[password]* and *[databasename]* with your own):

    `mysqldump --host=[localhost] -u [username] -p[password] --databases [databasename] > dump_file.sql`

    Note that '*-p[password]*' goes together with no space in between.

Remember that most web hosting services do NOT backup your data, and this is
your responsibility.

## Restore from backup

To restore a backup on a new server:

1. Follow the steps in [Installation](#installation) to get a clean new installation.

2. Replace the *data* folder with backup copy.

3. Restore your mysql database using phpmyadmin or running the following command line on your database server using your mysqldumpfile (just replace the words *[username]*, *[password]* and *[databasename]* with your own):

    `mysql -u [username] -p[password] [database_name] < [dump_file.sql]`

4. Confirm the file *data/config.ini.php* contains to correct information to connect to the database and update it if needed.
