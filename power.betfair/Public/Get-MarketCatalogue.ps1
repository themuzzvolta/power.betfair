Function Get-MarketCatalogue {
    <#
    .SYNOPSIS
    Returns a list of information about published (ACTIVE/SUSPENDED) markets that does not change (or changes very rarely).

    .DESCRIPTION
    Returns a list of information about published (ACTIVE/SUSPENDED) markets that does not change (or changes very rarely).
    You use listMarketCatalogue to retrieve the name of the market, the names of selections and other information about markets.
    Market Data Request Limits apply to requests made to listMarketCatalogue.
    Please note: listMarketCatalogue does not return markets that are CLOSED.

    .PARAMETER textQuery
    Restrict markets by any text associated with the Event name.
    You can include a wildcard (*) character as long as it is not the first character.
    Please note - the textQuery field doesn't evaluate market or selection names.

    .PARAMETER eventTypeIds
    Restrict markets by event type associated with the market. (i.e., Football, Hockey, etc)

    .PARAMETER eventIds
    Restrict markets by the event id associated with the market.

    .PARAMETER competitionIds
    Restrict markets by the competitions associated with the market.

    .PARAMETER marketIds
    Restrict markets by the market id associated with the market.

    .PARAMETER venues
    Restrict markets by the venue associated with the market. Currently, only Horse & Greyhound racing markets have venues.

    .PARAMETER bspOnly
    Restrict to bsp markets only, if True or non-bsp markets if False. If not specified then returns both BSP and non-BSP markets

    .PARAMETER turnInPlayEnabled
    Restrict to markets that will turn in play if True or will not turn in play if false. If not specified, returns both.

    .PARAMETER inPlayOnly
    Restrict to markets that are currently in play if True or are not currently in play if false. If not specified, returns both.

    .PARAMETER marketBettingTypes
    Restrict to markets that match the betting type of the market (i.e. Odds, Asian Handicap Singles, Asian Handicap Doubles or Line)

    .PARAMETER marketCountries
    Restrict to markets that are in the specified country or countries.  Please note: the default value is 'GB' when the correct country code cannot be determined.

    .PARAMETER marketTypeCodes
    Restrict to markets that match the type of the market (i.e., MATCH_ODDS, HALF_TIME_SCORE).
    You should use this instead of relying on the market name as the market type codes are the same in all locales.
    Please note: All market types are available via the listMarketTypes operations

    .PARAMETER marketStartTime
    Restrict to markets with a market start time before or after the specified date

    .PARAMETER withOrders
    Restrict to markets where I have one or more orders in these states.

    .PARAMETER raceTypes
    Restrict to markets of a specific raceType.
    Valid values are - Harness, Flat, Hurdle, Chase, Bumper, NH Flat, Steeple (AUS/NZ races), and NO_VALUE (when no valid race type has been mapped).

    .EXAMPLE
    Get-MarketCatalogue -textQuery "AU"

    Get-MarketCatalogue -textQuery "AU"

    .NOTES
    General notes
    #>

    [CmdletBinding()][OutputType('System.Management.Automation.PSObject')]

    Param (

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String]$textQuery,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String[]]$eventTypeIds,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String[]]$eventIds,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String[]]$competitionIds,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String[]]$marketIds,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String[]]$venues,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [Boolean]$bspOnly,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [Boolean]$turnInPlayEnabled,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [Boolean]$inPlayOnly,

        [parameter(Mandatory=$false)]
        [ValidateSet('ODDS', 'LINE', 'ASIAN_HANDICAP_DOUBLE_LINE', 'ASIAN_HANDICAP_SINGLE_LINE', 'FIXED_ODDS')]
        [String[]]$marketBettingTypes,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String[]]$marketCountries,

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String[]]$marketTypeCodes,

        [parameter(Mandatory=$false,
        HelpMessage="@{from = [datetime]`$from; to = [datetime]`$to}")]
        [hashtable]$marketStartTime,

        [parameter(Mandatory=$false)]
        [ValidateSet('PENDING', 'EXECUTION_COMPLETE', 'EXECUTABLE', 'EXPIRED')]
        [String[]]$withOrders,

        [parameter(Mandatory=$false)]
        [ValidateSet('Harness', 'Flat', 'Hurdle', 'Chase', 'Bumper', 'NH Flat', 'Steeple (AUS/NZ races)', 'NO_VALUE')]
        [String[]]$raceTypes

    )

    $Path = '/betting/rest/v1.0/listMarketCatalogue/'

    # Setup the headers
    $Header = @{
        'Content-Type' = 'application/json'
        'Accept' = 'application/json'
        'X-Application' = $BetFair.product
        'X-Authentication' = $BetFair.token
    }

    $marketProjection = @('COMPETITION','EVENT','EVENT_TYPE','MARKET_START_TIME','MARKET_DESCRIPTION','RUNNER_DESCRIPTION','RUNNER_METADATA')

    # Dynamically construct the body
    $Body = @{
        filter = @{
        }
        marketProjection = $marketProjection
        maxResults = 1000
    }

    $PSBoundParameters.GetEnumerator() | ForEach-Object {
        $Body.filter.Add($_.Key, $_.Value)
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
