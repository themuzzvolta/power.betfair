Function Get-BetfairAccountFunds {
<#
    .SYNOPSIS
    Returns the available to bet amount, exposure and commission information.

    .DESCRIPTION
    Returns the available to bet amount, exposure and commission information.

    .PARAMETER wallet
    Name of the wallet in question. Global wallet is returned by default

    .EXAMPLE
    Get-BetfairAccountFunds

    Get-BetfairAccountFunds -wallet "UK"

#>

    [CmdletBinding()][OutputType('System.Management.Automation.PSObject')]

    Param (

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String]$wallet = 'UK'
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
            method  = 'AccountAPING/v1.0/getAccountFunds'
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
