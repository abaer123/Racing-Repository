## Theme

Create a project using instance templates then start planning development with GitLab PM tools

## Key Tasks to Complete

* [ ] Step 1: Create a Project
  * First we want to navigate to the ultimate group we redeemed at the start on the workshop. Once there go ahead and click **New project**. On the resulting page we then want to click **Create from template**, then on the template selection page click **Use template** on the ***Ruby on Rails*** section. These templates are built into GitLab.com and can be used by anyone for a jump start on their next development project.
  * On the ***Create from template*** page we will want to set the ***Project name*** to be "workshop project, then leave the rest of the settings as is and click **Create project**.
  * You will then be brought to the homepage of your new project where we will be running the rest of our hands on exercises from

> [Docs on code templates](https://docs.gitlab.com/ee/user/group/custom_project_templates.html)
<br>


* [ ] Step 2: Create an Issue
  * We then want to go ahead and create an issue to outline the work we are going to do today. Go ahead and use the left hand navigation menu to click through **Issues > List** then click **New issue**. We will set the ***Title*** of this issue to be "Enable Auto DevOps", then in the description write "We will be enabling the built in Auto DevOps feature of GitLab to quickly get set up with CICD & security".
  * None of the rest of the settings are needed right now, but notice all the options you could use to full define an agile/waterfall project management approach. Also take notice on how ***templates*** are an option, where you could template out the various issues like access requests for you project.
  * Scroll down to the bottom of your page and click **Create issue**

> [Docs on issues](https://docs.gitlab.com/ee/user/project/issues/)
<br>

* [ ] Step 3: Create a Merge Request
  * You should now be on the issue view for our ***Enable Auto DevOps*** issue. Take a quick look at the various feature you could use to communicate with your other team members, then click **Create merge request**. All of development done with GitLab wraps up into Merge Requests and by creating the MR from the issue view we can make sure the dev work is directly linked back to the original ask.
  * On the resulting merge request page we want to uncheck **Mark as draft**, leave the rest of the config options as is, then scroll down and click **Create merge request**.
  * This merge request will be the center of our development in the next session, where we show off how GitLab enables "shifting left" so that any development mistakes are caught right at the merge request and not months later during a security incident.

> [Docs for merge requests](https://docs.gitlab.com/ee/user/project/merge_requests/)