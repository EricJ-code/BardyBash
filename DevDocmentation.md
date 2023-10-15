# In-Code Comments
## Summary:
Commenting in your code is important for other team members to understand the changes you have pushed.
Though commenting is immensely usful it should not be the sole communcation about your changes.
Please make sure you are also following up with those who you beleive need to know the changes you have implemented.

## Commenting Style
Do not create multiple header comments adjust the original header if necessary.
### Class
```
[Initials]
[Class Name]
[In Depth Description]
Methods
method1: this method does ___
method2: this method does ___
method3: this method does ___
```
Please note that these methods are "solidified" meaning they are more or less permanant.
Do not add methods that are band-aid solutions.
### Methods
```
'''
[Intials]
[Method Name]
[Brief Description (1-2 lines)]
Params
param1: this does ___
param2: this does ___
param3: this does ___

Returns
return1: returns ___
return2: returns ___
return3: returns ___
'''
Method(param){

}
```
If changes are present please use below stylization:
```
'''
!CHANGES! [Your Intiatls]
[Original comment with any additions or subtractions]
'''
Method(param){
Print("Hello World!") //Changes were made here
}
```
# GitHub Commits/ Comments
Please outline your changes in a commit message when you push your changes to GitHub.
<br>Example:
```
Gameplay Issue#0000 
Changes: methods and variables
Additions: methods and variables
```
## Inorder to push your changes

### Via Terminal:
#### Step 1: Pull from Master
```
git pull Master
```
#### Step 2: Selecting a Branch
```
git checkout -b [New Branch Name] //Used for making a new branch
```
OR
```
git checkout [Name of Branch]// Used for existing branch
```
#### Step 3: Checking Status
```
git status
```
#### Step 4: Adding Changes
```
git add [Red File Name] // To add 1 modified or new file
```
OR
```
git add. //To add all modified or new files
```
#### Step 5: Double Check Status
Results should all be green now.
```
git status
```
#### Step 6: Making a Commit
```
git commit -m "Commit Message"
```
#### Step 7: Pushing
```
git push origin [New Branch Name]
```
### Via VSC:
Step 1: Click the source control symbol found on the left verticle nav bar.
<br>Step 2: Click the three dots found the the right of the repo name.
<br>Step 3: Click Pull
#### If you want to stage all changes 
Step 4: Write commit message
<br>Step 5: Click Commit
<br>Step 6: Click Push
<br>Step 7: On the pop-up asking if you would like to stage your changes hit yes
#### If you want to stage select changes
Step 4: Select the files you want to stage by clicking the '+'
<br>Step 5: Write commit message
<br>Step 6: Click Commit
<br>Step 7: Click Push
