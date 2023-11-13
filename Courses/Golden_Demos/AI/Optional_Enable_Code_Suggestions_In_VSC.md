You can also find a blog about other supported [Web IDE's here](https://about.gitlab.com/blog/2023/06/01/extending-code-suggestions/)

* [ ] Step 1: Connecting VSC
  * Make sure you have VSC installed on your device, if you dont you can download it [here](https://code.visualstudio.com/Download)
  * First we want to make sure that we have our project ready to go on VSC. Navigate to the home page of our **_workshop-project_** and click the **clone** button. We then want to copy the whole URL in the **_Clone with HTTPS_** option.
  * Next navigate to your VSC instance and on the left hand navigation menu click the **Extensions** button. Once there we want to put 'GitLab Workflow' in the search bar and install.
  * Once installed and enabled click the settings icon then click **Extension settings**. On the resulting page at the top of the settings click the checkbox next to **Enable code completion**
* [ ] Step 2: Authenticating With GitLab

  **OAuth Method (recommended)**
  * Still on VSC we want to add our GitLab account. Even if you have done this before make sure you reset access as some settings have changed:
    - In macOS, press Shift + Command + P.
    - In Windows, press Shift + Control + P.
  * We then want to input **_'GitLab: Authenticate with GitLab.com'_**, click the quick action with the same name, and follow the alert links to open the auth portal for gitlab.com.
  * Once authed, there should be an alert that will bring you back to VSC. At this point you should be ready to go and not need to attempt the personal access token method.

  **Personal Access Token Method**
  * Navigate to your gitlab.com view, then click your accounts icon in the top right. On the resulting dropdown click **Preferences**.
  * We then want to use the left hand navigation menu to click **Access Tokens**. Once on the **_Personal Access Tokens_** page we will want to name our token VSC, give it an expiration date (we suggest at least 30 days), then select all scopes.
  * With all of the settings set we will click **Create personal access token** and then copy the token locally as we will need to use it later in the workshop.
  * We then want to add our GitLab account to VSC. Even if you have done this before make sure you reset the token as some settings have changed:
    - In macOS, press Shift + Command + P.
    - In Windows, press Shift + Control + P.
  * Next type **'GitLab: Add Account to VS Code'** and click the quick action with the same name.
  * We then want to input 'https://gitlab.com/', then provide your personal access token that we got earlier.

You should now start seeing code suggestions pop up in VSC, same as you do in the Web IDE. If you want to use other editors such as JetBrains IDEs, Neovim, and more check out our docs [here](https://docs.gitlab.com/ee/user/project/repository/code_suggestions/#supported-editor-extensions).