@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Billing Doc F4'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZBILLDOC_F4
  as select from I_BillingDocumentBasic as a

{
  key a.BillingDocument,
      a.BillingDocumentDate,
      a.BillingDocumentType,
      a.DistributionChannel,
      a.Division,
      a.SoldToParty
}
