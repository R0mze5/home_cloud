# Manual configuration for nextcloud

[<-- go back](../README.md)

nextcloud ports:
443
80
22 - ssh
19999 - monitoring

onlyoffice ports:
443
80
22 - ssh

copy to `nextcloud/.htaccess`

```htaccess
php_value memory_limit 2G
php_value upload_max_filesize 16G
```

add to `nextcloud/config/config.php` home network:

```php
  'trusted_domains' => 
  [
    '192.168.3.*'
  ],
```
