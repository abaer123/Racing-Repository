# Based off an issue, make changes to the code base and commit

## Theme

Git repository and Merge Requests

## Key Tasks to Complete


* [ ] Issue Summary
  * The next part of our workshop will be back in the tanuki racing procject we originially imported. Use the breadcrumbs to get back to your group view and click into the project.
  * Use the lefthand navigation menu to click into **Plan>Issues**
  * Open issue Update-Pipeline
  * You should have an option to click a **View summary** which will provide a concise summary of your issue so far. As your issues grow and more comments are made this feature will always be a great tool for statying up to date with your issues.
* [ ] Create Merge Request from Issue
  * Click **Create Merge Request**
  * Note the new branch
  * Note the the link to the issue
  * Note automatic Merge Request details, like Assignee & Milestone
  * Note history of Merge Request
  * Scroll down and click **Create merge request**
* [ ] Modify The Pipeline
  * First click **Code**, then click **Open in Web IDE**
  * Click on the _.gitlab-ci.yml_ file and add the code below to the end of the file:

    ```
    after_script:
      - echo "testing is done!"
    ```

  * Click the source control icon on the left hand side navigation menu
  * Add a commit message and then click **Commit & Push**. It will then ask if you want to commit to main and you want to click **No**. 
  * Once committed a popup will appear for you to click **Go to project**.
* [ ] Prepare for Review
  * Use the left hand navigation menu to click into **Merge Requests** and then click into your existing merge request.
  * Click on **Commits** to see the commit history
  * Click **Changes** to see the code diff
  * click the three dots in the top right, then click **View summary notes**. This new AI feature will then give a qucik sumamry on all of the changes that are involved in this MR.
  * Click **Overview** and click the **Mark as ready** button to signify the change is ready for review
  * In the **Reviewers** section in the right panel, click **Edit** and assign yourself (click away to save)
  * Once the pipeline has ran click into the pipeline and then click on our test job. At the end of this job we should see the text output from out _after_script_ code addition.

> [Docs on Merge Requests](https://docs.gitlab.com/ee/user/project/merge_requests/)

* [ ] Review & Merge Changes
  * Acting as the reviewer, add a comment to the Merge Request to signify your approval of the change
  * Click **Merge**
* [ ] Finish Changes
  * We have confirmed that our pipeline change was added, so now lets go ahead and close the relevant issue.
  * Navigate to **Issues**>**Boards** to see the issue is now closed
  * Click on the issue to see the Merge Request history captured in the issue
