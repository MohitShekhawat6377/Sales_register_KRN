@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BILL GL'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZBILL_GLACCOUNT
  as select from    I_OperationalAcctgDocItem as A
    left outer join I_OperationalAcctgDocItem as D on(
      D.AccountingDocument       = A.AccountingDocument
      and D.CompanyCode          = A.CompanyCode
      and D.FiscalYear           = A.FiscalYear
      and D.FinancialAccountType = 'D'
    )
    inner join      I_GLAccount               as b on(
      b.GLAccount = A.GLAccount
    )
{
  key D.BillingDocument,
  key A.TaxItemAcctgDocItemRef,
      A.GLAccount

      //      max(A.GLAccount) as GLAccount
}
where
      A.GLAccount                  <> '0004301016'
  and A.GLAccount                  <> '0003201009'
  and A.FinancialAccountType       <> 'D'
  and A.AccountingDocumentItemType <> 'T'
  and b.GLAccountGroup             =  'Z300'

//  A.BillingDocument is not initial
group by
  D.BillingDocument,
  A.TaxItemAcctgDocItemRef,
  A.GLAccount
