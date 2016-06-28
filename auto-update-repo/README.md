### Using this script

Add `update-repo.sh` script to your `crontab`, like this:
```shell
  ./update-repo.sh --user someuser --password somepassword --write-crontab
```

This will add a `crontab` entry for the script to execute every five minutes. In case you're not using `crontab` or you want to change the execution frequency you can always add it manually.
