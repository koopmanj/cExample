<#
.Synopsis
   Get-cExample will show a default module which will display a baseline for our engineers  Short description
.DESCRIPTION
   Get-cExample will help our engineers to just copy a default module and modify the code to their needs Long description
.EXAMPLE
   Get-cExample Example of how to use this cmdlet
.EXAMPLE
   Get-cExample -Param1 earth -Param2 5
.INPUTS
   Inputs to this cmdlet (if any)
.OUTPUTS
   Output from this cmdlet (if any)
.NOTES
   General notes
.COMPONENT
   The component this cmdlet belongs to
.ROLE
   The role this cmdlet belongs to
.FUNCTIONALITY
   The functionality that best describes this cmdlet
#>
function Get-cExample                                         #For a valid verb(get/set/..) check get-verb pick one that match the purpose of your function, for the Noun start with a 'c' so we will never end up with conflicting functions which deliver slightly different expectations, and keep it singular.
{
    [CmdletBinding(DefaultParameterSetName='Parameter Set 1', #Parametersets will be usefull if your function will require different input depending on the parameter used.
                  SupportsShouldProcess=$true,                #This call is used to request confirmation from the user before the operation is performed. This property is introduced in Windows PowerShell 2.0.
                  PositionalBinding=$false,                   #Gets or sets a value that indicates whether to auto-generate appropriate parameter metadata to support positional parameters if the script has not specified multiple parameter sets or positions explicitly via the ParameterAttribute.
                  HelpUri = 'http://www.microsoft.com/',      #..
                  ConfirmImpact='Medium')]                    #Defines the impact level of the action performed by the cmdlet. For example, cmdlets may have a high, medium, or low risk of losing data.
    [Alias()]                                                 #The alias of the param.
    [OutputType([String])]                                    #The type of output the function will return.
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true,                           #This parameter -p1 (alias) or -param1 will require a value.
                   ValueFromPipeline=$true,                   #Gets and sets a Boolean value that indicates whether the parameter can take values from incoming pipeline objects.
                   ValueFromPipelineByPropertyName=$true,     #Gets and sets a Boolean value that indicates that the parameter can take values from a property of the incoming pipeline object that has the same name as this parameter. For example, if the name of the cmdlet or function parameter is userName, the parameter can take values from the userName property of incoming objects.
                   ValueFromRemainingArguments=$false,        #Gets and sets a Boolean value that indicates whether the cmdlet parameter accepts all the remaining command-line arguments that are associated with this parameter.
                   Position=0,                                #The position of the parameter, so -p1 or -param1 should be provided as the first parameter by invoking this function.
                   ParameterSetName='Parameter Set 1',        #Gets or sets the parameter set that is used when Windows PowerShell cannot determine the parameter set to use based on the specified parameters.     
                   HelpMessage="Your message goes here")]     #Provide a ?! or help to retrieve the displaymessage displayed on the left.
        [ValidateNotNull()]                                   #This validator checks that the value is not null.
        [ValidateNotNullOrEmpty()]                            #This validator checks that the value is not null or empty.
        [ValidateCount(0,5)]                                  #The ValidateCount attribute specifies the minimum and maximum number of arguments allowed for a cmdlet parameter.
        [ValidateSet("sun", "moon", "earth")]                 #The ValidateSetAttribute attribute specifies a set of possible values for a cmdlet parameter argument.
        [Alias("p1")]                                         #The alias of the param.
        $Param1,                                              #The actual parametervalue.

        # Param2 help description
        [Parameter(ParameterSetName='Parameter Set 1')]       #Param set mentioned previously, scroll up.
        [AllowNull()]                                         #This validator checks that the value could be null.
        [AllowEmptyCollection()]                              #This validator allows an emty collection.
        [AllowEmptyString()]                                  #This validator allows an empty string.
        [ValidateScript({$true})]                             #This will cast a script to determine if the inputparameter can be passed.
        [ValidateRange(0,5)]                                  #The ValidateRange attribute specifies the minimum and maximum values (the range) for the cmdlet parameter argument.
        [int]                                                 #The input of -param2 should be an integer(number)
        $Param2,

        # Param3 help description
        [Parameter(ParameterSetName='Another Parameter Set')]#param set mentioned previously, scroll up.
        [ValidatePattern("[a-z]*")]                          #param regex validation pattern.
        [ValidateLength(0,15)]                               #The ValidateLength attribute specifies the minimum and maximum number of characters for a cmdlet parameter argument.
        [String]                                             #The input of -param2 should be an string 'textline'.
        $Param3                                              ##The actual parametervalue.
    )

    Begin
    {
        Write-Verbose -Message  "$env:COMPUTERNAME : $(Get-Date) : Congratulations $((whoami).split('\')[1]) you just called the Example function of our company" -Verbose
        Write-Verbose -Message  "$env:COMPUTERNAME : $(Get-Date) : $((whoami).split('\')[1]) This block is used to provide optional one-time pre-processing for the function.`n
                                                     The PowerShell runtime uses the code in this block one time for each instance of the function in the pipeline. " -Verbose
    }
    Process
    {
        if ($pscmdlet.ShouldProcess("Target", "Operation"))
        {
            #
        }
    }
    End
    {
        Write-Verbose -Message  "$env:COMPUTERNAME : $(Get-Date) : $((whoami).split('\')[1]) This block is used to provide optional one-time post-processing for the function." -Verbose
    }
}