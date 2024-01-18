### We will wrap up the last few security capabilities that GitLab offers beyond what is possible within our CI/CD configuration by adding on demand scans, audit events, and further configurations for our scans

### Theme

In case of security risks events these tools are extremely handy at quickly troubleshooting what may be the issue with your application.

# Step 1: Set Up an On Demand Scan

1. Using the left hand navigation menu click through **Secure > On-demand scans**. We then want to click **New scan**.
  
2. In the ***Scan configuration*** section add a name and description but leave the rest blank.
  
3. Next in the ***DAST configuration*** section click **Select scanner profile** then **New scanner profile**, give it a name, leave the rest as is and click **Save profile**.
  
4. We then want to click **Select site profile** followed by **New site profile**. Give it a name an under ***Target URL*** enter http://www.example.com/home. It is out of scope to fully deploy out this application therefore the DAST scanner will not run, but think about how you could customize these settings for your own application.
  
5. Then click **Save profile** and scroll down to **Save scan**.
  
6. Your presenter can also show you what this scan looks like on a live [Tanuki Racing deployment](https://gitlab.com/gitlab-learn-labs/webinars/tanuki-racing/tanuki-racing-application/-/on_demand_scans#/all)

> [Docs on DAST Scanning](https://docs.gitlab.com/ee/user/application_security/dast/)

# Step 2: Project Audit Events

1. Using the left hand navigation menu click through **Secure > Audit events** to get the report on all actions taken on the project for the past month. If no events are shown you may need to edit the time frame.
  
2. You should be able to see some of the actions you have taken and where they occurred in the project hierarchy

# Step 3: Extra Scanner Configuration

1. Using the left hand navigation menu click through **Secure > Security configuration** to see all of the scans we have enabled. For this exercise we want to click **Configure SAST**
  
2. Take note of all of the various settings we can change about the scan to better suit our needs. 
  
3. Most of these settings can also be changed by adding variables to your pipeline, but often it is easier to change from this view.
  
4. Still within the ***Security Configuration*** settings we want to click the **Vulnerability Management** tab and enable the security training providers. Now our Vulnerability will link out to certain security trainings if they are related to an existing course. **_Please note some of the training courses do require a subscription_**
  
# Step 4: CODEOWNERS

1. Another compliance feature you should take advantage of is the use of the CODEOWNERS file. To do this we will first navigate back to the main page of our project and click **Web IDE**. Once in the IDE create a new file called ***CODEOWNERS***
  
2. Add the code below to the file. **MAKE SURE YOU REPLACE GITLAB ID WITH YOUR ID**:
    ```
    [Infrastructure]
    *.gemspec @gitlab_id
    ```

3. Now we want to commit this code to main. Go ahead and click the **Source Control** button on the left hand side, add a commit message then click **Commit & Push**. Next on the resulting dropdown make sure you click commit to main, then on the popup click the **Go to project** button. 

> [Docs for CodeOwners](https://docs.gitlab.com/ee/user/project/code_owners.html)

# Step 5: License Compliance and Codeowners In Action

1. Now we want to see License Compliance and CODEOWNERS working in action. From the main page of our project lets go ahead and click **Web IDE** in the **Edit** dropdown list.
    
2. Next locate the **tanuki-racing.gemspec** file. On line 22 you can see that there are a number of runtime dependencies listed. Your project manager has expressed interest in using a graph database in the future so you decide to add neo-4j to cehck it out:

    ```
    s.add_runtime_dependency 'neo4j-community', '~> 2.2'
    ```

3. Once added click the source control button on the left hand side, add a quick commit message, then click the **down arrow**.
  
4. On the resulting drop down click **Yes** to open a new branch, then click the **_Enter_** key. A new popup will appear where we want to then click **Create MR**

5. Scroll to the bottom, uncheck **_Delete source branch when merge request is accepted_**, and click **Create merge request**
  
6. On the resulting MR notice that our policy requires approval from **_lfstucker_** and is blocked by our two policies before we are able to merge. Wait for the entire pipeline to finish running.

7. Once done running you can see that our CODEOWNERS protection rule and License Compliance pllicy have been enacted restricting us from committing this code. If we wouldnt have used a blocked license or modified a file protected by CODEOWNERS we now would be able to merge our code.