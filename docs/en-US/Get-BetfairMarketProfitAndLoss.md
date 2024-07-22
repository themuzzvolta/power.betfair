---
external help file: power.betfair-help.xml
Module Name: power.betfair
online version:
schema: 2.0.0
---

# Get-BetfairMarketProfitAndLoss

## SYNOPSIS
Retrieve profit and loss for a given list of OPEN markets.
The values are calculated using matched bets and optionally settled bets.
Only odds (MarketBettingType = ODDS) markets  are implemented, markets of other types are silently ignored.

## SYNTAX

```
Get-BetfairMarketProfitAndLoss [[-marketIds] <String[]>] [[-includeSettledBets] <Boolean>]
 [[-includeBspBets] <Boolean>] [[-netOfCommission] <Boolean>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Retrieve profit and loss for a given list of OPEN markets.
The values are calculated using matched bets and optionally settled bets.
Only odds (MarketBettingType = ODDS) markets  are implemented, markets of other types are silently ignored.

## EXAMPLES

### EXAMPLE 1
```
Get-BetfairMarketProfitAndLoss
```

Get-BetfairMarketProfitAndLoss -marketIds "1477", "1566"

## PARAMETERS

### -marketIds
One or more market ids.
The number of markets returned depends on the amount of data you request via the price projection.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -includeSettledBets
Option to include settled bets (partially settled markets only).
Defaults to false if not specified.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -includeBspBets
Option to include BSP bets.
Defaults to false if not specified.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -netOfCommission
Option to return profit and loss net of users current commission rate for this market including any special tariffs.
Defaults to false if not specified.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Management.Automation.PSObject
## NOTES
General notes

## RELATED LINKS
