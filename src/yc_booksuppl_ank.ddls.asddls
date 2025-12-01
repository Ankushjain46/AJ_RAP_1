@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view of YI_BOOKSUPPL_MA'
@Metadata.allowExtensions: true
define view entity YC_BOOKSUPPL_ANK
  as projection on YI_BOOKSUPPL_ANK
{
  key TravelId,
  key BookingId,
  key BookingSupplementId,
      @ObjectModel.text.element: [ 'SupplymentTextDesc' ]
      SupplementId,
      _SupplymentText.Description as SupplymentTextDesc : localized,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,
      LastChangedAt,
      /* Associations */
      _Booking : redirected to parent YC_BOOKING_ANK,
      _Supplyment,
      _SupplymentText,
      _Travel  : redirected to YC_TRAVEL_ANK
}
