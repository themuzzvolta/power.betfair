Function New-BetfairAppKey {
<#
    .SYNOPSIS
    Create 2 Application Keys for a given user; one 'Delayed and the other 'Live'.

    .DESCRIPTION
    Create 2 Application Keys for a given user; one 'Delayed and the other 'Live'. You must apply to have your 'Live' App Key activated.
    Please Note:  The appName must be unique and cannot contain your username. A UNEXPECTED_ERROR will be returned in these circumstances.

    .PARAMETER appName
    A Display name for the application.

    .EXAMPLE
    New-BetfairAppKey -appName "BACK_TO_LAY_STRATEGY"

    New-BetfairAppKey -appName "ARBITRAGE_STRATEGY"

#>

    [CmdletBinding()][OutputType('System.Management.Automation.PSObject')]

    Param (

        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [String]$appName
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
            method  = 'SportsAPING/v1.0/createDeveloperAppKeys'
            params  = @{}
        }

        $PSBoundParameters.GetEnumerator() | ForEach-Object {
            $Body.params.Add($_.Key, $_.Value)
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
