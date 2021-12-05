# Setup Rclone for GitHub Actions
Setup [Rclone](https://rclone.org) on GitHub Actions to use `rclone`.

This action installs [Rclone](https://rclone.org) for use in actions by installing it on `/usr/local/bin/`.

This action is implemented as a [composite](https://docs.github.com/en/actions/creating-actions/creating-a-composite-action) action.

Other virtual environments besides Ubuntu are not supported yet.

## Usage
To use `rclone`, run this action before `rclone`.

Encode the rclone.conf file in base64 using this command `base64 -w 0 rclone.conf` and paste it to `RCLONE_CONFIG` secret.

Always use single quotes when running `rclone` to prevent the YAML parser from the ambiguity of colon.

```yml
steps:
  - name: Setup Rclone
    uses: AnimMouse/setup-rclone@v1
    with:
      rclone_config: ${{ secrets.RCLONE_CONFIG }}
      
  - run: 'rclone ls copy source:sourcepath dest:destpath'
```