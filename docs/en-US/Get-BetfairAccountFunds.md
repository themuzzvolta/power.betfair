---
external help file: power.betfair-help.xml
Module Name: power.betfair
online version:
schema: 2.0.0
---

# Get-BetfairAccountFunds

## SYNOPSIS
Returns the available to bet amount, exposure and commission information.

## SYNTAX

```
Get-BetfairAccountFunds [[-wallet] <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Returns the available to bet amount, exposure and commission information.

## EXAMPLES

### EXAMPLE 1
```
Get-BetfairAccountFunds
```

Get-BetfairAccountFunds -wallet "UK"

## PARAMETERS

### -wallet
Name of the wallet in question.
Global wallet is returned by default

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: UK
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
