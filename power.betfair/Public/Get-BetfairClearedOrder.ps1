Function Get-BetfairClearedOrder {
    <#
    .SYNOPSIS
    Returns a list of settled bets based on the bet status, ordered by settled date.
    To retrieve more than 1000 records, you need to make use of the fromRecord and recordCount parameters.

    .DESCRIPTION
    Returns a list of settled bets based on the bet status, ordered by settled date.
    To retrieve more than 1000 records, you need to make use of the fromRecord and recordCount parameters.

    .PARAMETER betStatus
    Restricts the results to the specified status.

    .PARAMETER eventTypeIds
    Optionally restricts the results to the specified Event Type IDs.

    .PARAMETER eventIds
    Optionally restricts the results to the specified Event IDs.

    .PARAMETER betIds
    If you ask for orders, restricts the results to orders with the specified bet IDs.
    Omitting this parameter means that all bets will be included in the response.
    Please note: A maximum of 250 betId's can be provided at a time.

    .PARAMETER marketIds
    One or more market ids. The number of markets returned depends on the amount of data you request via the price projection.

    .PARAMETER runnerIds
    Optionally restricts the results to the specified Runners.

    .PARAMETER customerStrategyRefs
    If you ask for orders, restricts the results to orders matching any of the specified set of customer defined strategies.
    Also, filters which matches by strategy for selections are returned, if partitionMatchedByStrategyRef is true.
    An empty set will be treated as if the parameter has been omitted (or null passed).

    .PARAMETER customerOrderRefs
    Optionally restricts the results to the specified customer order references.

    .PARAMETER side
    Optionally restricts the results to the specified side.

    .PARAMETER settledDateRange
    Optionally restricts the results to be from/to the specified settled date. This date is inclusive, i.e.
    if an order was cleared on exactly this date (to the millisecond) then it will be included in the results.
    If the from is later than the to, no results will be returned.

    .PARAMETER groupBy
    How to aggregate the lines, if not supplied then the lowest level is returned, i.e. bet by bet This is only applicable to SETTLED BetStatus.

    .PARAMETER includeItemDescription
    If true then an ItemDescription object is included in the response.

    .PARAMETER locale
    The language used for the itemDescription. If not specified, the customer account default is returned.

    .PARAMETER fromRecord
    Specifies the first record that will be returned. Records start at index zero.

    .PARAMETER recordCount
    Specifies how many records will be returned, from the index position 'fromRecord'.
    Note that there is a page size limit of 1000. A value of zero indicates that you would like all records (including and from 'fromRecord') up to the limit.

    .EXAMPLE
    Get-BetfairClearedOrder

    Get-BetfairClearedOrder -marketIds "1477", "1566"

    .NOTES
    General notes
    #>

    [CmdletBinding()][OutputType('System.Management.Automation.PSObject')]

    Param (

        [parameter(Mandatory=$false)]
        [ValidateSet('SETTLED','VOIDED','LAPSED','CANCELLED')]
        [String]$betStatus,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String[]]$eventTypeIds,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String[]]$eventIds,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String[]]$marketIds,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String[]]$runnerIds,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String[]]$betIds,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String[]]$customerOrderRefs,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String[]]$customerStrategyRefs,

        [parameter(Mandatory=$false)]
        [ValidateSet('BACK','LAY')]
        [string]$side,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [hashtable]$settledDateRange,

        [parameter(Mandatory=$false)]
        [ValidateSet('EVENT_TYPE','EVENT','MARKET','SIDE','BET')]
        [String]$groupBy,

        [parameter(Mandatory=$false)]
        [String]$locale,

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
    }

    # Setup base params
    $Body = @{
        jsonrpc = "2.0"
        method  = "SportsAPING/v1.0/listClearedOrders"
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
