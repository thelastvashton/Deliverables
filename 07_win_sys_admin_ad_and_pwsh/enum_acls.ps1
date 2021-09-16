### define $directory variable
$directory = $(Get-ChildItem)
### foreach loop
foreach ($item in $directory){
    Get-Acl $item
}