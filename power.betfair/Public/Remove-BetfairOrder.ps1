Function Remove-BetfairOrder {
<#
    .SYNOPSIS
    Cancels orders on the Betfair Exchange market.

    .DESCRIPTION
    This function cancels all bets, all bets on a specific market, or fully/partially cancels particular orders on a market. Only LIMIT orders can be canceled or partially canceled once placed.

    .PARAMETER marketId
    The ID of the market. If marketId and betId aren't supplied, all bets are canceled.

    .PARAMETER instructions
    List of instructions for cancellation. All instructions need to be on the same market. If not supplied, all unmatched bets on the market (if market id is passed) are fully canceled. The limit of cancel instructions per request is 60.

    .PARAMETER customerRef
    Optional parameter allowing the client to pass a unique string (up to 32 chars) that is used to de-dupe mistaken re-submissions.

    .PARAMETER betId
    Optional - the unique bet ID.

    .PARAMETER sizeReduction
    Optional - The amount to reduce from the order .

    .EXAMPLE
    Remove-BetfairOrder -marketId "1.23456789" -instructions $instructions

    Remove-BetfairOrder -marketId "1.23456789"

    Remove-BetfairOrder -customerRef "uniqueRef123"

#>

    [CmdletBinding()][OutputType('System.Management.Automation.PSObject')]

    Param (

        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String]$marketId,

        [parameter(Mandatory=$false, ParameterSetName='HelperParam')]
        [ValidateNotNullOrEmpty()]
        [string]$betId,

        [parameter(Mandatory=$false, ParameterSetName='HelperParam')]
        [ValidateNotNullOrEmpty()]
        [double]$sizeReduction,

        [parameter(Mandatory=$false)]
        [String]$customerRef,

        [parameter(Mandatory=$false, ParameterSetName='ClassParam')]
        [ValidateNotNullOrEmpty()]
        [array]$instructions

    )

    Begin {

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
        }

    }

    Process {

        # Params to iterate through if using HelperParams
        $base = 'marketId','customerRef'
        $instruction = 'betId','sizeReduction'

        # Dynamically construct the body
        Switch ($PSCmdlet.ParameterSetName){
            'ClassParam' {
                $Body = @{
                    params = @{}
                }
                $PSBoundParameters.GetEnumerator() | ForEach-Object {
                    $Body.params.Add($_.Key, $_.Value)
                }
            }
            'HelperParam' {
                $Body = @{
                    params = @{
                        instructions = @(
                            @{ }
                        )
                    }
                }
                $PSBoundParameters.GetEnumerator()  | Where-Object {$_.Key -contains $base} | ForEach-Object {
                    $Body.params.Add($_.Key, $_.Value)
                }
                $PSBoundParameters.GetEnumerator()  | Where-Object {$_.Key -contains $instruction} | ForEach-Object {
                    $Body.params.instructions.Add($_.Key, $_.Value)
                }
            }
        }

        # Setup base params
        $Body.Add('jsonrpc','2.0')
        $Body.Add('method','SportsAPING/v1.0/cancelOrders')

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
