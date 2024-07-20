---
external help file: power.betfair-help.xml
Module Name: power.betfair
online version:
schema: 2.0.0
---

# Get-MarketBook

## SYNOPSIS
Returns a list of dynamic data about markets.
Dynamic data includes prices, the status of the market, the status of selections, the traded volume, and the status of any orders you have placed in the market.

## SYNTAX

```
Get-MarketBook [-marketIds] <String[]> [[-priceProjection] <Hashtable>] [[-orderProjection] <String>]
 [[-matchProjection] <String>] [[-includeOverallPosition] <Boolean>]
 [[-partitionMatchedByStrategyRef] <Boolean>] [[-customerStrategyRefs] <String[]>] [[-currencyCode] <String>]
 [[-locale] <String>] [[-matchedSince] <DateTime>] [[-betIds] <String[]>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Returns a list of dynamic data about markets.
Dynamic data includes prices, the status of the market, the status of selections, the traded volume, and the status of any orders you have placed in the market.

## EXAMPLES

### EXAMPLE 1
```
Get-MarketBook -marketIds "1477", "1566"
```

Get-MarketBook -marketIds "1477", "1566"

## PARAMETERS

### -marketIds
One or more market ids.
The number of markets returned depends on the amount of data you request via the price projection.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -priceProjection
The projection of price data you want to receive in the response.

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -orderProjection
The orders you want to receive in the response.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -matchProjection
If you ask for orders, specifies the representation of matches.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -includeOverallPosition
If you ask for orders, returns matches for each selection.
Defaults to true if unspecified.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -partitionMatchedByStrategyRef
If you ask for orders, returns the breakdown of matches by strategy for each selection.
Defaults to false if unspecified.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -customerStrategyRefs
If you ask for orders, restricts the results to orders matching any of the specified set of customer defined strategies.
Also, filters which matches by strategy for selections are returned, if partitionMatchedByStrategyRef is true.
An empty set will be treated as if the parameter has been omitted (or null passed).

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -currencyCode
A Betfair standard currency code.
If not specified, the default currency code is used.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -locale
The language used for the response.
If not specified, the default is returned.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -matchedSince
If you ask for orders, restricts the results to orders that have at least one fragment matched since
the specified date (all matched fragments of such an order will be returned even if some were matched before the specified date).
All EXECUTABLE orders will be returned regardless of matched date.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -betIds
If you ask for orders, restricts the results to orders with the specified bet IDs.
Omitting this parameter means that all bets will be included in the response.
Please note: A maximum of 250 betId's can be provided at a time.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
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
General notes

## RELATED LINKS
