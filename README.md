# Rsync Scripts

This is a collection of scripts to automate files and directories synchronization between a servers.

## Rsync Dir

Sync a directory on a remote host: the `rsync-dir.sh` script copies all new/updated files found in the given directory (on the remote host) to the destination directory on the local machine.

> IMPORTANT: the script requires `sshpass`. Make sure this module is installed on the local machine which executes the script, or install it with `sudo apt install sshpass`.

> IMPORTANT: the script requires root permissions to run.

### Usage

The path to a `.env` file must be provided to the command:

```bash
./rsync-dir.sh "/path/to/my/.env"
```

The `./env` file contains all required variables to run the script. 
See [.env.reference](.env.reference) for a list of mandatory and available variables.

