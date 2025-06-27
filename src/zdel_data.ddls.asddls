@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZDEL_DATA'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZDEL_DATA
  as select from I_DeliveryDocumentItem as a
{
  key a.DeliveryDocument,
  key a.DeliveryDocumentItem,
      a.MaterialByCustomer  
      
}
where
  a.MaterialByCustomer is not initial
