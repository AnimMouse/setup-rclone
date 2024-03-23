# Setup Rclone for GitHub Actions
Setup [Rclone](https://rclone.org) on GitHub Actions to use `rclone`.

This action installs [Rclone](https://rclone.org) for use in actions by installing it on tool cache using [AnimMouse/tool-cache](https://github.com/AnimMouse/tool-cache).

This action is implemented as a [composite](https://docs.github.com/en/actions/creating-actions/creating-a-composite-action) action.

## Usage
To use `rclone`, run this action before `rclone`.

Encode the rclone.conf file in Base64 using this command `base64 -w 0 rclone.conf` and paste it to `RCLONE_CONFIG` secret.

### Single command
```yaml
steps:
  - name: Setup Rclone
    uses: AnimMouse/setup-rclone@v1
    with:
      rclone_config: ${{ secrets.RCLONE_CONFIG }}
      
  - run: rclone copy source:sourcepath dest:destpath
```
For bare remote, use single quotes to stop the YAML parser from interpreting the remote as a key-value pair.
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
For bare remote in pipes, there is no need to use single quotes as YAML parser does not interpret the remote as a key-value pair.

### Encrypted Rclone config
Paste your Rclone config pass to `RCLONE_CONFIG_PASS` secret.

```yaml
steps:
  - name: Setup Rclone
    uses: AnimMouse/setup-rclone@v1
    with:
      rclone_config: ${{ secrets.RCLONE_CONFIG }}
      
  - run: rclone copy source:sourcepath dest:destpath
    env:
      RCLONE_CONFIG_PASS: ${{ secrets.RCLONE_CONFIG_PASS }}
```

### Config-less operation
You can use Rclone without a config file by using command-line options or environment variables.

```yaml
steps:
  - name: Setup Rclone
    uses: AnimMouse/setup-rclone@v1
    
  - run: 'rclone lsd --http-url https://beta.rclone.org :http:'
    
  - run: 'rclone lsd :http:'
    env:
      RCLONE_HTTP_URL: https://beta.rclone.org
```

### Plain text Rclone config
You can disable Base64 so that you can input the config file in plain text. This allows you to place the config file directly in YAML or get the config file from outputs.

```yaml
steps:
  - name: Setup Rclone
    uses: AnimMouse/setup-rclone@v1
    with:
      rclone_config: |
        [rclone-test-remote]
        type = http
        url = https://beta.rclone.org/test/
      disable_base64: true
      
  - run: 'rclone lsd rclone-test-remote:'
```

### Service account file
To prevent the Rclone config file from becoming too large since you have a lot of remotes that uses the same service account file, use the `AnimMouse/setup-rclone/service-account-file@v1` action to add the service account file inside the Rclone config directory.

Encode the service-account-file.json file in Base64 using this command `base64 -w 0 service-account-file.json` and paste it to `SERVICE_ACCOUNT_FILE` secret. And declare the service account file on the Rclone config like this `service_account_file = $RCLONE_CONFIG_DIR/service-account-file.json`.

```yaml
steps:
  - name: Setup Rclone
    uses: AnimMouse/setup-rclone@v1
    with:
      rclone_config: ${{ secrets.RCLONE_CONFIG }}
      
  - name: Add Rclone service account file
    uses: AnimMouse/setup-rclone/service-account-file@v1
    with:
      service_account_filename: service-account-file.json
      service_account_file: ${{ secrets.SERVICE_ACCOUNT_FILE }}
      
  - run: rclone copy source:sourcepath dest:destpath
```

You can also declare multiple service account files; just run the `AnimMouse/setup-rclone/service-account-file@v1` action multiple times, and use different service account filename and different secret name.

### Update token
Some tokens in Rclone config have expiration, which means they have to be refreshed, or else they will expire and it will not work anymore. To prevent expiration, Rclone automatically refreshes the tokens as needed. To update those tokens in GitHub secrets, use the `AnimMouse/setup-rclone/update-config@v1` action to update the Rclone config.

This requires a fine-grained personal access token that has read and write access to the secrets scope in the current repository to update the secret as the default `GITHUB_TOKEN` does not have access to the secrets scope.

```yaml
steps:
  - name: Setup Rclone
    uses: AnimMouse/setup-rclone@v1
    with:
      rclone_config: ${{ secrets.RCLONE_CONFIG }}
      
  - run: rclone copy source:sourcepath dest:destpath
    
  - name: Update Rclone config
    uses: AnimMouse/setup-rclone/update-config@v1
    with:
      rclone_config_secret_name: RCLONE_CONFIG
      token: ${{ secrets.GH_PAT }}
```

### Specific version
You can specify the version you want. By default, this action downloads the latest version if the version is not specified.

```yaml
steps:
  - name: Setup Rclone
    uses: AnimMouse/setup-rclone@v1
    with:
      rclone_config: ${{ secrets.RCLONE_CONFIG }}
      version: v1.64.0
```

### GitHub token
This action automatically uses a GitHub token in order to authenticate with the GitHub API and avoid rate limiting. You can also specify your own read-only fine-grained personal access token.

```yaml
steps:
  - name: Setup Rclone
    uses: AnimMouse/setup-rclone@v1
    with:
      rclone_config: ${{ secrets.RCLONE_CONFIG }}
      token: ${{ secrets.GH_PAT }}
```

#### Similar actions
1. [NiceLabs/rclone-action](https://github.com/NiceLabs/rclone-action)
2. [wei/rclone](https://github.com/wei/rclone)
3. [andreiio/rclone-action](https://github.com/andreiio/rclone-action)