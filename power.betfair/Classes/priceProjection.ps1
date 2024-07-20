enum PriceData {
    SP_AVAILABLE
    SP_TRADED
    EX_BEST_OFFERS
    EX_ALL_OFFERS
    EX_TRADED
}

class ExBestOffersOverrides {
    [int] $bestPricesDepth
    [int] $rollupLimit
}

class PriceProjection {
    [PriceData[]]           $priceData
    [ExBestOffersOverrides] $exBestOffersOverrides
    [Boolean]               $virtualise
}
