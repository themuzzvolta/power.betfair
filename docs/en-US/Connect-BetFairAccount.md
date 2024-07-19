---
external help file: power.betfair-help.xml
Module Name: power.betfair
online version:
schema: 2.0.0
---

# Connect-BetFairAccount

## SYNOPSIS
Function for creating an authenticated session to BetFair

## SYNTAX

```
Connect-BetFairAccount -Username <String> -Password <SecureString> -APIKey <String>
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
The API login endpoint is the simplest method of integration for most applications in terms of expected development time.
It will allow a user to provide a username and password or a username and (password + 2 factor auth code) if they have strong authentication enabled.

## EXAMPLES

### EXAMPLE 1
```
Connect-BetFairAccount -Username "john.snow@got.com" -Password $secureString -APIKey $apiKey
```

## PARAMETERS

### -Username
The BetFair username

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

### -Password
The password for the specified user

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -APIKey
The API Key value

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
