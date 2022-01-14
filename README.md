# Setup Rclone for GitHub Actions
Setup [Rclone](https://rclone.org) on GitHub Actions to use `rclone`.

This action installs [Rclone](https://rclone.org) for use in actions by installing it on tool cache using [AnimMouse/tool-cache](https://github.com/AnimMouse/tool-cache).

This action is implemented as a [composite](https://docs.github.com/en/actions/creating-actions/creating-a-composite-action) action.

## Usage
To use `rclone`, run this action before `rclone`.

Encode the rclone.conf file in base64 using this command `base64 -w 0 rclone.conf` and paste it to `RCLONE_CONFIG` secret.

### Single command
```yaml
steps:
  - name: Setup Rclone
    uses: AnimMouse/setup-rclone@v1
    with:
      rclone_config: ${{ secrets.RCLONE_CONFIG }}
      
  - run: rclone copy source:sourcepath dest:destpath
```
For bare remote with exposed colon, use single quotes to prevent the YAML parser from the ambiguity of colon.
```yaml
steps:
  - name: Setup Rclone
    uses: AnimMouse/setup-rclone@v1
    with:
      rclone_config: ${{ secrets.RCLONE_CONFIG }}
      
  - run: 'rclone copy source: dest:'
```

### Multiple commands
```yaml
steps:
  - name: Setup Rclone
    uses: AnimMouse/setup-rclone@v1
    with:
      rclone_config: ${{ secrets.RCLONE_CONFIG }}
      
  - run: |
      rclone copy source:sourcepath dest:destpath
      rclone copy source: dest:
```
For bare remote with exposed colon, no need to use single quotes.

### Encrypted rclone config
Paste your Rclone config pass to `RCLONE_CONFIG_PASS` secret.

```yaml
steps:
  - name: Setup Rclone
    uses: AnimMouse/setup-rclone@v1
    with:
      rclone_config: ${{ secrets.RCLONE_CONFIG }}
      
  - env:
      RCLONE_CONFIG_PASS: ${{ secrets.RCLONE_CONFIG_PASS }}
    run: 'rclone copy source1:sourcepath1 dest1:destpath1'
```

#### Similar actions
1. [NiceLabs/rclone-action](https://github.com/NiceLabs/rclone-action)
2. [wei/rclone](https://github.com/wei/rclone)
3. [andreiio/rclone-action](https://github.com/andreiio/rclone-action)