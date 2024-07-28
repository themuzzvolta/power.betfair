Function Get-BetfairRunnerBook {
    <#
    .SYNOPSIS
    Returns a list of dynamic data about a market and a specified runner.
    Dynamic data includes prices, the status of the market, the status of selections, the traded volume, and the status of any orders you have placed in the market..

    .DESCRIPTION
    Returns a list of dynamic data about a market and a specified runner.
    Dynamic data includes prices, the status of the market, the status of selections, the traded volume, and the status of any orders you have placed in the market..

    .PARAMETER marketId
    The unique id for the market..

    .PARAMETER selectionId
    The unique id for the runnner..

    .PARAMETER handicap
    The handicap associated with the runner in case of Asian handicap market.

    .PARAMETER priceProjection
    The projection of price data you want to receive in the response.

    .PARAMETER orderProjection
    The orders you want to receive in the response.

    .PARAMETER matchProjection
    If you ask for orders, specifies the representation of matches.

    .PARAMETER includeOverallPosition
    If you ask for orders, returns matches for each selection. Defaults to true if unspecified.

    .PARAMETER partitionMatchedByStrategyRef
    If you ask for orders, returns the breakdown of matches by strategy for each selection. Defaults to false if unspecified.

    .PARAMETER customerStrategyRefs
    If you ask for orders, restricts the results to orders matching any of the specified set of customer defined strategies.
    Also, filters which matches by strategy for selections are returned, if partitionMatchedByStrategyRef is true.
    An empty set will be treated as if the parameter has been omitted (or null passed).

    .PARAMETER currencyCode
    A Betfair standard currency code. If not specified, the default currency code is used.

    .PARAMETER locale
    The language used for the response. If not specified, the default is returned.

    .PARAMETER matchedSince
    If you ask for orders, restricts the results to orders that have at least one fragment matched since.
    the specified date (all matched fragments of such an order will be returned even if some were matched before the specified date).
    All EXECUTABLE orders will be returned regardless of matched date.

    .PARAMETER betIds
    If you ask for orders, restricts the results to orders with the specified bet IDs.
    Omitting this parameter means that all bets will be included in the response.
    Please note: A maximum of 250 betId's can be provided at a time.

    .EXAMPLE
    Get-BetfairRunnerBook -marketId "1477" -selectionId "1566"

    Get-BetfairRunnerBook -marketId "1477" -selectionId "1566"

    .NOTES
    General notes.
    #>

    [CmdletBinding()][OutputType('System.Management.Automation.PSObject')]

    Param (

        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [String]$marketId,

        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [String]$selectionId,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [double]$handicap,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [hashtable]$priceProjection,

        [parameter(Mandatory=$false)]
        [ValidateSet('ALL','EXECUTABLE','EXECUTION_COMPLETE')]
        [String]$orderProjection,

        [parameter(Mandatory=$false)]
        [ValidateSet('NO_ROLLUP','ROLLED_UP_BY_PRICE','ROLLED_UP_BY_AVG_PRICE')]
        [String]$matchProjection,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [Boolean]$includeOverallPosition,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [Boolean]$partitionMatchedByStrategyRef,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String[]]$customerStrategyRefs,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String]$currencyCode,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String]$locale,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [datetime]$matchedSince,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String[]]$betIds

    )

    # Check for auth
    If (-not $Script:BetFair){
        Throw 'Please authenticate to Betfair using the cmdlet "Connect-Betfair"'
    }

    # Use Betting endpoint
    $Path = '/betting/json-rpc/v1'

    # Setup the headers
    $Header = @{
        'Content-Type' = 'application/json'
        'Accept' = 'application/json'
        'X-Application' = $BetFair.product
        'X-Authentication' = $BetFair.token
        'Accept-Encoding' = 'gzip, deflate'
    }

    # Setup base params
    $Body = @{
        jsonrpc = "2.0"
        method  = "SportsAPING/v1.0/listRunnerBook"
        params  = @{}
    }

    # Dynamically construct the body
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
