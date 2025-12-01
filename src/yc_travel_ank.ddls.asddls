@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view of YI_TRAVEL_MA'
@Metadata.allowExtensions: true
define root view entity YC_TRAVEL_ANK
  provider contract transactional_query
  as projection on YI_TRAVEL_ANK
{
  key TravelId,
      @ObjectModel.text.element:[ 'AgencyName' ]
      AgencyId,
      _Agency.Name        as AgencyName,
      @ObjectModel.text.element:[ 'CustomerName' ]
      CustomerId,
      _Customer.FirstName as CustomerName,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      Description,
      @ObjectModel.text.element: [ 'OverallStatusText' ]
      OverallStatus,
      _Status._Text.Text  as OverallStatusText : localized,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child YC_BOOKING_ANK,
      _Currency,
      _Customer,
      _Status
}
