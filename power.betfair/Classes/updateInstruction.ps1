enum persistenceType {
    LAPSE
    PERSIST
    MARKET_ON_CLOSE
}
class updateInstruction {
    [string] $betId
    [persistenceType] $newPersistenceType
}
