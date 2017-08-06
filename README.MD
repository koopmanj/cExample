## cExample ##
This **cExample** module contains 3 functions that should provide assistance for automation purposes.

### Functions ###
The functions this modules contains coexist of the following names:

Copy-cModuleStructure
Get-cExample
Show-cModuleStructure



### Installation ###
The installation of this module can be achieved by registering a NuGet repository:

*register-psrepository -name reponame -sourcelocation "http://repourl/nuget" -publishLocation "http://repourl/nuget" -installationPolicy trusted*

*find-module -name cExample*

*-or*

*find-module -name cExample -repository reponame*


### Detailed information about the functions###

NAME
    Copy-cModuleStructure
    
SYNOPSIS
    Copy-cModuleStructure will copy this module to a destination module folder.
    
    
SYNTAX
    Copy-cModuleStructure [-ModuleName] <String> [-FunctionName] <String> [<CommonParameters>]
    
    
DESCRIPTION
    Copy-cModuleStructure will copy this module to a new modulename and remove the markdown, manifest, .git relations 
    afterwards.
    

PARAMETERS
    -ModuleName <String>
        Parameter help description
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -FunctionName <String>
        [ValidateScript({((get-verb).verb) -contains ($FunctionName.split('-')[0])})]
        
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>Copy-cModuleStructure -ModuleName cExample -FunctionName get-cNewCar
    
    
    
    
    
    
    
RELATED LINKS

---

NAME
    Get-cExample
    
SYNOPSIS
    Get-cExample will show a default module which will display a baseline for our engineers (Short description)
    
    
SYNTAX
    Get-cExample [-Param1] <Object> [-Param2 <Int32>] [-WhatIf] [-Confirm] [<CommonParameters>]
    
    Get-cExample [-Param3 <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
    
    
DESCRIPTION
    Get-cExample will help our engineers to just copy a default module and modify the code to their needs Long 
    description
    

PARAMETERS
    -Param1 <Object>
        Param1 help description
        This parameter -p1 (alias) or -param1 will require a value.
        Gets and sets a Boolean value that indicates whether the parameter can take values from incoming pipeline 
        objects.
        Gets and sets a Boolean value that indicates that the parameter can take values from a property of the 
        incoming pipeline object that has the same name as this parameter. For example, if the name of the cmdlet or 
        function parameter is userName, the parameter can take values from the userName property of incoming objects.
        Gets and sets a Boolean value that indicates whether the cmdlet parameter accepts all the remaining 
        command-line arguments that are associated with this parameter.
        The position of the parameter, so -p1 or -param1 should be provided as the first parameter by invoking this 
        function.
        Gets or sets the parameter set that is used when Windows PowerShell cannot determine the parameter set to use 
        based on the specified parameters.     
        Provide a ?! or help to retrieve the displaymessage displayed on the left.
        This validator checks that the value is not null.
        This validator checks that the value is not null or empty.
        The ValidateCount attribute specifies the minimum and maximum number of arguments allowed for a cmdlet 
        parameter.
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
        The ValidateRange attribute specifies the minimum and maximum values (the range) for the cmdlet parameter 
        argument.
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
        The ValidateLength attribute specifies the minimum and maximum number of characters for a cmdlet parameter 
        argument.
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
    
    PS C:\>Get-cExample -Param1 earth -Param2 5
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS C:\>Get-cExample -Param1 earth -Param2 4
    
    
    
    
    
    
    
RELATED LINKS

---

NAME
    Show-cModuleStructure
    
SYNOPSIS
    Show-cModuleStructure will visualize and explain basic module structure.
    
    
SYNTAX
    Show-cModuleStructure [<CommonParameters>]
    
    
DESCRIPTION
    Show-cModuleStructure will show the basic information about the directory structure chosen for easy to maintain 
    and default module development.
    

PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>Show-cModuleStructure
    
    
    
    
    
    
    
RELATED LINKS

---



### Detailed folder structure###
+---.git
|   +---hooks
|   +---info
|   +---logs
|   |   \---refs
|   |       +---heads
|   |       \---remotes
|   |           +---github
|   |           +---gitlab
|   |           +---pgithub
|   |           \---vso
|   +---objects
|   |   +---00
|   |   +---01
|   |   +---03
|   |   +---04
|   |   +---06
|   |   +---09
|   |   +---0a
|   |   +---0b
|   |   +---0c
|   |   +---0f
|   |   +---10
|   |   +---12
|   |   +---13
|   |   +---14
|   |   +---15
|   |   +---17
|   |   +---18
|   |   +---1a
|   |   +---1b
|   |   +---1c
|   |   +---1d
|   |   +---1e
|   |   +---1f
|   |   +---20
|   |   +---22
|   |   +---23
|   |   +---25
|   |   +---26
|   |   +---27
|   |   +---28
|   |   +---29
|   |   +---2a
|   |   +---2b
|   |   +---2d
|   |   +---2e
|   |   +---2f
|   |   +---31
|   |   +---35
|   |   +---36
|   |   +---38
|   |   +---39
|   |   +---3a
|   |   +---3b
|   |   +---3c
|   |   +---3f
|   |   +---40
|   |   +---41
|   |   +---42
|   |   +---43
|   |   +---44
|   |   +---45
|   |   +---46
|   |   +---47
|   |   +---49
|   |   +---4a
|   |   +---4b
|   |   +---4d
|   |   +---4e
|   |   +---51
|   |   +---52
|   |   +---53
|   |   +---54
|   |   +---55
|   |   +---56
|   |   +---59
|   |   +---5a
|   |   +---5e
|   |   +---5f
|   |   +---64
|   |   +---65
|   |   +---68
|   |   +---69
|   |   +---70
|   |   +---71
|   |   +---74
|   |   +---75
|   |   +---77
|   |   +---79
|   |   +---7a
|   |   +---7b
|   |   +---7d
|   |   +---7e
|   |   +---82
|   |   +---83
|   |   +---85
|   |   +---86
|   |   +---87
|   |   +---88
|   |   +---89
|   |   +---8a
|   |   +---8c
|   |   +---8d
|   |   +---8e
|   |   +---8f
|   |   +---90
|   |   +---91
|   |   +---92
|   |   +---93
|   |   +---94
|   |   +---95
|   |   +---97
|   |   +---98
|   |   +---9a
|   |   +---9b
|   |   +---9c
|   |   +---9d
|   |   +---9e
|   |   +---a1
|   |   +---a4
|   |   +---a5
|   |   +---a7
|   |   +---a8
|   |   +---a9
|   |   +---aa
|   |   +---ac
|   |   +---ad
|   |   +---ae
|   |   +---af
|   |   +---b2
|   |   +---b3
|   |   +---b4
|   |   +---b6
|   |   +---b9
|   |   +---bb
|   |   +---bc
|   |   +---bd
|   |   +---bf
|   |   +---c1
|   |   +---c3
|   |   +---c5
|   |   +---c6
|   |   +---c9
|   |   +---cb
|   |   +---cd
|   |   +---cf
|   |   +---d1
|   |   +---d2
|   |   +---d5
|   |   +---d6
|   |   +---d7
|   |   +---d9
|   |   +---da
|   |   +---db
|   |   +---dc
|   |   +---dd
|   |   +---de
|   |   +---df
|   |   +---e1
|   |   +---e2
|   |   +---e4
|   |   +---e7
|   |   +---e8
|   |   +---e9
|   |   +---ea
|   |   +---eb
|   |   +---ec
|   |   +---ed
|   |   +---ef
|   |   +---f0
|   |   +---f1
|   |   +---f2
|   |   +---f4
|   |   +---f5
|   |   +---f6
|   |   +---f7
|   |   +---f9
|   |   +---fb
|   |   +---fc
|   |   +---fd
|   |   +---fe
|   |   +---ff
|   |   +---info
|   |   \---pack
|   \---refs
|       +---heads
|       +---remotes
|       |   +---github
|       |   +---gitlab
|       |   +---pgithub
|       |   \---vso
|       \---tags
+---build
+---cExample
|   +---Private
|   \---Public
\---Tests
    +---integration
    \---unit


### Contributing ###
*Koopman & Co Engineering*

### Links ###
**[Git cExample Repo](git@github.com:koopmanj/cExample.git)**
