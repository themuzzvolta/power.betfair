---
external help file: power.betfair-help.xml
Module Name: power.betfair
online version:
schema: 2.0.0
---

# Remove-BetfairOrder

## SYNOPSIS
Cancels orders on the Betfair Exchange market.

## SYNTAX

### HelperParam
```
Remove-BetfairOrder [-marketId <String>] [-betId <String>] [-sizeReduction <Double>] [-customerRef <String>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### ClassParam
```
Remove-BetfairOrder [-marketId <String>] [-customerRef <String>] [-instructions <Array>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
This function cancels all bets, all bets on a specific market, or fully/partially cancels particular orders on a market.
Only LIMIT orders can be canceled or partially canceled once placed.

## EXAMPLES

### EXAMPLE 1
```
Remove-BetfairOrder -marketId "1.23456789" -instructions $instructions
```

Remove-BetfairOrder -marketId "1.23456789"

Remove-BetfairOrder -customerRef "uniqueRef123"

## PARAMETERS

### -marketId
The ID of the market.
If marketId and betId aren't supplied, all bets are canceled.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -betId
Optional - the unique bet ID.

```yaml
Type: String
Parameter Sets: HelperParam
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -sizeReduction
Optional - The amount to reduce from the order.

```yaml
Type: Double
Parameter Sets: HelperParam
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -customerRef
Optional parameter allowing the client to pass a unique string (up to 32 chars) that is used to de-dupe mistaken re-submissions.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -instructions
List of instructions for cancellation.
All instructions need to be on the same market.
If not supplied, all unmatched bets on the market (if market id is passed) are fully canceled.
The limit of cancel instructions per request is 60.

```yaml
Type: Array
Parameter Sets: ClassParam
Aliases:

Required: False
Position: Named
Default value: None
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

## RELATED LINKS
