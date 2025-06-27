@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZSALES_REGISTER_CDS'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSALES_REGISTER_CDS  as select distinct from I_BillingDocumentBasic as A
 inner join I_BillingDocumentItem as B on ( B.BillingDocument = A.BillingDocument )
 
 left outer join ZSD_SR_BilltoParty as BILL on ( BILL.BillingDocument = A.BillingDocument )
// left outer join ZSD_SR_ShipToParty as SHIP on ( SHIP.BillingDocument = A.BillingDocument )
 left outer join ZYY1_SR_ShipToParty as SHIP on ( SHIP.BillingDocument = A.BillingDocument )
 left outer join ZSD_SR_soldtoParty as SOLD on ( SOLD.BillingDocument = A.BillingDocument )
 left outer join ZSD_SR_Transporter as TRNS on ( TRNS.BillingDocument = A.BillingDocument )
// left outer join I_CalendarDate as j on( j.CalendarDate = A.BillingDocumentDate )
 left outer join ZBILL_PRICE_CONDITION as pr on ( pr.BillingDocument = B.BillingDocument and pr.BillingDocumentItem = B.BillingDocumentItem  )
 left outer join I_Customer as P on ( P.Customer = A.PayerParty  )
 left outer join ZSD_SODATA as SO on ( SO.SalesDocument = B.SalesDocument and SO.SalesDocumentItem = B.SalesDocumentItem )
 left outer join ZDEL_DATA as DEL on ( DEL.DeliveryDocument = B.ReferenceSDDocument and DEL.DeliveryDocumentItem = B.ReferenceSDDocumentItem )
 left outer join I_ProductPlantBasic as HSN on ( HSN.Product = B.Material and HSN.Plant = B.Plant )
 left outer join I_Product as pm on ( pm.Product = B.Material )
 left outer join I_Plant as PL on ( PL.Plant = B.Plant  )
 left outer join ZIRN_CDS  as irn on ( irn.Docno = A.BillingDocument )
 left outer join ZEWAY_CDS as ewy on ( ewy.Docno = A.BillingDocument and ewy.Status = 'ACT' )
 left outer join ZBILL_GLACCOUNT as gl on ( gl.BillingDocument = A.BillingDocument and  gl.TaxItemAcctgDocItemRef = B.BillingDocumentItem  )
 left outer join ZBILL_ACC_DOC as Adoc on ( Adoc.BillingDocument = A.BillingDocument and Adoc.CompanyCode = A.CompanyCode and  Adoc.FiscalYear = A.FiscalYear )
// left outer join ZBILL_ACC_DOC as Adoc on ( Adoc.BillingDocument = A.BillingDocument  )
 
 
// left outer join I_CalendarMonthText as k on( k.CalendarMonth = j.CalendarMonth and k.Language  = 'E' ) 
 left outer join I_BillingDocumentTypeText as L on ( L.BillingDocumentType = A.BillingDocumentType and L.Language = 'E' )
 left outer join I_SalesOrganizationText as M on ( M.SalesOrganization = A.SalesOrganization and M.Language = 'E' )
 left outer join I_DistributionChannelText as N on ( N.DistributionChannel = A.DistributionChannel and N.Language = 'E' )
 left outer join I_DivisionText as O on ( O.Division = A.Division and O.Language = 'E' )
 left outer join I_ProductDescription_2 as MAT on ( MAT.Product = B.Material and MAT.Language = 'E' )
 left outer join I_MatlAccountAssignmentGroupT as ACC on ( ACC.MatlAccountAssignmentGroup = B.MatlAccountAssignmentGroup and ACC.Language = 'E' )
                                               
  left outer join ztab_update_tab as sy on ( sy.zserver <> 'MOHIT'  )   // DON'T CHANGE THIS 

{
  key A.BillingDocument ,
  key B.BillingDocumentItem ,
      A.FiscalYear ,
      A.CompanyCode ,
      A.YY1_LRNUMBER_BDH,
      A.YY1_LRDATE_BDH ,
      B.Plant ,
      B.Country ,
      PL.PlantName ,
      B.ShippingPoint ,
      A.SalesOrganization ,
      M.SalesOrganizationName ,
      N.DistributionChannelName ,
      O.DivisionName ,
      A.IncotermsClassification ,
      A.IncotermsLocation1 ,
      A.CustomerPaymentTerms ,
      A.BillingDocumentType ,
      L.BillingDocumentTypeName ,
      A.AccountingTransferStatus ,
      A.SDDocumentCategory ,
      A.PayerParty ,
      P.CustomerName ,
      A.YY1_AdvanceLicenceNo_BDH ,
      A.YY1_FormA_BDH ,
      A.YY1_VehicleNumber_BDH ,
      case 
      when A.YY1_Portofloading_BDH = '01' then 'New Delhi Airport'
      when A.YY1_Portofloading_BDH = '02' then 'Mundra'
      when A.YY1_Portofloading_BDH = '03' then 'Pipavav'
      when A.YY1_Portofloading_BDH = '04' then 'Nhava Sheva'
      when A.YY1_Portofloading_BDH = '05' then 'Any Port of India'
      else '' end as YY1_Portofloading_BDH ,
      
      case 
      when A.YY1_TransportMode_BDH = '01' then 'By Road'
      when A.YY1_TransportMode_BDH = '02' then 'By Sea'
      when A.YY1_TransportMode_BDH = '03' then 'By Air'
      when A.YY1_TransportMode_BDH = '03' then 'By Hand'
      when A.YY1_TransportMode_BDH = '03' then 'By Courier'
      
      else '' end as YY1_TransportMode_BDH ,
      
      
      A.YY1_VendorCode_BDH ,
      A.YY1_ExpShippingBillDat_BDH ,
      A.YY1_ExpShippingBillNo_BDH ,
      A.YY1_ExpShippingPortNo_BDH ,
      Adoc.AccountingDocument ,

      B.StorageLocation ,
      B.BillingQuantityUnit ,
      case when A.BillingDocumentIsCancelled = 'X'  or A.BillingDocumentType = 'CBRE' or A.BillingDocumentType = 'G2'
         then cast('-1'  as abap.dec( 2, 0 ) )
         else cast('1' as abap.dec( 2, 0 ) ) end as Negamt ,
      
      
      @Semantics.quantity.unitOfMeasure: 'BillingQuantityUnit'
      B.BillingQuantityInBaseUnit ,
        
      @Semantics.quantity.unitOfMeasure: 'BillingQuantityUnit'
       B.BillingQuantity ,
      
      B.BillingDocumentItemText ,
      B.TransactionCurrency ,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
       B.NetAmount ,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
       B.TaxAmount  ,
      
      
      
      
    ( coalesce( pr.ZF01_AMT, 0 ) + coalesce( pr.ZI01_AMT, 0 ) + coalesce( pr.ZP01_AMT, 0 ) + coalesce( pr.ZBAS_AMT, 0 ) +
     coalesce( pr.ZP02_AMT, 0 ) + coalesce( pr.ZPOS_AMT, 0 ) + coalesce( pr.ZC01_AMT, 0 ) )   as TotalTaxableAmount ,
      
    ( cast( coalesce( pr.ZF01_AMT, 0 ) + coalesce( pr.ZI01_AMT, 0 ) + coalesce( pr.ZP01_AMT, 0 ) + coalesce( pr.ZBAS_AMT, 0 ) +
          coalesce( pr.ZP02_AMT, 0 ) + coalesce( pr.ZPOS_AMT, 0 ) + coalesce( pr.ZC01_AMT, 0 ) +
          cast(B.TaxAmount as abap.dec( 16, 2 ) ) as abap.dec( 20, 2 ) ) )   as TotalInvocieAmount ,

      
      B.ItemWeightUnit ,
      @Semantics.quantity.unitOfMeasure: 'ItemWeightUnit'
       B.ItemNetWeight ,
      @Semantics.quantity.unitOfMeasure: 'ItemWeightUnit'
       B.ItemGrossWeight   ,
//      B.PriceDetnExchangeRate ,
      A.AccountingExchangeRate as PriceDetnExchangeRate ,
      B.Division as materialdevision ,
      A.BillingDocumentDate ,
      SO.RequestedDeliveryDate ,
      
      case when SO.RequestedDeliveryDate is not initial 
      then dats_days_between( SO.RequestedDeliveryDate , A.BillingDocumentDate ) 
       else 0 end as  zDays ,
      
      B.ReferenceSDDocument ,
      B.ReferenceSDDocumentItem ,
      
      B.SalesDocument ,
      B.SalesDocumentItem ,
      SO.SalesDocumentDate ,
      SO.SalesDocumentType ,
      SO.PurchaseOrderByCustomer as SO_poref ,
      SO.CustomerPurchaseOrderDate ,
      SO.Quatation ,
      
      case when DEL.MaterialByCustomer is not initial
       then DEL.MaterialByCustomer
       else SO.MaterialByCustomer end as MaterialByCustomer  ,
       
       SO.PurchaseOrderByCustomer   as PurchaseOrderByCustomer  ,
      
      B.Material ,
      HSN.ConsumptionTaxCtrlCode as HSN ,
      B.BillingDocumentItemText as ProductDescription ,
//      MAT.ProductDescription ,
      B.MaterialGroup ,
      ACC.MatlAccountAssignmentGroupName ,
      B.AdditionalMaterialGroup1 ,
      B.AdditionalMaterialGroup2 ,
      B.AdditionalMaterialGroup3 ,
      B.AdditionalMaterialGroup4 ,
      B.AdditionalMaterialGroup5 ,
      
      B.TaxCode,
    ( coalesce( pr.ZF01_AMT, 0 ) + coalesce( pr.ZR00_AMT, 0 ) )   as Taxablevalue ,
      
      
      SHIP.Customer    as SHIPCUSTOMER,
      SHIP.ShipToParty as ShipToPartyname,
      SHIP.Region      as shipRegion,
      SHIP.CityName   as shipCityName,
      SHIP.PostalCode as shipPostalCode,
      SHIP.TaxNumber3 as shipTaxNumber3,
      SHIP.S_RegionName as shipRegionName ,
      SHIP.ShipToadd as ShipToadd ,
      
      BILL.Customer   as BILLCustomer,
      BILL.BillToName,
      BILL.Region     as BillRegion,
      BILL.CityName   as billCityName,
      BILL.PostalCode as billPostalCode,
      BILL.TaxNumber3 as billTaxNumber3,
      BILL.RegionName as billRegionName  ,
      BILL.billToadd as billToadd  ,
      
      SOLD.Customer   as SOLDCustomer,
      SOLD.SOLDToParty,
      SOLD.Region     as SOLDRegion,
      SOLD.CityName   as SOLDCityName,
      SOLD.PostalCode as SOLDPostalCode,
      SOLD.TaxNumber3 as SOLDTaxNumber3,
      SOLD.RegionName as SOLDRegionName  ,
      
      TRNS.Customer   as TRNSCustomer,
      TRNS.TransporterName,
      TRNS.Region     as TRNSRegion,
      TRNS.CityName   as TRNSCityName,
      TRNS.PostalCode as TRNSPostalCode,
      TRNS.TaxNumber3 as TRNSTaxNumber3,
      TRNS.RegionName as TRNSRegionName  ,
      
      A.BillingDocumentIsCancelled ,
      A.CancelledBillingDocument ,
      pm.ExternalProductGroup ,
      pm._ExtProdGrpText[ Language = 'E' ].ExternalProductGroupName as ExternalProductGroupName ,
      
      irn.AckNo ,
      irn.AckDate ,
      irn.Irn ,
      ewy.Ebillno ,
      ewy.Vdfmdate ,
      ewy.Vdtodate ,
      
       pr.ZR00_AMT  ,
       pr.ZD01_AMT  ,
       pr.ZA01_AMT  ,
       pr.ZC01_AMT  ,
       pr.ZF01_AMT  ,
       pr.ZI01_AMT  ,
       pr.ZP01_AMT  ,
       pr.ZP02_AMT   ,
       pr.JOCG_AMT  ,
       pr.JOSG_AMT  ,
       pr.JOIG_AMT   ,
       pr.ZTCS_AMT   ,
       pr.ZROF_AMT   ,
       pr.ZBAS_AMT   ,
       pr.ZADS_AMT  ,
       pr.ZPOS_AMT  ,
        
        
      /////////
      pr.ZR00_RATE ,
      pr.JOCG_RATE ,
      pr.JOSG_RATE ,
      pr.JOIG_RATE ,
      
      
//   https://my421262.s4hana.cloud.sap/ui#BillingDocument-displayBillingDocument?BillingDocument=90000002
      
//   cast( concat( sy.zserver_url , '/ui#AccountingDocument-manageV2&/C_ManageJournalEntryTP(CompanyCode=%27' ) as abap.char( 200 ) ) as fir_url ,
   cast( concat( sy.zserver_url ,  '/ui#BillingDocument-displayBillingDocument?BillingDocument=' ) as abap.char( 200 ) ) as fir_url ,
    
    ( A.BillingDocument  ) as sec_url  ,
      
      


//       @UI.lineItem                   : [{position: 11}]
//       @EndUserText.label             : 'Total Amount'
////       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZSALES_REGISTER_CLASS'
//       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZSALES_REGISTER_CLASS'
//       cast( ' ' as abap.char(20) ) as Testt
      
      
      
      gl.GLAccount as GLAccount_M ,
      A.DistributionChannel ,
      A.Division ,
      B.MatlAccountAssignmentGroup ,
       
      case  when gl.GLAccount is null then
      case 
      when A.DistributionChannel = '01' and A.Division = '10' and B.MatlAccountAssignmentGroup = '10' then '0003001000'
      when A.DistributionChannel = '01' and A.Division = '20' and B.MatlAccountAssignmentGroup = '11' then '0003001002'
      when A.DistributionChannel = '01' and A.Division = '40' and B.MatlAccountAssignmentGroup = '12' then '0003001004'
      when A.DistributionChannel = '01' and A.Division = '60' and B.MatlAccountAssignmentGroup = '13' then '0003001008'
      when A.DistributionChannel = '01' and A.Division = '70' and B.MatlAccountAssignmentGroup = '14' then '0003001009'
      when A.DistributionChannel = '01' and A.Division = '80' and B.MatlAccountAssignmentGroup = '15' then '0003001010'
      
      when A.DistributionChannel = '02' and A.Division = '10' and B.MatlAccountAssignmentGroup = '10' then '0003001001'
      when A.DistributionChannel = '02' and A.Division = '20' and B.MatlAccountAssignmentGroup = '11' then '0003001003'
      when A.DistributionChannel = '02' and A.Division = '40' and B.MatlAccountAssignmentGroup = '12' then '0003001005'
      when A.DistributionChannel = '02' and A.Division = '60' and B.MatlAccountAssignmentGroup = '13' then '0003001007'
  
      when A.DistributionChannel = '06' and A.Division = '10' and B.MatlAccountAssignmentGroup = '10' then '0003001000'
      when A.DistributionChannel = '06' and A.Division = '20' and B.MatlAccountAssignmentGroup = '11' then '0003001002'
      when A.DistributionChannel = '06' and A.Division = '40' and B.MatlAccountAssignmentGroup = '12' then '0003001004'
      when A.DistributionChannel = '06' and A.Division = '60' and B.MatlAccountAssignmentGroup = '13' then '0003001008'
      when A.DistributionChannel = '06' and A.Division = '70' and B.MatlAccountAssignmentGroup = '14' then '0003001009'
      when A.DistributionChannel = '06' and A.Division = '80' and B.MatlAccountAssignmentGroup = '15' then '0003001010'
  
      when A.DistributionChannel = '07' and A.Division = '10' and B.MatlAccountAssignmentGroup = '10' then '0003001001'
      when A.DistributionChannel = '07' and A.Division = '20' and B.MatlAccountAssignmentGroup = '11' then '0003001003'
      when A.DistributionChannel = '07' and A.Division = '40' and B.MatlAccountAssignmentGroup = '12' then '0003001005'
      when A.DistributionChannel = '07' and A.Division = '60' and B.MatlAccountAssignmentGroup = '13' then '0003001007'
      
      
      end
      else gl.GLAccount
      end as GLAccount
  
     
} 

// where
//      A.BillingDocumentType <> 'S1'
// and  A.BillingDocumentType <> 'S2'
// and  A.BillingDocumentType <> 'S3'
// and  A.BillingDocumentType <> 'JSN'
// and  A.BillingDocumentType <> 'JSP'
// and  A.BillingDocumentType <> 'JVR'
// and  A.AccountingTransferStatus <> 'E'
// and  A.BillingDocumentIsCancelled <> 'X'
 
 
 
// group by
 
