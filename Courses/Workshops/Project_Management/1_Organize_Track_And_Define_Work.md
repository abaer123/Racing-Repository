# Create Group, Project, Labels, Boards, Project Milestone, and Issues

## Theme

Organizing and planning work

## Key Tasks to Complete

TODO: walk through forking, everyhting revovles around this project now. Also add issue and mr summary, and gitlab duo

Starting flow is: Create your sub group, fork in project

* [ ] Step 1: Create a new Subgroup
  * Before we move over our template project, go ahead and click **Create new subgroup** in the group redeemed for us
  * Under **Subgroup name**, provide a group name (**Tanuki-Racing-Group**)
  * * Leave all other settings as is
  * Click **Create subgroup**
* [ ] Step 2: Import Our Project
  * Click **Create new project**
  * Click **Import project**
  * Click **Repository by URL**
  * In the _Git repository URL_ section add the following URL: https://gitlab.com/gitlab-learn-labs/sample-projects/tanuki-racing.git
  * Leave all other settings as is.
  * Click **Create project**
  * You may see a note regarding an SSH key. It is okay to ignore this message during the workshop.

> [Docs for setting up your org](https://docs.gitlab.com/ee/topics/set_up_organization.html)

* [ ] Step 3: Planning With GitLab Duo Chat
  * Once your project has been imported you may have a number of questions on how to get started. GitLab's newest AI feature **GitLab Duo Chat** can help answer that and more
  * In the bottom left corner of your screen go ahead and click the **? Help** link, then click **GitLab Duo Chat**.

  > Please note if you requested your group within the last hour there may be a delay up to 1 hour until AI features are available

  * Lets start by asking chat _"Where can I see my projects issues?"_. You can also ask chat any GitLab related or coding questions. Feel free to use chat as an assistance tool for the rest of the workshop.

* [ ] Step 4: Create at least 4 labels
  * Use the left hand navigation menu to click through **Manage** > **Labels**
  * Click **New label**
  * Enter **P1** in the ***Title*** field and select a color
  * Click **Create label**
  * Click **New label** and create another label for **P2**
  * Click **New label** and create another label for **Workflow::Planning**
  * Click **New label** and create another label for **Workflow::Review**
* [ ] Step 4: Create New Board
  * Use the lefthand navigation menu to click through **Plan -> Issues boards**
  * Click **New board** next to the dropdown that says **Development**.
  * Enter a title (**Team-Scoped-Board**)
  * Leave **Show the Open list** and **Show the Closed list** checkboxes selected
  * Click **Create board**
  * Click **Create list**. Leave the scope of the list set to **Label**. Select **Workflow::Planning**. Click **Add to board**.
  * Click **Create list**. Leave the scope of the list set to **Label**. Select **Workflow::Review**. Click **Add to board**.
  * As we add issues in the future if they contain the scopped labels they will automatically appear in the labels board.
* [ ] Step 5: Create Project Milestone
  * Use the lefthand navigation menu to click through **Plan**>**Milestones**
  * Click **New milestone**
  * Enter a title (**Tanuki-Racing-Migration-Milestone**)
  * Set a start date as **today**
  * Set a due date as **one week from today**
  * Click **Create milestone**
* [ ] Step 6: Create Issues
  * Create an Issue
    * Navigate to **Plan>Issues** using the lefthand navigation menu
    * Click **New issue**
    * Give a title **Update-Pipeline**
    * Click **Assign to me** to assign the issue to yourself. Even if your name dosent appear in the dropdown you can still write in your GitLab id
    * Select the milestone (**Tanuki-Racing-Migration-Milestone**)
    * Assign the label **P2**
    * Give a weight (i.e. **2**)
    * Select a due date within the next week
    * Leave all other settings as is
    * Click **Create issue**
  * Create an Second Issue
    * Click **New issue**
    * Give a title **Review-Pipeline**
    * Click **Assign to me** to assign the issue to yourself. Even if your name dosent appear in the dropdown you can still write in your GitLab ID
    * Assign the label **Workflow::Review**
    * Give a weight (i.e. **1**)
    * Select a due date within the next week
    * Leave all other settings as is
    * Click **Create issue**
  * Create an Issue using Quick Actions
    * Navigate to **Plan>Issues** using the left hand navigation menu
    * Click **New issue**
    * Give a title **Add SAST Scanner**
    * Under the ***Description Dropdown*** select workshop_template.
    * Your ***Write*** section should now be populated with some quick actions and a template. 
    * Go ahead and complete the template
    * Click **Create issue**

> [Docs for setting up your org](https://docs.gitlab.com/ee/user/project/quick_actions.html)


* [ ] Step 7: Move Issues in Boards
  * Navigate to **Issues**>**Boards**
  * If not already selected, select the **Team-Scoped-Board** board from the board selector dropdown
  * Note the issues in the **Open** list & the one issue in the _Workflow::Review_ list
  * Click and drag the **Add SAST Scanner** issue into the **Workflow::Planning** list
  * Click on that issue and note the labels now include **Workflow::Planning**
  * Click and drag the same issue into **Workflow::Review**
  * Note the issue labels now include **Workflow::Review** and *not* **Workflow::Planning**
  * Click and drag the same issue into Closed
  * Note the issue labels no longer include **Workflow::Review** or **Workflow::Planning** and the issue is now closed
  * Before moving on drag the closed issue back to ***Planning***
* [ ] Step 8: Review project milestone charts
  * Navigate to **Plan**>**Milestones**
  * Click **Tanuki-Racing-Migration-Milestone**
  * Notice the Burndown and Burnup charts
  * Notice the Unstarted Issues, Ongoing Issues, and Completed Issues tracked part of the milestone
