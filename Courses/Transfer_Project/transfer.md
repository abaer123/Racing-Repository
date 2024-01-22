# Transfer workshop project to reference later

**WARNING**

You will lose some capabilities we went over during the workshop when you transfer the project if you do not have an ultimate or premium license. We do however have a free trial period you can take advantage of as well: https://about.gitlab.com/free-trial/

## Tasks and Steps

* [ ] Transferring Project
  * If you only want a single project to reference for later, start here. If instead you want the whole group we have been working with to reference later, skip to step 2.
  * This step is completely optional, if you do not wish to transfer just click **finish**. **Keep in mind that if you do not have an existing ultimate license some of the lab functionality will go away when you transfer your project.**
  * Projects cannot be transferred when there are images in the container registry, clean them up by going to **Deploy --> Container registry**
  * Delete all the available images by clicking on the **trashcan** at the back of the line, and confirm the deletion until **all** images are deleted
  * While still in your project use the left hand navigation menu to click through **Settings -> General**
  * From there scroll to the bottom and click **Expand** on the ***Advanced*** section.
  * We then want to locate the ***Transfer project*** section and click the **Select a new namespace** dropdown. From there search for your name and select it. Your name will most likely be under **Users** in bold. **NOTE: This will be your actual name and not your GitLab ID.**
  * A confirmation message will then pop up where you just need to re-enter the name of your project then click **Confirm**.
  * Your project will then be immediately moved to your personal namespace for you to reference in the future.


* [ ] Transferring Group
  * If you completed step 1 and dont need to reference any of the other projects in the future, skip this step and end the workshop.
  * There are a number of ways to do this, we will walk through what is arguably the easiest way to transfer a group. First decide the location of where you are trying to transfer the group to and grab the gitlab path. Example below:

    > **URL** https://gitlab.com/gitlab-com/customer-success/demo-engineering/sandbox/iu8ul5wa **becomes**: gitlab-com/customer-success/demo-engineering/sandbox/iu8ul5wa 

  * Go back to our workshop group and use the left hand navigation menu to click **Settings > General** and then scroll down and expand the _Advanced_ section.
  * Keep scrolling down to the **Transfer group** section where we will want to click the **Select parent group** dropdown. Search for the group path we copied earlier and click it.
  * Lastly click **Transfer group**, complete the check and then your group will be transferred.
