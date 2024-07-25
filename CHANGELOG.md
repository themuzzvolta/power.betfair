# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [0.1.5] 25/07/2024

Added Get-BetfairAccountStatement

## [0.1.4] 22/07/2024

Fixed markdown documentation
Added account operations
Added update and remove order functions

## [0.1.3] 22/07/2024

Renamed all functions to include 'Betfair' in the name
Allowed for classes in the psm1 file
Added placeInstruction class
Refactored all functions to use JSON-RPC instead of REST for faster queries
Added New-BetfairOrder for bet placement

## [0.1.2] 20/07/2024

Defined Functions Get-ClearedOrder, Get-CurrentOrder, Get-MarketProfitAndLoss, Get-RunnerBook
Fixed Requirements for Pester version to 5.6.1 for GitHub builds

## [0.1.1] Init Release

Defined Functions Connect-BetFairAccount, Get-Competition, Get-Country, Get-Events, Get-EventType, Get-MarketBook, Get-MarketCatalogue, Get-MarketType, Get-TimeRange
Added Classes for PriceProjection type

## [0.1.0] Unreleased
