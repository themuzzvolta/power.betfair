enum Side {
    BACK
    LAY
}

enum TimeInForce {
    FILL_OR_KILL
    GOOD_TILL_CANCELLED
    GOOD_TILL_DATE
}

enum BetTargetType {
    BACKERS_PROFIT
    LAYERS_LIABILITY
}

class limitOrder {
    [double]$size
    [double]$price
    [string]$persistenceType
}

class placeInstruction {
    [string]$orderType
    [long]$selectionId
    [double]$handicap
    [Side]$side
    [LimitOrder]$limitOrder
    [string]$customerOrderRef
    [TimeInForce]$timeInForce
    [double]$minFillSize
    [BetTargetType]$betTargetType
}


