---
external help file: power.betfair-help.xml
Module Name: power.betfair
online version:
schema: 2.0.0
---

# Get-Competition

## SYNOPSIS
Returns a list of Competitions.

## SYNTAX

```
Get-Competition [[-textQuery] <String>] [[-eventTypeIds] <String[]>] [[-eventIds] <String[]>]
 [[-competitionIds] <String[]>] [[-marketIds] <String[]>] [[-venues] <String[]>] [[-bspOnly] <Boolean>]
 [[-turnInPlayEnabled] <Boolean>] [[-inPlayOnly] <Boolean>] [[-marketBettingTypes] <String[]>]
 [[-marketCountries] <String[]>] [[-marketTypeCodes] <String[]>] [[-marketStartTime] <Hashtable>]
 [[-withOrders] <String[]>] [[-raceTypes] <String[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of Competitions (i.e., World Cup 2013) associated with the markets selected by the MarketFilter.
Currently only Football markets have an associated competition.

## EXAMPLES

### EXAMPLE 1
```
Get-Competition -Username "john.snow@got.com" -Password $secureString -APIKey $apiKey
```

## PARAMETERS

### -textQuery
{{ Fill textQuery Description }}

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
{{ Fill eventTypeIds Description }}

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
{{ Fill eventIds Description }}

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
{{ Fill competitionIds Description }}

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
{{ Fill marketIds Description }}

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
{{ Fill venues Description }}

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
{{ Fill bspOnly Description }}

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
{{ Fill turnInPlayEnabled Description }}

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
{{ Fill inPlayOnly Description }}

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
{{ Fill marketBettingTypes Description }}

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
{{ Fill marketCountries Description }}

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
{{ Fill marketTypeCodes Description }}

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
@{from = \[datetime\]$from; to = \[datetime\]$to}

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
{{ Fill withOrders Description }}

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
{{ Fill raceTypes Description }}

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
