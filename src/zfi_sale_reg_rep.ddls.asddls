@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZFI_SALE_REG_REP'
@Metadata.ignorePropagatedAnnotations: true
@UI: { headerInfo: { typeName: 'Report', typeNamePlural: 'Sales Register Report - FI'  } }
define root view entity ZFI_SALE_REG_REP
  as select from    ZSALES_REGISTER_CUBE as a
    left outer join I_GLAccountText      as B on(
      B.GLAccount           = a.GLAccount
      and B.ChartOfAccounts = 'YCOA'
      and B.Language        = 'E'
    )
{

         @UI.lineItem             : [{ position: 10 }]
         @UI.selectionField       : [{ position: 10 }]
         @EndUserText.label       : 'Plant'
         @Consumption.valueHelpDefinition: [ { entity:  { name:    'ZPLANT_F4', element: 'Plant' } }]
  key    a.Plant,
         @UI.lineItem             : [{ position: 20 }]
         @EndUserText.label       : 'GLAccount'
  key    a.GLAccount,
         @UI.lineItem             : [{ position: 30 }]
         @EndUserText.label       : 'GL Name'
  key    B.GLAccountLongName,

         @UI.lineItem             : [{ position: 40 }]
         @UI.selectionField       : [{ position: 40 }]
         @EndUserText.label       : 'Sales Document'
  key    a.SalesDocument,
         @UI.lineItem             : [{ position: 50 }]
         @EndUserText.label       : 'Customer PO'
  key    a.PurchaseOrderByCustomer,

         @UI.lineItem             : [{ position: 60 }]
         @UI.selectionField       : [{ position: 60 }]
         @EndUserText.label       : 'Distribution Channel'
         @Consumption.valueHelpDefinition: [ { entity:  { name:  'ZDistributionChannel_F4', element: 'DistributionChannel' } }]
  key    a.DistributionChannel,
         @UI.lineItem             : [{ position: 70 }]
         @EndUserText.label       : 'Distribution Channel Name '
  key    a.DistributionChannelName,
         @UI.lineItem             : [{ position: 80 }]
         @UI.selectionField       : [{ position: 80 }]
         @EndUserText.label       : 'Division'
         @Consumption.valueHelpDefinition: [ { entity:  { name:  'ZDivision_F4', element: 'Division' } }]
  key    a.Division,
         @UI.lineItem             : [{ position: 90 }]
         @EndUserText.label       : 'Division Name'
  key    a.DivisionName,

         @UI.lineItem             : [{ position: 100 }]
         @EndUserText.label       : 'Shipping Point'
  key    a.ShippingPoint,
         @UI.lineItem             : [{ position: 110 }]
         @UI.selectionField       : [{ position: 110 }]
         @EndUserText.label       : 'Billing Type'
         @Consumption.valueHelpDefinition: [ { entity:  { name:    'ZBILLTYPE_F4', element: 'BillingDocumentType' } }]
  key    a.BillingDocumentType,
         @UI.lineItem             : [{ position: 120 }]
         @EndUserText.label       : 'Billing Type Name'
  key    a.BillingDocumentTypeName,
         @EndUserText.label       : 'Billing Document'
         @UI.selectionField       : [{ position: 130 }]
         @UI.lineItem             : [{ position: 130 }]
         @Consumption.valueHelpDefinition: [ { entity:  { name:    'ZBILLDOC_F4', element: 'BillingDocument' } }]
  key    a.BillingDocument,
         @UI.lineItem             : [{ position: 140 }]
         @UI.selectionField       : [{ position: 140 }]
         @EndUserText.label       : 'Billing Document Date'
  key    a.BillingDocumentDate,

         @UI.lineItem             : [{ position: 150 }]
         @EndUserText.label       : 'Month'
  key    case substring(a.BillingDocumentDate , 5 , 2 )
     when '01' then concat( 'JAN-', substring(a.BillingDocumentDate , 3 , 2 ) )
     when '02' then concat( 'FEB-', substring(a.BillingDocumentDate , 3 , 2 ) )
     when '03' then concat( 'MAR-', substring(a.BillingDocumentDate , 3 , 2 ) )
     when '04' then concat( 'APR-', substring(a.BillingDocumentDate , 3 , 2 ) )
     when '05' then concat( 'MAY-', substring(a.BillingDocumentDate , 3 , 2 ) )
     when '06' then concat( 'JUN-', substring(a.BillingDocumentDate , 3 , 2 ) )
     when '07' then concat( 'JUL-', substring(a.BillingDocumentDate , 3 , 2 ) )
     when '08' then concat( 'AUG-', substring(a.BillingDocumentDate , 3 , 2 ) )
     when '09' then concat( 'SEP-', substring(a.BillingDocumentDate , 3 , 2 ) )
     when '10' then concat( 'OCT-', substring(a.BillingDocumentDate , 3 , 2 ) )
     when '11' then concat( 'NOV-', substring(a.BillingDocumentDate , 3 , 2 ) )
     when '12' then concat( 'DEC-', substring(a.BillingDocumentDate , 3 , 2 ) )
     else '-' end                                                                               as zMonth,


         @UI.lineItem             : [{ position: 160 }]
         @EndUserText.label       : 'Accounting Document'
  key    a.AccountingDocument,

         @UI.lineItem             : [{ position: 170 }]
         @EndUserText.label       : 'Bill To'
         @Consumption.valueHelpDefinition: [ { entity:  { name:  'I_Customer', element: 'Customer' } }]
  key    a.BILLCustomer,
         @UI.lineItem             : [{ position: 180 }]
         @EndUserText.label       : 'Bill To Name'
  key    a.BillToName,
         @UI.lineItem             : [{ position: 190 }]
         @EndUserText.label       : 'Bill To City'
  key    a.billCityName,
         @UI.lineItem             : [{ position: 200 }]
         @EndUserText.label       : 'Bill To GSTIN'
  key    a.billTaxNumber3,
         @UI.lineItem             : [{ position: 210 }]
         @EndUserText.label       : 'Bill To Region'
  key    a.BillRegion,
         @UI.lineItem             : [{ position: 220 }]
         @EndUserText.label       : 'Bill To Region Name'
  key    a.billRegionName,
         @UI.lineItem             : [{ position: 230 }]
         @EndUserText.label       : 'Bill To Postal Code'
  key    a.billPostalCode,
         @UI.lineItem             : [{ position: 240 }]
         @EndUserText.label       : 'Bill To Address'
  key    a.billToadd,
         @UI.lineItem             : [{ position: 250 }]
         @EndUserText.label       : 'Country'
  key    a.Country,

         @UI.lineItem             : [{ position: 260 }]
         @EndUserText.label       : 'ShipTo Customer'
         @Consumption.valueHelpDefinition: [ { entity:  { name:  'I_Customer', element: 'Customer' } }]
  key    a.SHIPCUSTOMER,
         @UI.lineItem             : [{ position: 270 }]
         @EndUserText.label       : 'ShipTo Customer Name'
  key    a.ShipToPartyname,
         @UI.lineItem             : [{ position: 280 }]
         @EndUserText.label       : 'ShipTo City'
  key    a.shipCityName,
         @UI.lineItem             : [{ position: 290 }]
         @EndUserText.label       : 'ShipTo Postal Code'
  key    a.shipPostalCode,
         @UI.lineItem             : [{ position: 300 }]
         @EndUserText.label       : 'ShipTo Region'
  key    a.shipRegion,
         @UI.lineItem             : [{ position: 310 }]
         @EndUserText.label       : 'ShipTo Region Name'
  key    a.shipRegionName,
         @UI.lineItem             : [{ position: 320 }]
         @EndUserText.label       : 'ShipTo GSTIN'
  key    a.shipTaxNumber3,
         @UI.lineItem             : [{ position: 330 }]
         @EndUserText.label       : 'ShipTo Address'
  key    a.ShipToadd,

         @UI.lineItem             : [{ position: 340 }]
         @EndUserText.label       : 'Customer Part Code'
  key    a.MaterialByCustomer,
         @UI.lineItem             : [{ position: 350 }]
         @UI.selectionField       : [{ position: 350 }]
         @EndUserText.label       : 'Material'
         @Consumption.valueHelpDefinition: [ { entity:  { name:    'ZPRODUCT_F4', element: 'Product' } }]
  key    a.Material,
         @UI.lineItem             : [{ position: 360 }]
         @EndUserText.label       : 'Material Description'
  key    a.ProductDescription,
         @UI.lineItem             : [{ position: 370 }]
         @EndUserText.label       : 'UOM'
  key    a.BillingQuantityUnit,
         @UI.lineItem             : [{ position: 380 }]
         @EndUserText.label       : 'Material Group'
  key    a.MaterialGroup,
         @UI.lineItem             : [{ position: 390 }]
         @EndUserText.label       : 'Material Account Assignment Group'
  key    a.MatlAccountAssignmentGroupName,
         @UI.lineItem             : [{ position: 400 }]
         @EndUserText.label       : 'Transcation Currency'
  key    a.TransactionCurrency,
         @UI.lineItem             : [{ position: 410 }]
         @UI.selectionField       : [{ position: 410 }]
         @EndUserText.label       : 'HSN'
  key    a.HSN,
         @UI.lineItem             : [{ position: 420 }]
         @EndUserText.label       : 'Invoice tax code'
  key    a.TaxCode,

         @UI.lineItem             : [{ position: 430 }]
         @EndUserText.label       : 'Exchange Rate'
  key    a.PriceDetnExchangeRate,

         @UI.lineItem             : [{ position: 440 }]
         @DefaultAggregation:  #SUM
         @EndUserText.label       : 'Billing Quantity'
  key    a.BillingQuantity,


         //"""""""""""""""""""""" AMOUNT FIELDS
         @UI.lineItem             : [{ position: 450 }]
         @EndUserText.label       : 'Rate'
  key    a.ZR00_RATE,
         @UI.lineItem             : [{ position: 460 }]
         @DefaultAggregation:  #SUM
         @EndUserText.label       : 'Basic Value(INR)'
  key    a.ZR00_AMT_inr,
         @UI.lineItem             : [{ position: 470 }]
         @DefaultAggregation: #SUM
         @EndUserText.label       : 'Cash Discount(INR)'
  key    cast( ( a.ZD01_AMT * a.PriceDetnExchangeRate  ) as abap.dec( 20, 2 ) )                 as ZD01_AMT_inr,
         @UI.lineItem             : [{ position: 480 }]
         @DefaultAggregation: #SUM
         @EndUserText.label       : 'Taxable Value(INR)'
  key    cast( ( a.Taxablevalue * a.PriceDetnExchangeRate  ) as abap.dec( 20, 2 ) )             as Taxablevalue_inr,

         @UI.lineItem             : [{ position: 490 }]
         @DefaultAggregation: #SUM
         @EndUserText.label       : 'Freight Charge(INR)'
  key    cast( ( a.ZF01_AMT * a.PriceDetnExchangeRate  ) as abap.dec( 20, 2 ) )                 as ZF01_AMT_inr,

         @UI.lineItem             : [{ position: 491 }]
         @DefaultAggregation: #SUM
         @EndUserText.label       : 'Taxable with freight(INR)'
  key    coalesce( cast( ( a.Taxablevalue * a.PriceDetnExchangeRate  ) as abap.dec( 20, 2 ) ) , 0 ) +
         coalesce( cast( ( a.ZF01_AMT * a.PriceDetnExchangeRate  ) as abap.dec( 20, 2 ) ) , 0 ) as Taxable_ZF01_AMT_inr,


         @UI.lineItem             : [{ position: 500 }]
         @EndUserText.label       : 'SGST Rate'
  key    a.JOSG_RATE,
         @UI.lineItem             : [{ position: 510 }]
         @DefaultAggregation: #SUM
         @EndUserText.label       : 'SGST Amount(INR)'
  key    cast( ( a.JOSG_AMT * a.PriceDetnExchangeRate  ) as abap.dec( 20, 2 ) )                 as JOSG_AMT_inr,
         @UI.lineItem             : [{ position: 520 }]
         @EndUserText.label       : 'CGST Rate'
  key    a.JOCG_RATE,
         @UI.lineItem             : [{ position: 530 }]
         @DefaultAggregation: #SUM
         @EndUserText.label       : 'CGST Amount(INR)'
  key    cast( ( a.JOCG_AMT * a.PriceDetnExchangeRate  ) as abap.dec( 20, 2 ) )                 as JOCG_AMT_inr,
         @UI.lineItem             : [{ position: 540 }]
         @EndUserText.label       : 'IGST Rate'
  key    a.JOIG_RATE,
         @UI.lineItem             : [{ position: 550 }]
         @DefaultAggregation: #SUM
         @EndUserText.label       : 'IGST Amount(INR)'
  key    cast( ( a.JOIG_AMT * a.PriceDetnExchangeRate  ) as abap.dec( 20, 2 ) )                 as JOIG_AMT_inr,
         @UI.lineItem             : [{ position: 560 }]
         @DefaultAggregation: #SUM
         @EndUserText.label       : 'TCS Amount(INR)'
  key    cast( ( a.ZTCS_AMT * a.PriceDetnExchangeRate  ) as abap.dec( 20, 2 ) )                 as ZTCS_AMT_inr,
         @UI.lineItem             : [{ position: 561 }]
         @DefaultAggregation: #SUM
         @EndUserText.label       : 'Invoice Value(INR)'
  key    a.TotalInvocieAmountINR,

         @UI.lineItem             : [{ position: 570 }]
         @EndUserText.label       : 'LR NO.'
  key    a.YY1_LRNUMBER_BDH,
         @UI.lineItem             : [{ position: 580 }]
         @EndUserText.label       : 'LR Date'
  key    a.YY1_LRDATE_BDH,


         //"""""""""""""" IRN EWAY Data
         @UI.lineItem             : [{ position: 590 }]
         @EndUserText.label       : 'Ack No'
  key    a.AckNo,
         @UI.lineItem             : [{ position: 600 }]
         @EndUserText.label       : 'Ack Date'
  key    a.AckDate,
         @UI.lineItem             : [{ position: 610 }]
         @EndUserText.label       : 'IRN No'
  key    a.Irn,
         @UI.lineItem             : [{ position: 620 }]
         @EndUserText.label       : 'Eway No'
  key    a.Ebillno,
         @UI.lineItem             : [{ position: 630 }]
         @EndUserText.label       : 'Eway Bill ValidOn'
  key    a.Vdfmdate,
         @UI.lineItem             : [{ position: 640 }]
         @EndUserText.label       : 'Eway Bill ValidTo'
  key    a.Vdtodate,


         // """"""""""""""""" TRANSPORTER DATA
         @UI.lineItem             : [{ position: 650 }]
         @EndUserText.label       : 'Transporter Code'
  key    a.TRNSCustomer,
         @UI.lineItem             : [{ position: 660 }]
         @EndUserText.label       : 'Transporter Name'
  key    a.TransporterName,
         @UI.lineItem             : [{ position: 670 }]
         @EndUserText.label       : 'Transporter GSTIN'
  key    a.TRNSTaxNumber3,
         @UI.lineItem             : [{ position: 680 }]
         @EndUserText.label       : 'Transporter Region'
  key    a.TRNSRegion,
         @UI.lineItem             : [{ position: 690 }]
         @EndUserText.label       : 'Transporter Region Name'
  key    a.TRNSRegionName,
         @UI.lineItem             : [{ position: 700 }]
         @EndUserText.label       : 'Transporter City'
  key    a.TRNSCityName,
         @UI.lineItem             : [{ position: 710 }]
         @EndUserText.label       : 'Transporter Postal Code'
  key    a.TRNSPostalCode,

         @UI.lineItem             : [{ position: 720 }]
         @DefaultAggregation: #SUM
         @EndUserText.label       : 'Duty Saved Amount(INR)'
  key    cast( ( a.ZADS_AMT * a.PriceDetnExchangeRate  ) as abap.dec( 20, 2 ) )                 as ZADS_AMT_inr,

         @UI.lineItem             : [{ position: 730 }]
         @EndUserText.label       : 'Advance Licence No'
  key    a.YY1_AdvanceLicenceNo_BDH,
         @UI.lineItem             : [{ position: 740 }]
         @EndUserText.label       : 'Form A'
  key    a.YY1_FormA_BDH,
         @UI.lineItem             : [{ position: 750 }]
         @EndUserText.label       : 'Vehicle No.'
  key    a.YY1_VehicleNumber_BDH,
         @UI.lineItem             : [{ position: 760 }]
         @EndUserText.label       : 'Exp. Shipping Bill No.'
  key    a.ShippingBillNo,
         @UI.lineItem             : [{ position: 770 }]
         @EndUserText.label       : 'Exp. Shipping PortNo.'
  key    a.ShippingBillDate


         //
         //    key a.CompanyCode,
         //    key a.CancelledBillingDocument,
         //    key a.BillingDocumentItem,
         //    key a.ExternalProductGroup,
         //    key a.ExternalProductGroupName,
         //    key a.PlantName,
         //    key a.RequestedDeliveryDate,
         //    key a.zDays,
         //    key a.FiscalYear,
         //    key a.SalesOrganization,
         //    key a.SalesOrganizationName,
         //    key a.IncotermsClassification,
         //    key a.CustomerPaymentTerms,
         //
         //         @UI.lineItem             : [{ position: 220 }]
         //         @DefaultAggregation:  #SUM
         //         @EndUserText.label       : 'Item Net Weight'
         //         @Semantics.quantity.unitOfMeasure: 'ItemWeightUnit'
         //    key a.ItemNetWeight,
         //      @UI.lineItem             : [{ position: 230 }]
         //         @DefaultAggregation:  #SUM
         //         @EndUserText.label       : 'Item Gross Weight'
         //         @Semantics.quantity.unitOfMeasure: 'ItemWeightUnit'
         //    key a.ItemGrossWeight,
         //    key a.SalesDocumentDate,
         //    key a.CustomerPurchaseOrderDate,
         //    key a.ReferenceSDDocument,
         //    key a.SOLDCustomer,
         //    key a.SOLDToParty,
         //    key a.SOLDCityName,
         //    key a.SOLDPostalCode,
         //    key a.SOLDRegion,
         //    key a.SOLDRegionName,
         //    key a.SOLDTaxNumber3,
         //    key a.ZR00_AMT,
         //    key a.ZR00_AMT_inr,
         //    key a.ZA01_AMT,
         //    key a.TotalTaxableAmount,
         //    key a.TotalTaxableAmount_inr,
         //    key a.TaxAmount,
         //    key a.TotalInvocieAmount,
         //    key a.TotalInvocieAmountINR,
         //    key a.ZBAS_AMT,
         //
         //
         //
         //    key a.BillingDocumentIsCancelled,
         //    key a.Quatation,
         //    key a.ZI01_AMT,
         //    key a.ZC01_AMT,
         //    key a.ZP01_AMT,
         //    key a.ZP02_AMT,
         //    key a.ZROF_AMT,
         //
         //
         //    key a.YY1_ExpShippingPortNo_BDH,
         //    key a.YY1_Portofloading_BDH,
         //    key a.YY1_TransportMode_BDH,
         //    key a.YY1_VendorCode_BDH,
         //    key a.VF03_URL,
         //    key a.ItemWeightUnit

}
where
  (
       a.BillingDocumentType = 'G2'
    or a.BillingDocumentType = 'L2'
    or a.BillingDocumentType = 'CBRE'
    or a.BillingDocumentType = 'F2'
  )
  and a.CancelledBillingDocument = ''
  and a.BillingDocumentIsCancelled = ''
