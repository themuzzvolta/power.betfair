Function Get-BetfairAccountDetails {
<#
    .SYNOPSIS
    Returns the details relating your account, including your discount rate and Betfair point balance.

    .DESCRIPTION
    Returns the details relating your account, including your discount rate and Betfair point balance.

    .EXAMPLE
    Get-BetfairAccountDetails

    Get-BetfairAccountDetails

#>

    [CmdletBinding()][OutputType('System.Management.Automation.PSObject')]

    Param (

    )

    Begin {

        # Check for auth
        If (-not $Script:BetFair){
            Throw 'Please authenticate to Betfair using the cmdlet "Connect-Betfair"'
        }

        # Using accounts endpoint
        $Path = '/account/json-rpc/v1'

        # Setup the headers
        $Header = @{
            'Content-Type' = 'application/json'
            'Accept' = 'application/json'
            'X-Application' = $BetFair.product
            'X-Authentication' = $BetFair.token
        }

    }

    Process {

        # Dynamically construct the body
        $Body = @{
            jsonrpc = '2.0'
            method  = 'SportsAPING/v1.0/getAccountDetails'
            params  = @{}
        }

        # Put it all together
        $Params = @{
            URI     = $BetFair.uri + $Path
            Method  = 'POST'
            Headers = $Header
            Body    = $Body | ConvertTo-Json -Depth 10
        }

        # Send it
        $Response = Invoke-RestMethod @Params

        # Show me the money
        return $Response.result

    }

}
