## Create Group, Project, Labels, Boards, Project Milestone, and Issues

### Theme

Organizing and planning work

### Key Tasks to Complete

# Step 1: Create a new Subgroup

1. Before we move over our template project, go ahead and click **Create new subgroup** in the group redeemed for us
  
2. Under **Subgroup name**, provide a group name (**Tanuki-Racing-Group**)

3. Leave all other settings as is

4. Click **Create subgroup**
 
# Step 2: Import Our Project

1. Click **Create new project**
  
2. Click **Import project**
  
3. Click **Repository by URL**
  
4. In the _Git repository URL_ section add the following URL: https://gitlab.com/gitlab-learn-labs/sample-projects/tanuki-racing.git
  
5. Leave all other settings as is.
  
6. Click **Create project**
  
7. You may see a note regarding an SSH key. It is okay to ignore this message during the workshop.

> [Docs for setting up your org](https://docs.gitlab.com/ee/topics/set_up_organization.html)


# Step 3: Planning With GitLab Duo Chat

1. Once your project has been imported you may have a number of questions on how to get started. GitLab's newest AI feature **GitLab Duo Chat** can help answer that and more
  
2. In the bottom left corner of your screen go ahead and click the **? Help** link, then click **GitLab Duo Chat**.

  > Please note if you requested your group within the last hour there may be a delay up to 1 hour until AI features are available

3. Let's start by asking chat _"Where can I see my project's issues?"_. You can also ask chat any GitLab related or coding questions. Feel free to use chat as an assistance tool for the rest of the workshop.

  > Duo Chat can also be used to write docs for your code, summarise open issues/epics/etc, and more.

# Step 4: Create at least 4 labels

1. Use the left hand navigation menu to click through **Manage** > **Labels**
  
2. Click **New label**
  
3. Enter **P1** in the ***Title*** field and select a color
  
4. Click **Create label**
  
5. Click **New label** and create another label for **P2**
  
6. Click **New label** and create another label for **Workflow::Planning**
  
7. Click **New label** and create another label for **Workflow::Review**

# Step 5: Create New Board

1. Use the left hand navigation menu to click through **Plan -> Issue boards**
  
2. Click **New board** next to the dropdown that says **Development**.

3. Enter a title (**Team-Scoped-Board**)
  
4. Leave **Show the Open list** and **Show the Closed list** checkboxes selected
  
5. Click **Create board**
  
6. Click **Create list**. Leave the scope of the list set to **Label**. Select **Workflow::Planning**. Click **Add to board**.
  
7. Click **Create list**. Leave the scope of the list set to **Label**. Select **Workflow::Review**. Click **Add to board**.
  
8. As we add issues in the future if they contain the scoped labels they will automatically appear in the labels board.

# Step 6: Create Project Milestone

1. Use the left hand navigation menu to click through **Plan**>**Milestones**
  
2. Click **New milestone**
  
3. Enter a title (**Tanuki-Racing-Migration-Milestone**)
  
4. Set a start date as **today**
  
5. Set a due date as **one week from today**
  
6. Click **Create milestone**

# Step 7: Create Issues

1. Create an Issue
    * Navigate to **Plan>Issues** using the left hand navigation menu
    * Click **New issue**
    * Give a title **Update-Pipeline**
    * Click the **Tanuki icon** next to preview in the description area. Click **Generate issue description** in the resulting dropdown and use this prompt: `Provide a short description around updating our pipeline to use Auto DevOps` then click **Submit**.
    * Click **Assign to me** to assign the issue to yourself. Even if your name doesn't appear in the dropdown you can still write in your GitLab id
    * Select the milestone (**Tanuki-Racing-Migration-Milestone**)
    * Assign the label **P2**
    * Give a weight (i.e. **2**)
    * Select a due date within the next week
    * Leave all other settings as is
    * Click **Create issue**

2. Create a Second Issue
    * Navigate to **Plan>Issues** using the left hand navigation menu
    * Click **New issue**
    * Give a title **Review-Pipeline**
    * Click the **Tanuki icon** next to preview in the description area. Click **Generate issue description** in the resulting dropdown and use this prompt:
     `Provide a short description around reviewing and testing the new Auto DevOps pipeline we have created.` then click **Submit**.
    * Click **Assign to me** to assign the issue to yourself. Even if your name doesn't appear in the dropdown you can still write in your GitLab ID
    * Assign the label **Workflow::Review**
    * Give a weight (i.e. **1**)
    * Select a due date within the next week
    * Leave all other settings as is
    * Click **Create issue**

3. Create an Issue using Quick Actions
    * Navigate to **Plan>Issues** using the left hand navigation menu
    * Click **New issue**
    * Give a title **Add SAST Scanner**
    * Under the ***Description Dropdown*** select workshop_template.
    * Your ***Write*** section should now be populated with some quick actions and a template. 
    * Go ahead and complete the template
    * Click **Create issue**

> [Docs for setting up your org](https://docs.gitlab.com/ee/user/project/quick_actions.html)

# Step 8: Move Issues in Boards

1. Navigate to **Plan**>**Issue Boards**
  
2. If not already selected, select the **Team-Scoped-Board** board from the board selector dropdown
  
3. Note the issues in the **Open** list & the one issue in the _Workflow::Review_ list
  
4. Click and drag the **Add SAST Scanner** issue into the **Workflow::Planning** list
  
5. Click on that issue and note the labels now include **Workflow::Planning**
  
6. Click and drag the same issue into **Workflow::Review**
  
7. Note the issue labels now include **Workflow::Review** and *not* **Workflow::Planning**
  
8. Click and drag the same issue into Closed
  
9. Note the issue labels no longer include **Workflow::Review** or **Workflow::Planning** and the issue is now closed
  
10. Before moving on drag the closed issue back to ***Planning***

# Step 9: Review project milestone charts
  
1. Navigate to **Plan**>**Milestones**
  
2. Click **Tanuki-Racing-Migration-Milestone**
  
3. Notice the Burndown and Burnup charts
  
4. Notice the Unstarted Issues, Ongoing Issues, and Completed Issues tracked part of the milestone


