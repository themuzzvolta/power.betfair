---
external help file: power.betfair-help.xml
Module Name: power.betfair
online version:
schema: 2.0.0
---

# New-BetfairAppKey

## SYNOPSIS
Create 2 Application Keys for a given user; one 'Delayed and the other 'Live'.

## SYNTAX

```
New-BetfairAppKey [-appName] <String> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Create 2 Application Keys for a given user; one 'Delayed and the other 'Live'.
You must apply to have your 'Live' App Key activated.
Please Note:  The appName must be unique and cannot contain your username.
A UNEXPECTED_ERROR will be returned in these circumstances.

## EXAMPLES

### EXAMPLE 1
```
New-BetfairAppKey -appName "BACK_TO_LAY_STRATEGY"
```

New-BetfairAppKey -appName "ARBITRAGE_STRATEGY"

## PARAMETERS

### -appName
A Display name for the application.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
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
