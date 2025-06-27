@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZSD_SODATA'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSD_SODATA
  as select from    I_SalesDocument               as A
    left outer join I_SalesDocumentItem           as C on(
      C.SalesDocument = A.SalesDocument
    )
    left outer join I_SalesDocumentPrecdgProcFlow as B on(
      B.SalesDocument = A.SalesDocument
    )
{
  key A.SalesDocument,
  key C.SalesDocumentItem,
  key A.SalesDocumentDate,
  key A.SalesDocumentType,
      A.PurchaseOrderByCustomer,
      A.CustomerPurchaseOrderDate,
      A.RequestedDeliveryDate,
      C.MaterialByCustomer ,
      B.PrecedingDocument as Quatation
}
group by
  A.SalesDocument,
  C.SalesDocumentItem,
  //  A.SalesDocumentItem,
  A.SalesDocumentDate,
  A.SalesDocumentType,
  A.PurchaseOrderByCustomer,
  A.CustomerPurchaseOrderDate,
  A.RequestedDeliveryDate,
  C.MaterialByCustomer ,
  B.PrecedingDocument
