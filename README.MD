## cExample ##
This **cExample** module contains 1 functions that should provide assistance for automation purposes.

### Functions ###
The functions this modules contains coexist of the following names:

Get-cExample



### Installation ###
The installation of this module can be achieved by registering a Solvinity NuGet repository:

*register-psrepository -name solget -sourcelocation "http://solget-dev.web.solvinity.com/nuget" -publishLocation "http://solget-dev.web.solvinity.com/nuget" -installationPolicy trusted*

*find-module -name cExample*

*-or*

*find-module -name cExample -repository solget*


### Detailed information about the functions###

NAME
    Get-cExample
    
SYNOPSIS
    Get-cExample will show a default module which will display a baseline for our engineers  Short description
    
    
SYNTAX
    Get-cExample [-Param1] <Object> [-Param2 <Int32>] [-WhatIf] [-Confirm] [<CommonParameters>]
    
    Get-cExample [-Param3 <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
    
    
DESCRIPTION
    Get-cExample will help our engineers to just copy a default module and modify the code to their needs Long description
    

PARAMETERS
    -Param1 <Object>
        Param1 help description
        This parameter -p1 (alias) or -param1 will require a value.
        Gets and sets a Boolean value that indicates whether the parameter can take values from incoming pipeline objects.
        Gets and sets a Boolean value that indicates that the parameter can take values from a property of the incoming pipeline object that has the same name as this parameter. For example, if the name of the cmdlet or function parameter is userName, the parameter can 
        take values from the userName property of incoming objects.
        Gets and sets a Boolean value that indicates whether the cmdlet parameter accepts all the remaining command-line arguments that are associated with this parameter.
        The position of the parameter, so -p1 or -param1 should be provided as the first parameter by invoking this function.
        Gets or sets the parameter set that is used when Windows PowerShell cannot determine the parameter set to use based on the specified parameters.     
        Provide a ?! or help to retrieve the displaymessage displayed on the left.
        This validator checks that the value is not null.
        This validator checks that the value is not null or empty.
        The ValidateCount attribute specifies the minimum and maximum number of arguments allowed for a cmdlet parameter.
        The ValidateSetAttribute attribute specifies a set of possible values for a cmdlet parameter argument.
        The alias of the param.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false
        
    -Param2 <Int32>
        Param2 help description
        Param set mentioned previously, scroll up.
        This validator checks that the value could be null.
        This validator allows an emty collection.
        This validator allows an empty string.
        This will cast a script to determine if the inputparameter can be passed.
        The ValidateRange attribute specifies the minimum and maximum values (the range) for the cmdlet parameter argument.
        The input of -param2 should be an integer(number)
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -Param3 <String>
        Param3 help description
        param set mentioned previously, scroll up.
        param regex validation pattern.
        The ValidateLength attribute specifies the minimum and maximum number of characters for a cmdlet parameter argument.
        The input of -param2 should be an string 'textline'.
        The actual parametervalue.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -WhatIf [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -Confirm [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    Inputs to this cmdlet (if any)
    
    
OUTPUTS
    Output from this cmdlet (if any)
    
    
NOTES
    
    
        General notes
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>Get-cExample Example of how to use this cmdlet
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS C:\>Get-cExample -Param1 earth -Param2 5
    
    
    
    
    
    
    
RELATED LINKS

---



### Detailed folder structure###
+---build
+---cExample
|   \---Public
\---Tests
    \---unit


### Contributing ###
*Solvinity Customer Engineering*

### Links ###
**[Git cExample Repo](ssh://solvinity@solvinity.visualstudio.com:22/DefaultCollection/_git/cExample)**
