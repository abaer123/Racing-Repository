## Based off an issue, make changes to the code base and commit

### Theme

Git repository and Merge Requests

### Key Tasks to Complete

# Step 1: Issue Summary

1. The next part of our workshop will be back in the tanuki racing project we originally imported. Use the breadcrumbs to get back to your group view and click into the project.
  
2. Use the left hand navigation menu to click into **Plan>Issues**
  
3. Open issue Update-Pipeline

4. Scroll to the bottom and add a quick comment saying "Checking this issue out", then click **comment**
  
4. You should have an option to click a **View summary** which will provide a concise summary of your issue so far. As your issues grow and more comments are made this feature will always be a great tool for staying up to date with your issues.

# Step 2: Create Merge Request from Issue

1. Click **Create Merge Request**

2. Uncheck _Mark as draft_
  
3. Note the new branch
  
4. Note the the link to the issue
  
5. Note automatic Merge Request details, like Assignee & Milestone
  
6. Note history of Merge Request
  
7. Scroll down and click **Create merge request**

# Step 3: Modify The Pipeline

1. First click **Code**, then click **Open in Web IDE**
  
2. Click on the _.gitlab-ci.yml_ file and add the code below to the end of the file:

    ```
    after_script:
      - echo "testing is done!"
    ```

3. Click the source control icon on the left hand side navigation menu
  
4. Add a commit message and then click **Commit to ...**.

5. Once committed a popup will appear for you to click **Go to MR**.

# Step 4: Prepare for Review

1. Use the left hand navigation menu to navigate to **Code**>**Merge requests** and then click into your existing merge request.
  
2. Click on **Commits** to see the commit history
  
3. Click **Changes** to see the code diff
  
4. click the three dots in the top right, then click **View summary notes**. This new AI feature will then give a quick summary on all of the changes that are involved in this MR.
  
5. In the **Reviewers** section in the right panel, click **Edit** and assign yourself (click away to save)
  
6. Once the pipeline has ran click into the pipeline and then click on our test job. At the end of this job we should see the text output from out _after_script_ code addition.

> [Docs on Merge Requests](https://docs.gitlab.com/ee/user/project/merge_requests/)

# Step 5: Review & Merge Changes

1. Acting as the reviewer, add a comment to the Merge Request to signify your approval of the change
  
2. Click **Merge**

# Step 6: Finish Changes

1. We have confirmed that our pipeline change was added, so now lets go ahead and close the relevant issue.
  
2. Navigate to **Plan**>**Issue boards** to see the issue is now closed
  
3. Click on the issue to see the Merge Request history captured in the issue
