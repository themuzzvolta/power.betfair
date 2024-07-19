Function Connect-BetFairAccount {
    <#
    .SYNOPSIS
    Function for creating an authenticated session to BetFair

    .DESCRIPTION
    The API login endpoint is the simplest method of integration for most applications in terms of expected development time.
    It will allow a user to provide a username and password or a username and (password + 2 factor auth code) if they have strong authentication enabled.

    .PARAMETER Username
    The BetFair username

    .PARAMETER Password
    The password for the specified user

    .PARAMETER APIKey
    The API Key value

    .EXAMPLE
    Connect-BetFairAccount -Username "john.snow@got.com" -Password $secureString -APIKey $apiKey

    Connect-BetFairAccount -Username "john.snow@got.com" -Password $secureString -APIKey $apiKey

    .NOTES
    General notes
    #>

    [CmdletBinding(DefaultParameterSetName="Username")][OutputType('System.Management.Automation.PSObject')]

    Param (

        [parameter(Mandatory=$true,ParameterSetName="Username")]
        [ValidateNotNullOrEmpty()]
        [String]$Username,

        [parameter(Mandatory=$true,ParameterSetName="Username")]
        [ValidateNotNullOrEmpty()]
        [SecureString]$Password,

        [Parameter(Mandatory=$true,ParameterSetName="Username")]
        [ValidateNotNullOrEmpty()]
        [String]$APIKey

    )

     # Convert Secure Credentials to a format for sending in the payload
     Switch ($PSCmdlet.ParameterSetName){
        'Username' {
            $JsonPass = (New-Object System.Management.Automation.PSCredential("username", $Password)).GetNetworkCredential().Password
        }
     }

    # Setup the headers
    $Header = @{
        'Content-Type' = 'application/x-www-form-urlencoded'
        'Accept' = 'application/json'
        'X-Application' = $APIKey
    }

    # Define the payload
    $Body = @{
        username    = $Username
        password    = $JsonPass
    }

    # Put it all together
    $Params = @{
        URI     = 'https://identitysso.betfair.com/api/login'
        Method  = 'POST'
        Headers = $Header
        Body    = $Body
    }

    # Send it
    $Response = Invoke-RestMethod @Params

    # Create a scoped variable to be re-used in subsequent API calls
    $Script:BetFair = @{
        uri          = 'https://api.betfair.com/exchange'
        token           = $Response.token
        product         = $Response.product
        status          = $Response.status
    }

    If($Response.status -ne "SUCCESS"){
        $BetFair.Add('error',$Response.error)
    }

    # Show me the money
    return [psCustomObject]$BetFair

}
