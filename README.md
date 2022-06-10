# PowerShellFunctions4Git
A few PowerShell functions you can add to your Microsoft.PowerShell_profile.ps1 file to make working with git a bit easier

1. First I strongly sugest using [ posh-git](https://github.com/dahlbyk/posh-git)
	```Import-Module posh-git```
	
1. Checkout into a new branch with the given name, replace any spaces with minus (-) sign. 
	```
	function Git-MKBranch($desc)
	{
		$normilized_desc =  $desc -replace "\s+","-" 
		git checkout -b "user/azaikman/$normilized_desc"
	}
	New-Alias -Name gib Git-MKBranch
	```
	
1. Set the upstream branch nd push changes
	```
	function Git-PushUp
	{
		git push -u origin HEAD
	}
	New-Alias -Name gipu Git-PushUp
	```
	
1. 
