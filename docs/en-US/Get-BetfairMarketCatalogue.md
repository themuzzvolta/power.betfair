---
external help file: power.betfair-help.xml
Module Name: power.betfair
online version:
schema: 2.0.0
---

# Get-BetfairMarketCatalogue

## SYNOPSIS
Returns a list of information about published (ACTIVE/SUSPENDED) markets that does not change (or changes very rarely).

## SYNTAX

```
Get-BetfairMarketCatalogue [[-textQuery] <String>] [[-eventTypeIds] <String[]>] [[-eventIds] <String[]>]
 [[-competitionIds] <String[]>] [[-marketIds] <String[]>] [[-venues] <String[]>] [[-bspOnly] <Boolean>]
 [[-turnInPlayEnabled] <Boolean>] [[-inPlayOnly] <Boolean>] [[-marketBettingTypes] <String[]>]
 [[-marketCountries] <String[]>] [[-marketTypeCodes] <String[]>] [[-marketStartTime] <Hashtable>]
 [[-withOrders] <String[]>] [[-raceTypes] <String[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of information about published (ACTIVE/SUSPENDED) markets that does not change (or changes very rarely).
You use listMarketCatalogue to retrieve the name of the market, the names of selections and other information about markets.
Market Data Request Limits apply to requests made to listMarketCatalogue.
Please note: listMarketCatalogue does not return markets that are CLOSED.

## EXAMPLES

### EXAMPLE 1
```
Get-BetfairMarketCatalogue -textQuery "AU"
```

Get-BetfairMarketCatalogue -textQuery "AU"

## PARAMETERS

### -textQuery
Restrict markets by any text associated with the Event name.
You can include a wildcard (*) character as long as it is not the first character.
Please note - the textQuery field doesn't evaluate market or selection names.

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
Restrict markets by event type associated with the market.
(i.e., Football, Hockey, etc)

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
Restrict markets by the event id associated with the market.

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

### -competitionIds
Restrict markets by the competitions associated with the market.

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

### -marketIds
Restrict markets by the market id associated with the market.

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

### -venues
Restrict markets by the venue associated with the market.
Currently, only Horse & Greyhound racing markets have venues.

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

### -bspOnly
Restrict to bsp markets only, if True or non-bsp markets if False.
If not specified then returns both BSP and non-BSP markets

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -turnInPlayEnabled
Restrict to markets that will turn in play if True or will not turn in play if false.
If not specified, returns both.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -inPlayOnly
Restrict to markets that are currently in play if True or are not currently in play if false.
If not specified, returns both.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -marketBettingTypes
Restrict to markets that match the betting type of the market (i.e.
Odds, Asian Handicap Singles, Asian Handicap Doubles or Line)

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -marketCountries
Restrict to markets that are in the specified country or countries. 
Please note: the default value is 'GB' when the correct country code cannot be determined.

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

### -marketTypeCodes
Restrict to markets that match the type of the market (i.e., MATCH_ODDS, HALF_TIME_SCORE).
You should use this instead of relying on the market name as the market type codes are the same in all locales.
Please note: All market types are available via the listMarketTypes operations

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 12
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -marketStartTime
Restrict to markets with a market start time before or after the specified date

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -withOrders
Restrict to markets where I have one or more orders in these states.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 14
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -raceTypes
Restrict to markets of a specific raceType.
Valid values are - Harness, Flat, Hurdle, Chase, Bumper, NH Flat, Steeple (AUS/NZ races), and NO_VALUE (when no valid race type has been mapped).

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 15
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
