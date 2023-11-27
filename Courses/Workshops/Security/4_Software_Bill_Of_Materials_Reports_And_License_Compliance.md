### We will take a look at the SBOM report that our scanners created as well as see the various licenses that our scanners detected

### Theme

With the uptick of major security breaches hitting headlines many governments have started to require their developers and those that work with the Government to provide detailed reports on the dependencies of their applications. This section will show you how GitLab creates these reports for you.

# Step 1: Review & Download SBOM report

1. Using the left hand navigation menu click through **Secure \> Dependency list** to view all of the dependencies that are directly and indirectly included in your application.
  
2. Click through a few of the pages and notice the components that are all directly/indirectly included in your application.
  
3. Next click **Export** to download the SBOM report in CycloneDX json format. If you then open the download you can see all of the information displayed. To learn more about CycloneDX format go [here](https://cyclonedx.org/)

> [See how you could have used GitLab to detect log4j](https://about.gitlab.com/blog/2021/12/15/use-gitlab-to-detect-vulnerabilities/)

# Step 2: License Compliance

1. Using the left hand navigation menu click through the **Secure \> License Compliance** to view all of the licenses detected in your project.
  
2. Lets say we decided we want to prevent the use of the BitTorrent Open Source License v1.1 License. Using the left hand navigation menu click through the **Secure \> Policies** then click **New policy**.
  
3. Click **Select policy** under **Scan result policy**
  
4. In the **New scan result policy form** that appears, provide the following mandatory information:
    * Name: Deny BitTorrent Open Source License v1.1 License
    * Policy status: Enabled
    * Rules: If **Select scan type** == **License Scan**, rest of first section stays as is
    * **Status is** both **Newly Detected** and **Pre-existing**
    * License is **matching** **_BitTorrent Open Source License v1.1_**
    * Actions: Require 1 approval from: **Individual users** **lfstucker**
    * Uncheck **Prevent pushing and force pushing**
    * Click **Configure with a merge request**

5. Merge the new merge request into the existing security policy project.
  
6. _Remember to go back to your project using the breadcrumb, clicking on your group, then clicking on your project._
  
7. Now if we were to run a new pipeline for a MR, a new approval rule based on this license compliance policy will be added to prevent any software using the BitTorrent Open Source License v1.1 license from being merged and the security bot will notify you that you have a policy violation.

