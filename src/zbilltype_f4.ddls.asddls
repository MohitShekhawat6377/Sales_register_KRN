@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BillingDocumentType F4'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZBILLTYPE_F4
  as select from I_BillingDocumentTypeText as a

{
  key  a.BillingDocumentType,
       a.BillingDocumentTypeName

}
where
  a.Language = 'E'
