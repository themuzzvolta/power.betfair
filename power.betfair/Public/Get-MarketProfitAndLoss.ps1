Function Get-MarketProfitAndLoss {
    <#
    .SYNOPSIS
    Retrieve profit and loss for a given list of OPEN markets. The values are calculated using matched bets and optionally settled bets.
    Only odds (MarketBettingType = ODDS) markets  are implemented, markets of other types are silently ignored.

    .DESCRIPTION
    Retrieve profit and loss for a given list of OPEN markets. The values are calculated using matched bets and optionally settled bets.
    Only odds (MarketBettingType = ODDS) markets  are implemented, markets of other types are silently ignored.

    .PARAMETER marketIds
    One or more market ids. The number of markets returned depends on the amount of data you request via the price projection.

    .PARAMETER includeSettledBets
    Option to include settled bets (partially settled markets only). Defaults to false if not specified.

    .PARAMETER includeBspBets
    Option to include BSP bets. Defaults to false if not specified.

    .PARAMETER netOfCommission
    Option to return profit and loss net of users current commission rate for this market including any special tariffs. Defaults to false if not specified.

    .EXAMPLE
    Get-MarketProfitAndLoss

    Get-MarketProfitAndLoss -marketIds "1477", "1566"

    .NOTES
    General notes
    #>

    [CmdletBinding()][OutputType('System.Management.Automation.PSObject')]

    Param (

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String[]]$marketIds,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [Boolean]$includeSettledBets,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [Boolean]$includeBspBets,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [Boolean]$netOfCommission

    )

    $Path = '/betting/rest/v1.0/listMarketProfitAndLoss/'

    # Setup the headers
    $Header = @{
        'Content-Type' = 'application/json'
        'Accept' = 'application/json'
        'X-Application' = $BetFair.product
        'X-Authentication' = $BetFair.token
    }

    # Dynamically construct the body
    $Body = @{}

    $PSBoundParameters.GetEnumerator() | ForEach-Object {
        $Body.Add($_.Key, $_.Value)
    }

    # Put it all together
    $Params = @{
        URI     = $BetFair.uri + $Path
        Method  = 'POST'
        Headers = $Header
        Body    = $Body | ConvertTo-Json -Depth 99
    }

    # Send it
    $Response = Invoke-RestMethod @Params

    # Show me the money
    return $Response

}
