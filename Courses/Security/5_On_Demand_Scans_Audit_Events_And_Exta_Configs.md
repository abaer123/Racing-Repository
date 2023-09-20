# We will wrap up the last few security capabilities that GitLab offers beyond what is possible within our CICD configuration by adding on demand scans, audit events, and further configurations for our scans

## Theme

In case of security risks events these tools are extremely handy at quickly troubleshooting what may be the issue with your application.

* [ ] Step 1: Set Up an On Demand Scan
  * Using the left hand navigation menu click through **Secure > On-demand scans**. We then want to click **New scan**.
  * In the ***Scan configuration*** section add a name and description but leave the rest blank.
  * Next in the ***DAST configuration*** section click **Select scanner profile** twice, give it a name, then save the rest as is and click **Save profile**.
  * We then want to double click **Select site profile**, and under ***Target URL*** enter http://www.example.com/home. It is out of scope to fully deploy out this application therefore the DAST scanner will not run, but think about how you could customize these settings for your own application.
  * Then click **Save profile** and scroll down to **Save scan**.

> [Docs on DAST Scanning](https://docs.gitlab.com/ee/user/application_security/dast/)

* [ ] Step 2: Project Audit Events
  * Using the left hand navigation menu click through **Secure > Audit events** to get the report on all actions taken on the project for the past month. If no events are shown you may need to edit the time frame.
  * You should be able to see some of the actions you have taken and where they occurred in the project hierarchy

* [ ] Step 3: Extra Scanner Configuration
  * Using the left hand navigation menu click through **Secure > Security configuration** to see all of the scans we have enabled. For this exercise we want to click **Configure SAST**
  * Take note of all of the various settings we can change about the scan to better suit our needs. 
  * Most of these settings can also be changed by adding variables to your pipeline, but often it is easier to change from this view.
  * Still within the ***Security Configuration*** settings we want to click the **Vulnerability Management** tab and enable the security training providers. Now our Vulnerability will link out to certain security trainings if they are related to an existing course.
  
* [ ] Step 4: CODEOWNERS
  * Another compliance feature you should take advantage of is the use of the CODEOWNERS file. To do this we will first navigate back to the main page of our project and click **Web IDE**. Once in the IDE create a new file called ***CODEOWNERS***
  * Add the code below to the file. **MAKE SURE YOU REPLACE GITLAB ID WITH YOUR ID**:
    ```
    [Infrastructure]
    *.yml @gitlab_id
    ```
  * Now we want to commit this code to main. Go ahead and click the **Source Control** button on the left hand side, add a commit message then click **Commit & Push**. Next on the resulting dropdown make sure you click commit to main, then on the popup click the **Go to project** button. 
  * Depending on the time your instructor may show you how to open a new mr against the ci yml file, otherwise now if you were to try and edit and file within the project ending in ***.yml*** it would require an approval from the ID you specified in your CODEOWNERS file.

> [Docs for CodeOwners](https://docs.gitlab.com/ee/user/project/code_owners.html)