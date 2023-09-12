# Create Group, Project, Labels, Boards, Project Milestone, and Issues

## Theme

Organizing and planning work

## Key Tasks to Complete

* [ ] Step 1: Create a new Subgroup
  * Click **Create new subgroup**
  * Under **Subgroup name**, provide a group name (**Tanuki-Racing-Group**)
  * * Leave all other settings as is
  * Click **Create subgroup**
* [ ] Step 2: Create a Project
  * Click **Create new project**
  * Click **Create blank project**
  * Under **Project name**, enter a project name (**Leaderboard-Project**)
  * Ensure **Initialize repository with a README** is checked so the git repository is initialized. This file will be used later in the workshop.
  * Leave all other settings as is
  * Click **Create project**
  * You may see a note regarding an SSH key. It is okay to ignore this message during the workshop.

> [Docs for setting up your org](https://docs.gitlab.com/ee/topics/set_up_organization.html)

* [ ] Step 3: Create at least 4 labels
  * Navigate to **Project information** > **Labels**
  * Click **New label**
  * Enter **P1** in the ***Title*** field and select a color
  * Click **Create label**
  * Click **New label** and create another label for **P2**
  * Click **New label** and create another label for **Workflow::Planning**
  * Click **New label** and create another label for **Workflow::Review**
* [ ] Step 4: Create New Board
  * Use the lefthand navigation menu to click through **Issues -> Boards**
  * Click the board selector dropdown that says **Development** and click **Create new board**
  * Enter a title (**Team-Scoped-Board**)
  * Leave **Show the Open list** and **Show the Closed list** checkboxes selected
  * Click **Create board**
  * Click **Create list**. Leave the scope of the list set to **Label**. Select **Workflow::Planning**. Click **Add to board**.
  * Click **Create list**. Leave the scope of the list set to **Label**. Select **Workflow::Review**. Click **Add to board**.
* [ ] Step 5: Create Project Milestone
  * Use the lefthand navigation menu to click through **Issues**>**Milestones**
  * Click **New milestone**
  * Enter a title (**GitLab-Migration-Milestone**)
  * Set a start date as **today**
  * Set a due date as **one week from today**
  * Click **Create milestone**
* [ ] Step 6: Create Issues
  * Create an Issue
    * Navigate to **Issues** using the lefthand navigation menu
    * Click **New issue**
    * Give a title **Modify-README**
    * Click **Assign to me** to assign the issue to yourself. Even if your name dosent appear in the dropdown you can still write in your GitLab id
    * Select the milestone (**GitLab-Migration-Milestone**)
    * Assign the label **P2**
    * Give a weight (i.e. **2**)
    * Select a due date within the next week
    * Leave all other settings as is
    * Click **Create issue**
  * Create an Issue using Quick Actions
    * Navigate to **Issues** using the left hand navigation menu
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
  * Note the issues in the **Open** list
  * Click and drag the **Add SAST Scanner** issue into the **Workflow::Planning** list
  * Click on that issue and note the labels now include **Workflow::Planning**
  * Click and drag the same issue into **Workflow::Review**
  * Note the issue labels now include **Workflow::Review** and *not* **Workflow::Planning**
  * Click and drag the same issue into Closed
  * Note the issue labels no longer include **Workflow::Review** or **Workflow::Planning** and the issue is now closed
  * Before moving on drag the closed issue back to ***Planning***
* [ ] Step 8: Review project milestone charts
  * Navigate to **Issues**>**Milestones**
  * Click **GitLab-Migration-Milestone**
  * Notice the Burndown and Burnup charts
  * Notice the Unstarted Issues, Ongoing Issues, and Completed Issues tracked part of the milestone