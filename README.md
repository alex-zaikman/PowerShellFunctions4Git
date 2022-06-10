# PowerShellFunctions4Git
A few PowerShell functions to make working with git a bit easier


Checkout into a new branch with the given name, replace any spaces with minus (-) sign.
```
function Git-MKBranch($desc)
{
	$normilized_desc =  $desc -replace "\s+","-" 
	git checkout -b "user/azaikman/$normilized_desc"
}
```
