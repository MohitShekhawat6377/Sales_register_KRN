@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZBILL_ACC_DOC'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZBILL_ACC_DOC
  as select from    I_OperationalAcctgDocItem as A
    left outer join I_JournalEntry            as b on(
      b.AccountingDocument = A.AccountingDocument
      and b.CompanyCode    = A.CompanyCode
      and b.FiscalYear     = A.FiscalYear
    )



{
  key A.BillingDocument,
      A.AccountingDocument,
      A.CompanyCode,
      A.FiscalYear,
      b.IsReversal,
      b.IsReversed
}
where
      A.BillingDocument is not initial
  and b.IsReversal      is initial
  and b.IsReversed      is initial
  and b.AccountingDocumentType = 'RV'


group by
  A.BillingDocument,
  A.AccountingDocument,
  A.CompanyCode,
  A.FiscalYear,
  b.IsReversal,
  b.IsReversed 
