---
external help file: Microsoft.PowerShell.Commands.Utility.dll-Help.xml
Module Name: Microsoft.PowerShell.Utility
online version: https://go.microsoft.com/fwlink/?LinkID=2097014
schema: 2.0.0
---

# Get-Event

## SYNOPSIS
Returns a list of Events (i.e, Reading vs.
Man United) associated with the markets selected by the MarketFilter.

## SYNTAX

### BySource (Default)
```
Get-Event [[-SourceIdentifier] <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### ById
```
Get-Event [-EventIdentifier] <Int32> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of Events (i.e, Reading vs.
Man United) associated with the markets selected by the MarketFilter.

## EXAMPLES

### EXAMPLE 1
```
Get-Event -Username "john.snow@got.com" -Password $secureString -APIKey $apiKey
```

## PARAMETERS

### -EventIdentifier
{{ Fill EventIdentifier Description }}

```yaml
Type: Int32
Parameter Sets: ById
Aliases: Id

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -SourceIdentifier
{{ Fill SourceIdentifier Description }}

```yaml
Type: String
Parameter Sets: BySource
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName)
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

### System.String

### System.Int32

## OUTPUTS

### System.Management.Automation.PSObject
### System.Management.Automation.PSEventArgs

## NOTES
General notes

## RELATED LINKS

[https://go.microsoft.com/fwlink/?LinkID=2097014](https://go.microsoft.com/fwlink/?LinkID=2097014)

