Function Get-BetfairAppKey {
<#
    .SYNOPSIS
    Get all application keys owned by the given developer/vendor

    .DESCRIPTION
    Get all application keys owned by the given developer/vendor

    .EXAMPLE
    Get-BetfairAppKey

    Get-BetfairAppKey

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
            'Accept-Encoding' = 'gzip, deflate'
        }

    }

    Process {

        # Dynamically construct the body
        $Body = @{
            jsonrpc = '2.0'
            method  = 'SportsAPING/v1.0/getDeveloperAppKeys'
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
