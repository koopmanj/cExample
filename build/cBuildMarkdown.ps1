﻿#Set verbose logging
$VerbosePreference = 'Continue'

#Set error handling
$ErrorActionPreference = 'Continue'

#Set script location
Set-Location $PSScriptRoot

Write-Output "`n`n"
Write-Information -MessageData "$env:COMPUTERNAME : Build of markdown started" -InformationAction Continue

#Query the name of the folder one level up
[string]$ModuleName = (Get-ChildItem ..\).psparentpath[-1].split('\')[-1]
Write-Verbose -Message "$env:COMPUTERNAME : The name of the module is : $ModuleName"

#Query the name of the manifest
[string]$ModuleManifest = (Get-ChildItem -Filter *.psd1 -Path ..\$ModuleName)
Write-Verbose -Message "$env:COMPUTERNAME : The location of the module is : $ModuleManifest"
#Write-Verbose -Message "$env:COMPUTERNAME : The path used for searching is $(..\$ModuleName\$ModuleManifest|out-string)"



#Import the module
Import-Module -Name ..\$ModuleName\$ModuleManifest -Verbose


#Summarize all functions found within the ModuleFile
function Get-ModuleFunctions {
    param(
        [parameter(Mandatory = $true)]
        $ModuleName
    )
        
    $TrimmedFunctionNames = (Get-Command -Module $ModuleName).name
    return $TrimmedFunctionNames
}

$AllFunctions = @()

$PublicFunctions = Get-ModuleFunctions -ModuleName $ModuleName
foreach ($Function in $PublicFunctions) {
    [string]$AllFunctions += "$($Function)`n"
}

Write-Verbose -Message "$env:COMPUTERNAME : The functions within this module exists of : $($PublicFunctions|out-string)"
#$PublicFunctions
#$PublicFunctions.GetType()

#Query for module structure
$Tree = (tree (Split-Path -Path $PSScriptRoot) /A)
$Tree = ($Tree[3..($null = $Tree.count)]|out-string)
Write-Verbose -Message $Tree -Verbose
#>

#Query for repo location(s)
$GitRemote = git remote
$GitRemote = git remote get-url --all $GitRemote

$FunctionSynopsis = @()
foreach ($PublicFunction in $PublicFunctions) {
    Write-Verbose -Message "$env:COMPUTERNAME : Building readme.md for function : $PublicFunction"
    $FunctionSynopsis += (get-help $PublicFunction -Full -ErrorAction SilentlyContinue -ErrorVariable FaulthyFunctionDescription)
    $FunctionSynopsis += "---`n"
}


<#$Functions = @()
foreach ($Synopse in $FunctionSynopsis) {
    $Function = New-Object -TypeName psobject
    $Function | Add-Member -MemberType NoteProperty -Name Name        -Value $Synopse.name
    $Function | Add-Member -MemberType NoteProperty -Name Synopsis    -Value $Synopse.Synopsis
    $Function | Add-Member -MemberType NoteProperty -Name Description -Value ($Synopse.DESCRIPTION).text
    $Function | Add-Member -MemberType NoteProperty -Name Examples    -Value $Synopse.examples.example.code
    $Function | Add-Member -MemberType NoteProperty -Name Parameter   -Value ($Synopse.syntax).syntaxItem.parameter.name

    $Functions += $Function
}
$Functions = $($Functions|out-string)
#>

$ReadmeMarkDown = @"
## $ModuleName ##
This **$ModuleName** module contains $($PublicFunctions.Count) functions that should provide assistance for automation purposes.

### Functions ###
The functions this modules contains coexist of the following names:`n
$($AllFunctions|out-string)


### Installation ###
The installation of this module can be achieved by registering a NuGet repository:`n
*register-psrepository -name reponame -sourcelocation "http://repourl/nuget" -publishLocation "http://repourl/nuget" -installationPolicy trusted*`n
*find-module -name $ModuleName*`n
*-or*`n
*find-module -name $ModuleName -repository reponame*`n

### Detailed information about the functions###
"@

$ReadmeMarkDown2 = @"
### Detailed folder structure###
"@

$ReadmeMarkDown3 = @"
### Contributing ###
*Koopman & Co Engineering*

### Links ###
**[Git $ModuleName Repo]($GitRemote)**
"@

$ReadmeMarkDown   | Out-File "$(Split-Path $PSScriptRoot)\README.MD" -Force -Encoding ascii
$FunctionSynopsis | Out-File "$(Split-Path $PSScriptRoot)\README.MD" -Force -Encoding ascii -Append
$ReadmeMarkDown2  | Out-File "$(Split-Path $PSScriptRoot)\README.MD" -Force -Encoding ascii -Append
($Tree|out-string)| Out-File "$(Split-Path $PSScriptRoot)\README.MD" -Force -Encoding ascii -Append
$ReadmeMarkDown3  | Out-File "$(Split-Path $PSScriptRoot)\README.MD" -Force -Encoding ascii -Append

Remove-Module $ModuleName -Verbose