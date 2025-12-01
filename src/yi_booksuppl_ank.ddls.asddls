@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view of YBOOKSUPPL_MA'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity YI_BOOKSUPPL_ANK
  as select from ybooksuppl_ma
  association        to parent YI_BOOKING_ANK  as _Booking        on  $projection.TravelId  = _Booking.TravelId
                                                                 and $projection.BookingId = _Booking.BookingId
  association [1..1] to YI_TRAVEL_ANK          as _Travel         on  $projection.TravelId = _Travel.TravelId
  association [1..1] to /DMO/I_Supplement     as _Supplyment     on  $projection.SupplementId = _Supplyment.SupplementID
  association [1..*] to /DMO/I_SupplementText as _SupplymentText on  $projection.SupplementId = _SupplymentText.SupplementID
{
  key travel_id             as TravelId,
  key booking_id            as BookingId,
  key booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,
      last_changed_at       as LastChangedAt,
      _Booking,
      _Travel,
      _Supplyment,
      _SupplymentText
}
