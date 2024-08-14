---
external help file: power.betfair-help.xml
Module Name: power.betfair
online version:
schema: 2.0.0
---

# New-BetfairOrder

## SYNOPSIS
Places an order on the Betfair Exchange.

## SYNTAX

### HelperParam
```
New-BetfairOrder -marketId <String> -orderType <String> [-handicap <Double>] -selectionId <String>
 -side <String> -price <Double> -size <Double> -persistenceType <String> [-customerStrategyRef <String>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### ClassParam
```
New-BetfairOrder -marketId <String> [-customerStrategyRef <String>] -instructions <Array>
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
This function places an order on the Betfair Exchange by making a JSON-RPC request to the Betfair API.
It requires market ID, selection ID, side, order type, price, and size as mandatory parameters.
Persistence type is optional with a default value of 'LAPSE'.

## EXAMPLES

### EXAMPLE 1
```
Place-BetfairOrder -marketId "1.23456789" -selectionId "98765432" -side "BACK" -orderType "LIMIT" -price 2.0 -size 10
```

### EXAMPLE 2
```
Place-BetfairOrder -marketId "1.23456789" -selectionId "98765432" -side "LAY" -orderType "LIMIT" -price 3.5 -size 5 -persistenceType "PERSIST"
```

## PARAMETERS

### -marketId
The ID of the market where the order will be placed.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -orderType
The type of the order, usually 'LIMIT'.

```yaml
Type: String
Parameter Sets: HelperParam
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -handicap
{{ Fill handicap Description }}

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

### -selectionId
The ID of the selection (runner) for the bet.

```yaml
Type: String
Parameter Sets: HelperParam
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -side
The side of the bet, either 'BACK' or 'LAY'.

```yaml
Type: String
Parameter Sets: HelperParam
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -price
The price at which the bet will be placed.

```yaml
Type: Double
Parameter Sets: HelperParam
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -size
The size (amount) of the bet.

```yaml
Type: Double
Parameter Sets: HelperParam
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -persistenceType
(Optional) The persistence type for the bet, e.g., 'LAPSE', 'PERSIST', or 'MARKET_ON_CLOSE'.
Default is 'LAPSE'.

```yaml
Type: String
Parameter Sets: HelperParam
Aliases:

Required: True
Position: Named
Default value: LAPSE
Accept pipeline input: False
Accept wildcard characters: False
```

### -customerStrategyRef
{{ Fill customerStrategyRef Description }}

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
{{ Fill instructions Description }}

```yaml
Type: Array
Parameter Sets: ClassParam
Aliases:

Required: True
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
