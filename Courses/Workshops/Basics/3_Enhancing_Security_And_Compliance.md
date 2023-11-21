### Theme

Take a deeper dive into how GitLab enables you through shifting left and the various security reports that are all provided.

### Key Tasks to Complete

# Step 1: Merge Request Security Results

1. Right below the approvals section we can see that our  ***Code Quality, License Compliance, & Security scanning*** templates we included have generated full security reports unique to this branch for us to view. These reports are generated with each commit so we always know if we have introduced a new bug before its deployed out and disaster strikes.
  
2. Go ahead and take some time to expand each report and look through the results, then in the ***Security scanning*** section click on any of the critical/high vulnerabilities.
  
3. From this view we can see exactly where it occurred in the code & read up on why its a risk. After taking a look at this we can click the comment icon at the bottom to state that we checked it out and are not worried, then click **Add comment & dismiss**.
  
4. Next we will want to scroll down and merge our code. At the bottom of the request click **Merge** to kick off our pipeline. 
  
5. Once merged use the left hand navigation menu to click through **CICD > Pipelines** and click into the most recently kicked off pipeline. At this point your instructor will move onto the next section with a project that already has the code merged.
 
# Step 2: Merge Request Security Results
  
1. Now that your ***main*** pipeline has completed the reports under ***Secure*** have been generated. These reports will only be generated if you run a pipeline against main.
  
2. Use the left hand navigation menu to click through **Securite -> Security Dashboard**. This will bring up a dashboard view of all of the security vulnerabilities & their counts over time so you can track your work as you secure your project. This dashboard takes a long time to collect data so if yours still has no results your presenter will show you the dashboard of a deployed Tanuki Racing application [here](https://gitlab.com/gitlab-learn-labs/webinars/tanuki-racing/tanuki-racing-application/-/security/dashboard)
  
3. We have already seen how to view the vulnerabilities in the pipeline view, but now lets use the left hand navigation menu and click through **Secure -> Vulnerability Report** to view the full report
  
4. Next look for the **Possible SQL Injection** vulnerability by filtering the **_Severity_** to ***Low*** and the **_Tool_** to ***SAST***. Click into the vulnerability, then click the **try it out** button for an explanation on what a SQL injection risk is and why our application is vulnerable using GitLab's Explain This Vulnerability funcationality.
  
5. At the end of the report check out the **_Fixed Code_** section and we can see that if we add `sanitize_sql(id)` around our id value we will be protected from most attacks. We will use this knowledge later in the workshop.
  
6. If you are curious what triggered this response try clicking ***Show prompt*** to see the full prompt sent to GitLab duo to generate the suggested fix.
  
7. What if we wanted more context about the specific function above before we went and made a code change? Lets click the linked file in the **_Location_** section to be brought to our db.rb file.
  
8. Once in the db.rb file locate the line the sql injection vulnerability on line 42 and highlight the whole **_get_specific_** function.
  
9. You should then see a small question mark to the left of the code, click it.
  
10. On the right hand side there will now be a small pop up to explain what your highlighted code does in natural language. Try highlighting other code sections as well.

# Step 3: Review & Download SBOM report

1. Using the left hand navigation menu click through **Secure > Dependency list** to view all of the dependencies that are directly and indirectly included in your application. 

2. Click through a few of the pages and notice the components that are all directly/indirectly included in your application. 
  
3. Next click **Export** to download the SBOM report in CycloneDX json format. If you then open the download you can see all of the information displayed. To learn more about CycloneDX format go [here](https://cyclonedx.org/)

> [See how you could have used GitLab to detect log4j](https://about.gitlab.com/blog/2021/12/15/use-gitlab-to-detect-vulnerabilities/)

# Step 4: License Compliance

1. Using the left hand navigation menu click through the **Secure \> License Compliance** to view all of the licenses detected in your project.
  
2. Lets say we decided we no longer want to allow the use of the MIT License. Using the left hand navigation menu click through the **Secure \> Policies** then click **New policy**.
  
3. Click **Select policy** under **Scan result policy**
  
4. In the **New scan result policy form** that appears, provide the following mandatory information:
    * Name: Deny MIT License
    * Policy status: Enabled
    * Rules: If **Select scan type** == **License Scan**, rest of first section stays as is
    * **Status is** both **Newly Detected** and **Pre-existing**
    * License is **matching** **_MIT_**
    * Actions: Require 1 approval from: **Individual users** **lfstucker**
    * Click **Configure with a merge request**

5. Merge the new merge request into the existing security policy project.

6. _Remember to go back to your project using the breadcrumb, clicking on your group, then clicking on your project._
  
7. Now if we were to run a new pipeline for a MR, a new approval rule based on this license compliance policy will be added to prevent any software using the MIT license from being merged and the security bot will notify you that you have a policy violation
  
8. Lastly if you use the left hand navigation menu you can click through **Secure > License Compliance** and see that we have been notified that the MIT license is a Policy violation.
