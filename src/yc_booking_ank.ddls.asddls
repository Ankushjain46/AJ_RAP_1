@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view of YI_BOOKING_MA'
@Metadata.allowExtensions: true
define view entity YC_BOOKING_ANK
  as projection on YI_BOOKING_ANK
{
  key TravelId,
  key BookingId,
      BookingDate,
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      _Customer.FirstName        as CustomerName,
      @ObjectModel.text.element: [ 'CarrierName' ]
      CarrierId,
      _Carrier.Name              as CarrierName,
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      @ObjectModel.text.element: [ 'BookingStatusText' ]
      BookingStatus,
      _Booking_Status._Text.Text as BookingStatusText : localized,
      LastChangedAt,
      /* Associations */
      _BookingSupplyment : redirected to composition child YC_BOOKSUPPL_ANK,
      _Booking_Status,
      _Carrier,
      _Connection,
      _Customer,
      _Travel            : redirected to parent YC_TRAVEL_ANK
}
