Import-Module posh-git

function Git-Status
{
	git status
}
New-Alias -Name gs Git-Status

# Checkout into a new branch with the given name, replace any spaces with minus (-) sign.

function Git-MKBranch($desc)
{
	$normilized_desc =  $desc -replace "\s+","-" 
	git checkout -b "user/azaikman/$normilized_desc"
}
New-Alias -Name gib Git-MKBranch

# Checks out files by regex

function Git-Revert($reg)
{
	git checkout  ((git status -s).Substring(2) | findstr $reg).trim()
}
New-Alias -Name girev Git-Revert	 

# Create a hotfix brunch, recives a suffix for the branch name a hash to base the hotfix on and a hash to cherry-pick.

function Git-HotFix($name, $base ,$hash)
	{
		git fetch && git checkout -b hotfix/$name $base && git cherry-pick $hash
	}
New-Alias -Name gihot Git-HotFix

# Set the upstream branch and push changes

function Git-PushUp
{
	git push -u origin HEAD
}
New-Alias -Name gipu Git-PushUp

# Delete any local pranch which matches the given regex

function Git-RMBranch($reg)
{
	git branch -D (git branch --list $reg).trim()
}
New-Alias -Name girm Git-RMBranch

# Just in case you forgot somthing really small after pushing...

function Git-Oops($reg)
{
	git commit -a --ammend && git push -f 
}
New-Alias -Name gioo Git-Oops

# Takes you back to clean master

function Git-Home($reg)
{
	git checkout master && git fetch --prune && git pull
}
New-Alias -Name gims Git-Home
