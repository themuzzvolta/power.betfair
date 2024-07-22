---
external help file: power.betfair-help.xml
Module Name: power.betfair
online version:
schema: 2.0.0
---

# Get-BetfairClearedOrder

## SYNOPSIS
Returns a list of settled bets based on the bet status, ordered by settled date.
To retrieve more than 1000 records, you need to make use of the fromRecord and recordCount parameters.

## SYNTAX

```
Get-BetfairClearedOrder [[-betStatus] <String>] [[-eventTypeIds] <String[]>] [[-eventIds] <String[]>]
 [[-marketIds] <String[]>] [[-runnerIds] <String[]>] [[-betIds] <String[]>] [[-customerOrderRefs] <String[]>]
 [[-customerStrategyRefs] <String[]>] [[-side] <String>] [[-settledDateRange] <Hashtable>]
 [[-groupBy] <String>] [[-locale] <String>] [[-fromRecord] <Int32>] [[-recordCount] <Int32>]
 [[-includeItemDescription] <Boolean>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of settled bets based on the bet status, ordered by settled date.
To retrieve more than 1000 records, you need to make use of the fromRecord and recordCount parameters.

## EXAMPLES

### EXAMPLE 1
```
Get-BetfairClearedOrder
```

Get-BetfairClearedOrder -marketIds "1477", "1566"

## PARAMETERS

### -betStatus
Restricts the results to the specified status.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -eventTypeIds
Optionally restricts the results to the specified Event Type IDs.

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

### -eventIds
Optionally restricts the results to the specified Event IDs.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
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
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -runnerIds
Optionally restricts the results to the specified Runners.

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

### -betIds
If you ask for orders, restricts the results to orders with the specified bet IDs.
Omitting this parameter means that all bets will be included in the response.
Please note: A maximum of 250 betId's can be provided at a time.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
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
Position: 7
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
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -side
Optionally restricts the results to the specified side.

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

### -settledDateRange
Optionally restricts the results to be from/to the specified settled date.
This date is inclusive, i.e.
if an order was cleared on exactly this date (to the millisecond) then it will be included in the results.
If the from is later than the to, no results will be returned.

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -groupBy
How to aggregate the lines, if not supplied then the lowest level is returned, i.e.
bet by bet This is only applicable to SETTLED BetStatus.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -locale
The language used for the itemDescription.
If not specified, the customer account default is returned.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 12
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -fromRecord
Specifies the first record that will be returned.
Records start at index zero.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -recordCount
Specifies how many records will be returned, from the index position 'fromRecord'.
Note that there is a page size limit of 1000.
A value of zero indicates that you would like all records (including and from 'fromRecord') up to the limit.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 14
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -includeItemDescription
If true then an ItemDescription object is included in the response.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 15
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
