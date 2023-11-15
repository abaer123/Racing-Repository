## Theme

Take a deeper dive into how GitLab enables you through shifting left and the various security reports that are all provided.

## Key Tasks to Complete

* [ ] Step 1: Merge Request Security Results
  * Right below the approvals section we can see that our  ***Code Quality, License Compliance, & Security scanning*** templates we included have generated full security reports unique to this branch for us to view. These reports are generated with each commit so we always know if we have introduced a new bug before its deployed out and disaster strikes.
  * Go ahead and take some time to expand each report and look through the results, then in the ***Security scanning*** section click on any of the critical/high vulnerabilities.
  * From this view we can see exactly where it occurred in the code & read up on why its a risk. After taking a look at this we can click the comment icon at the bottom to state that we checked it out and are not worried, then click **Add comment & dismiss**.
  * Next we will want to scroll down and merge our code. At the bottom of the request click **Merge** to kick off our pipeline. 
  * Once merged use the left hand navigation menu to click through **CICD > Pipelines** and click into the most recently kicked off pipeline. At this point your instructor will move onto the next section with a project that already has the code merged.
 
* [ ] Step 2: Merge Request Security Results
  * Now that your ***main*** pipeline has completed the reports under ***Security & Compliance*** have been generated. These reports will only be generated if you run a pipeline against main.
  * Use the left hand navigation menu to click through **Security & Compliance -> Security Dashboard**. This will bring up a dashboard view of all of the security vulnerabilities & their counts over time so you can track your work as you secure your project. This dashboard takes a long time to collect data so if yours still has no results check out gitlab.com's security dashboard [here](https://gitlab.com/gitlab-org/gitlab/-/security/dashboard)
  * We have already seen how to view the vulnerabilities in the pipeline view, but now lets use the left hand navigation menu and click through **Security & Compliance -> Vulnerability Report** to view the full report
  * We are back at the ***Vulnerability Report*** where we want to click into any of the critical vulnerabilities present.
  * Here we get more details on where the flaw may have occurred and how to create a new bug issue to get this quickly resolved.

* [ ] Step 3: Review & Download SBOM report
  * Using the left hand navigation menu click through **Security & Compliance > Dependency list** to view all of the dependencies that are directly and indirectly included in your application. 
  * Click through a few of the pages and notice the components that are all directly/indirectly included in your application. 
  * Next click **Export** to download the SBOM report in CycloneDX json format. If you then open the download you can see all of the information displayed. To learn more about CycloneDX format go [here](https://cyclonedx.org/)

> [See how you could have used GitLab to detect log4j](https://about.gitlab.com/blog/2021/12/15/use-gitlab-to-detect-vulnerabilities/)

* [ ] Step 4: License Compliance
  * Using the left hand navigation menu click through the **Security & Compliance > License Compliance** to view all of the licenses detected in your project. Lets say we decided we no longer want to allow the use of the MIT License, so we can click the **Policies** tab then click **Add license policy**.
  * Next type in and search for the ***MIT License***, then select ***Deny*** and click **Submit**.
  * Now if we click the **Detected in project** tab you will see that the MIT License is denied and violating our set policy.
  * It is out of scope for this workshop, but we also could have set ***License Approvals*** to require approval from a group or individual when a denied license was found in our application.