<#
.Synopsis
   Show-cModuleStructure will visualize and explain basic module structure.
.DESCRIPTION
   Show-cModuleStructure will show the basic information about the directory structure chosen for easy to maintain and default module development.
.EXAMPLE
   Show-cModuleStructure
#>
function Show-cModuleStructure {
    #Set script location
    Set-Location $PSScriptRoot
    Write-Verbose -Message "Set the scriptlocation, to the path were its script is being called $PSScriptRoot"

    #Jump to toplevel of module
    Write-Verbose -Message "Changing the location of the current path to the root of the module"
    Set-Location ..\..\
    
    #Query for directorymodule the structure
    $Tree = tree /A /F
    $Tree = ($Tree[3..($null = $Tree.count)]|out-string)

    $Explanation = @"
        Within the structure displayed above, you're able to count 3 folders named build, cExample, Tests.
        
        ##Build##
        Within the build folder all files are generic written to render a 
         - manifest,
         - markdown,
        where quickndirty can be used to quickly render both and commit your changes if an existing repository had been created on your client.
         Note adding (git add ) of files should be done manually.
        So ensure synopsis are filled properly and relief yourself!

        ##cExample##
        Within the cExample folder the more familiar files become visable, so the
         - psd1 (rendered by running the buildcBuildManifest.ps1) should be visable, after some functions are stored within the private or public subfolders.
         - psm1 (behaves slight different, by default this file contains all logiccodefunctions, however in our setup it will be used to export public functions visible for the community and it will keep the private functions not available).
        Within the subfolders (private or public) mostly the public folder will be filled with functions. Please keep the functions split up into ps1 files. It will be easy to maintain modules if we keep this setup.

        ##Tests##
        Since we're getting dependent on code, we should care about testing our code. To keep at least functionality 'backwards compatible' and expect functions to behave like it was intended to.
        Here we split up into unit and integration testing, the differences between both can be found online. For the moment it will be wise to start at least with basic unit testing.
         - unit (is the code functioning like it should)
         - integration (is the code and it's behaviour acting properly combined with existing environments)
"@

       return $Tree,$Explanation
}