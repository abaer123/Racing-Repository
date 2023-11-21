### Theme

Create a project using instance templates then start planning development with GitLab PM tools

### Key Tasks to Complete

# Step 1: Create an Issue

1. We want to start by creating an issue to outline the work we are going to do today. Go ahead and use the left hand navigation menu to click through **Plan > Issues** then click **New issue**. We will set the ***Title*** of this issue to be "Enable Auto DevOps", then for the description click the tanuki icon in the description input.

2. On the resulting dropdown click **Generate issue description**, add "we want to auto devops in this project" to the text box, then click **submit**.

3. We will then want to assign the issue to ourselves, enter a weight of 3, set the due date 2 days from now, and leave the rest as is. 

4. Scroll down to the bottom of your page and click **Create issue**

> [Docs on issues](https://docs.gitlab.com/ee/user/project/issues/)
<br>

# Step 2: Ask GitLab Duo

1. What if we hadnt known where to find our issues? Or we wanted to learn more about the issue customization options? We can use the new GitLab Duo Chatbot to do that and more.
  
2. Click the **? Help** button in the bottom left of the screen, then click **Ask GitLab Duo.** This will open up a chat prompt on the right hand side of the screen for you to type your questions. Go ahead and type "What features does GitLab have to help me while I plan out my work?"
  
3. For the rest of the workshop you can use this chat bot to ask any questions that may come up. You can even ask it coding questions if you get stuck!

# Step 3: Track Work In Boards

1. Next use the left hand navigation menu to click through **Plan > Issue boards** and see that our issue is listed in the _Open_ column. We want to add an _In Progress_ column so we can accurately track our work.
  
2. Use the left hand navigation menu again to click through **Manage > Labels**, then click **New label**.
  
3. _Title_ our new label as "In Progress", add a short description and choose a color. Then click **Create label**.
  
4. Next navigate back to the issue board clicking through **Plan > Issue boards**. Once on our issue board view we want to click **Create list**
  
5. Ensure _Label_ is selected, click the **Select a label** dropdown and select **In Progress**. Next click **Add to board**.
  
6. Now we have a new _In Progress_ list that we can move our existing issue onto. Notice that the label is automatically applied. 

# Step 4: Create a Merge Request

1. Click into our ***Enable Auto DevOps*** issue. Take a quick look at the various features you could use to communicate with your other team members, then click **Create merge request**. All of development done with GitLab wraps up into Merge Requests and by creating the MR from the issue view we can make sure the development work is directly linked back to the original ask.
  
2. On the resulting merge request page we want to uncheck **Mark as draft**, assign it to ourselves, leave the rest of the config options as is, then scroll down and click **Create merge request**.
  
3. This merge request will be the center of our development in the next session, where we show off how GitLab enables "shifting left" so that any development mistakes are caught right at the merge request and not months later during a security incident.

> [Docs for merge requests](https://docs.gitlab.com/ee/user/project/merge_requests/)
