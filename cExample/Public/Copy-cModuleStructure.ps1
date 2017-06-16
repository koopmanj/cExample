<#
.Synopsis
   Copy-cModuleStructure will copy this module to a destination module folder.
.DESCRIPTION
   Copy-cModuleStructure will copy this module to a new modulename and remove the markdown, manifest, .git relations afterwards.
.EXAMPLE
   Copy-cModuleStructure -ModuleName cExample -FunctionName get-cNewCar
#>
function Copy-cModuleStructure {
    param(
        # Parameter help description
        [Parameter(Mandatory=$true,
            HelpMessage="Module name should start with a lower case c, with non digit values afterwards"
        )]
        [ValidateNotNullOrEmpty()]
        [ValidatePattern("^c[a-zA-Z]\w+\D")]
        [string]$ModuleName,

        [Parameter(Mandatory=$true,
            HelpMessage="Function name should start with a valid verb (get-verb)/(werkwoord) followed by a dash with cNoun like Get-cExample"
        )]
        [ValidateNotNullOrEmpty()]
        #[ValidateScript({((get-verb).verb) -contains ($FunctionName.split('-')[0])})]
        [ValidatePattern("[a-zA-Z]\w+-c[a-zA-Z]\w+")]
        [string]$FunctionName
    )

    #Display the modulename provided
    Write-Verbose -Message "$env:COMPUTERNAME : ModuleName :  $ModuleName" -Verbose
    
    #Set location to the running script location
    Set-Location $PSScriptRoot
    Write-Verbose -Message "$env:COMPUTERNAME : Changed to script location : $PSScriptRoot" -Verbose

    #Capture current modulename of the running script
    $CurrentModuleName = (Get-ChildItem ..\..\).psparentpath[-1].split('\')[-1]
    Write-Verbose -Message "$env:COMPUTERNAME : Current module name : $CurrentModuleName" -Verbose

    #Jump to the module root of your module installation location
    Set-Location   ..\..\..
    Write-Verbose -Message "$env:COMPUTERNAME : Changed to root level outside of the current module" -Verbose

    
    #region Copy the initial files
    if(!(Test-Path .\$ModuleName -ErrorAction SilentlyContinue -ErrorVariable stuk)) { 
        Copy-Item .\$CurrentModuleName -Recurse $ModuleName -Verbose
        Write-Verbose -Message "$env:COMPUTERNAME : Path doesnt exist, copying $CurrentModuleName to $ModuleName" -Verbose
    }
    else {
        Write-Warning -Message "$env:COMPUTERNAME : Path does exist, copy of $CurrentModuleName to $ModuleName failed" -Verbose
        exit 1
    }
    #endregion

    #Clear all files, that shouldn't belong to this module
    Set-Location $ModuleName
    try {
        if(Test-Path .\.git){
            Remove-Item -Path .git -Recurse -Force 
            Write-Verbose -Message "$env:COMPUTERNAME : Erasing all .git history of the copied project : $CurrentModuleName to $ModuleName" -Verbose   
        }
        if(Test-Path .\README.MD) {
            Remove-Item -Path .\README.MD -Force 
            Write-Verbose -Message "$env:COMPUTERNAME : Erasing previous readme file of the copied project : .\README.MD" -Verbose   
        }
        if(Get-ChildItem -Filter *.psd1 -Recurse) {
            Get-ChildItem -Filter *.psd1 -Recurse | Remove-Item -Force
            Write-Verbose -Message "$env:COMPUTERNAME : Erasing previous manifest file of the copied project : *.psd1" -Verbose   
        }
    }
    catch {
        Write-Error -Message "$env:COMPUTERNAME : Erasing all .git history of the copied project : $CurrentModuleName to $ModuleName" -Verbose  
        exit 1
    }

    #Rename all files which are named module specific
    try {
        Get-ChildItem -Filter "$CurrentModuleName.*" -Recurse | rename-Item -NewName ({$_.name -replace $CurrentModuleName,$ModuleName})        
    }
    catch {
        Write-Error -Message "$env:COMPUTERNAME : Renaming previous module to the new one failed : $CurrentModuleName to $ModuleName" -Verbose          
        exit 1
    }

    #Create a file with the function name provided
    try {
        New-Item -ItemType File -Name "$FunctionName.ps1" -Path (Get-ChildItem -Recurse -Filter *.ps1).DirectoryName    
    }
    catch {
        Write-Error -Message "$env:COMPUTERNAME : Create of function failed $FunctionName.ps1" -Verbose          
        exit 1
    }
    

    Write-Warning -Message "$env:COMPUTERNAME : Well done $((whoami.exe).split('\')[1]), now it's time to start scripting. Fill the $FunctionName.ps1 script at the public likewise $((Get-ChildItem -Filter "*.ps1" -Recurse).FullName) `n
        afterwards start building from within the build folder by calling the cBuildManifest or after adding a git repository, but ensure you will add the files oterwise there won't be much to checkin.  " -Verbose
}
