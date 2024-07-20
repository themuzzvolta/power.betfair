---
external help file: power.betfair-help.xml
Module Name: power.betfair
online version:
schema: 2.0.0
---

# Get-CurrentOrder

## SYNOPSIS
Returns a list of dynamic data about markets.
Dynamic data includes prices, the status of the market, the status of selections, the traded volume, and the status of any orders you have placed in the market.

## SYNTAX

```
Get-CurrentOrder [[-betIds] <String[]>] [[-marketIds] <String[]>] [[-orderProjection] <String>]
 [[-customerOrderRefs] <String[]>] [[-customerStrategyRefs] <String[]>] [[-dateRange] <Hashtable>]
 [[-orderBy] <String>] [[-sortDir] <String>] [[-fromRecord] <Int32>] [[-recordCount] <Int32>]
 [[-includeItemDescription] <Boolean>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of dynamic data about markets.
Dynamic data includes prices, the status of the market, the status of selections, the traded volume, and the status of any orders you have placed in the market.

## EXAMPLES

### EXAMPLE 1
```
Get-CurrentOrder
```

Get-CurrentOrder -marketIds "1477", "1566"

## PARAMETERS

### -betIds
If you ask for orders, restricts the results to orders with the specified bet IDs.
Omitting this parameter means that all bets will be included in the response.
Please note: A maximum of 250 betId's can be provided at a time.

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

### -marketIds
One or more market ids.
The number of markets returned depends on the amount of data you request via the price projection.

```yaml
Type: String[]
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

### -customerOrderRefs
Optionally restricts the results to the specified customer order references.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
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
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -dateRange
Optionally restricts the results to be from/to the specified date, these dates are contextual to the orders being returned
and therefore the dates used to filter on will change to placed,
matched, voided or settled dates depending on the orderBy.
This date is inclusive,
i.e.
if an order was placed on exactly this date (to the millisecond) then it will be included in the results.
If the from is later than the to, no results will be returned

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -orderBy
Specifies how the results will be ordered.
If no value is passed in, it defaults to BY_BET.
Also acts as a filter such that only orders with a valid value in the field being ordered by will be returned
(i.e.
BY_VOID_TIME returns only voided orders, BY_SETTLED_TIME (applies to partially settled markets) returns only
settled orders and BY_MATCH_TIME returns only orders with a matched date (voided, settled, matched orders)).

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -sortDir
{{ Fill sortDir Description }}

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

### -fromRecord
{{ Fill fromRecord Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -recordCount
{{ Fill recordCount Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -includeItemDescription
{{ Fill includeItemDescription Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
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
