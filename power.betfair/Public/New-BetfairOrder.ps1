Function New-BetfairOrder {
<#
    .SYNOPSIS
    Places an order on the Betfair Exchange.

    .DESCRIPTION
    This function places an order on the Betfair Exchange by making a JSON-RPC request to the Betfair API. It requires market ID, selection ID, side, order type, price, and size as mandatory parameters. Persistence type is optional with a default value of 'LAPSE'.

    .PARAMETER marketId
    The ID of the market where the order will be placed.

    .PARAMETER selectionId
    The ID of the selection (runner) for the bet.

    .PARAMETER side
    The side of the bet, either 'BACK' or 'LAY'.

    .PARAMETER orderType
    The type of the order, usually 'LIMIT'.

    .PARAMETER price
    The price at which the bet will be placed.

    .PARAMETER size
    The size (amount) of the bet.

    .PARAMETER persistenceType
    (Optional) The persistence type for the bet, e.g., 'LAPSE', 'PERSIST', or 'MARKET_ON_CLOSE'. Default is 'LAPSE'.

    .PARAMETER CustomerStrategyRef
    (Optional) A custom tag for the bet based on strategy. Limited to 15 characters.

    .PARAMETER handicap
    (Optional) A handicap.

    .PARAMETER instructions
    Custom object to place betfair order.

    .EXAMPLE
    New-BetfairOrder -marketId "1.23456789" -selectionId "98765432" -side "BACK" -orderType "LIMIT" -price 2.0 -size 10

    New-BetfairOrder -marketId "1.23456789" -selectionId "98765432" -side "LAY" -orderType "LIMIT" -price 3.5 -size 5 -persistenceType "PERSIST"

    # Example usage:
    $instruction = [placeInstruction]::new()
    $instruction.orderType = "LIMIT"
    $instruction.selectionId = 123456789
    $instruction.handicap = 0.0
    $instruction.side = [side]::BACK
    $instruction.limitOrder = [limitOrder]::new()
    $instruction.limitOrder.size = 10.0
    $instruction.limitOrder.price = 2.5
    $instruction.limitOrder.persistenceType = "LAPSE"
    $instruction.customerOrderRef = "ABC123"
    $instruction.timeInForce = [TimeInForce]::GOOD_TILL_CANCELLED
    $instruction.minFillSize = 5.0
    $instruction.betTargetType = [BetTargetType]::BACKERS_PROFIT

    New-BetfairOrder -marketId "1.23456789" -instructions @($instructions)


#>

    [CmdletBinding()][OutputType('System.Management.Automation.PSObject')]

    Param (

        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [String]$marketId,

        [parameter(Mandatory=$true, ParameterSetName='HelperParam')]
        [ValidateSet('LIMIT','LIMIT_ON_CLOSE','MARKET_ON_CLOSE')]
        [String]$orderType,

        [parameter(Mandatory=$false, ParameterSetName='HelperParam')]
        [ValidateNotNullOrEmpty()]
        [double]$handicap,

        [parameter(Mandatory=$true, ParameterSetName='HelperParam')]
        [ValidateNotNullOrEmpty()]
        [string]$selectionId,

        [parameter(Mandatory=$true, ParameterSetName='HelperParam')]
        [ValidateSet('BACK','LAY')]
        [String]$side,

        [parameter(Mandatory=$true, ParameterSetName='HelperParam')]
        [ValidateNotNullOrEmpty()]
        [double]$price,

        [parameter(Mandatory=$true, ParameterSetName='HelperParam')]
        [ValidateNotNullOrEmpty()]
        [double]$size,

        [parameter(Mandatory=$true, ParameterSetName='HelperParam')]
        [ValidateSet('LAPSE','PERSIST','MARKET_ON_CLOSE')]
        [string]$persistenceType = 'LAPSE',

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String]$customerStrategyRef,

        [parameter(Mandatory=$true, ParameterSetName='ClassParam')]
        [ValidateNotNullOrEmpty()]
        [array]$instructions

    )

    # Check for auth
    If (-not $Script:BetFair){
        Throw 'Please authenticate to Betfair using the cmdlet "Connect-Betfair"'
    }

    # Using Betting endpoint
    $Path = '/betting/json-rpc/v1'

    # Setup the headers
    $Header = @{
        'Content-Type' = 'application/json'
        'Accept' = 'application/json'
        'X-Application' = $BetFair.product
        'X-Authentication' = $BetFair.token
        'Accept-Encoding' = 'gzip, deflate'
    }


    # Params to iterate through if using HelperParams
    $base = 'marketId','customerStrategyRef'
    $instruction = 'selectionId','handicap','side','orderType'
    $limitOrder = 'price','size','persistenceType'

    # Dynamically construct the body

    $Body = @{
        params = @{
            instructions = @(
                @{
                    limitOrder = @{
                    }
                }
            )
        }
    }

    $PSBoundParameters.GetEnumerator().ForEach({
        If($_.key -in $base){
            $Body.params.Add($_.Key, $_.Value)
        }
    })


    $PSBoundParameters.GetEnumerator().ForEach({
        If($_.key -in $instruction){
            $Body.params.instructions[0].Add($_.Key, $_.Value)
        }
    })

    $PSBoundParameters.GetEnumerator().ForEach({
        If($_.key -in $limitOrder){
            $Body.params.instructions[0].limitOrder.Add($_.Key, $_.Value)
        }
    })




    # Setup base params
    $Body.Add('jsonrpc','2.0')
    $Body.Add('method','SportsAPING/v1.0/placeOrders')

    $Body|ConvertTo-Json -Depth 10

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
    return $Response.result

}
