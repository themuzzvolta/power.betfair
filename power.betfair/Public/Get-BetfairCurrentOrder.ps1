Function Get-BetfairCurrentOrder {
    <#
    .SYNOPSIS
    Returns a list of dynamic data about markets. Dynamic data includes prices, the status of the market, the status of selections, the traded volume, and the status of any orders you have placed in the market.

    .DESCRIPTION
    Returns a list of dynamic data about markets. Dynamic data includes prices, the status of the market, the status of selections, the traded volume, and the status of any orders you have placed in the market.

    .PARAMETER betIds
    If you ask for orders, restricts the results to orders with the specified bet IDs.
    Omitting this parameter means that all bets will be included in the response.
    Please note: A maximum of 250 betId's can be provided at a time.

    .PARAMETER marketIds
    One or more market ids. The number of markets returned depends on the amount of data you request via the price projection.

    .PARAMETER orderProjection
    The orders you want to receive in the response.

    .PARAMETER customerStrategyRefs
    If you ask for orders, restricts the results to orders matching any of the specified set of customer defined strategies.
    Also, filters which matches by strategy for selections are returned, if partitionMatchedByStrategyRef is true.
    An empty set will be treated as if the parameter has been omitted (or null passed).

    .PARAMETER customerOrderRefs
    Optionally restricts the results to the specified customer order references.

    .PARAMETER dateRange
    Optionally restricts the results to be from/to the specified date, these dates are contextual to the orders being returned.
    and therefore the dates used to filter on will change to placed, matched, voided or settled dates depending on the orderBy.
    This date is inclusive, i.e. if an order was placed on exactly this date (to the millisecond) then it will be included in the results.
    If the from is later than the to, no results will be returned.

    .PARAMETER orderBy
    Specifies how the results will be ordered. If no value is passed in, it defaults to BY_BET.
    Also acts as a filter such that only orders with a valid value in the field being ordered by will be returned.
    (i.e. BY_VOID_TIME returns only voided orders, BY_SETTLED_TIME (applies to partially settled markets).
     returns only settled orders and BY_MATCH_TIME returns only orders with a matched date (voided, settled, matched orders)).

    .PARAMETER fromRecord
    from as a hashtable

    .PARAMETER includeItemDescription
    Include description

    .PARAMETER recordCount
    Include recordCount

    .PARAMETER sortDir
    Include sortDir

    .EXAMPLE
    Get-BetfairCurrentOrder

    Get-BetfairCurrentOrder -marketIds "1477", "1566"

    .NOTES
    General notes
    #>

    [CmdletBinding()][OutputType('System.Management.Automation.PSObject')]

    Param (

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String[]]$betIds,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String[]]$marketIds,

        [parameter(Mandatory=$false)]
        [ValidateSet('ALL','EXECUTABLE','EXECUTION_COMPLETE')]
        [String]$orderProjection,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String[]]$customerOrderRefs,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String[]]$customerStrategyRefs,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [hashtable]$dateRange,

        [parameter(Mandatory=$false)]
        [ValidateSet('BY_BET','BY_MARKET','BY_MATCH_TIME','BY_PLACE_TIME','BY_SETTLED_TIME','BY_VOID_TIME')]
        [String]$orderBy,

        [parameter(Mandatory=$false)]
        [ValidateSet('EARLIEST_TO_LATEST','LATEST_TO_EARLIEST')]
        [String]$sortDir,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [int]$fromRecord,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [int]$recordCount,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [boolean]$includeItemDescription

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
        method  = "SportsAPING/v1.0/listCurrentOrders"
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
