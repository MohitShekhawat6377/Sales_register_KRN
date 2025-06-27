@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZBILL_PRICE_CONDITION'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZBILL_PRICE_CONDITION as select from  I_BillingDocumentItem as a

association [1..*] to I_BillingDocumentItemPrcgElmnt as ZR00 on ( ZR00.BillingDocument = $projection.BillingDocument and ZR00.BillingDocumentItem = $projection.BillingDocumentItem and ZR00.ConditionType = 'ZR00' and ZR00.ConditionInactiveReason != 'X' )
association [1..*] to I_BillingDocumentItemPrcgElmnt as ZD01 on ( ZD01.BillingDocument = $projection.BillingDocument and ZD01.BillingDocumentItem = $projection.BillingDocumentItem and ZD01.ConditionType = 'ZD01' and ZD01.ConditionInactiveReason != 'X' )
association [1..*] to I_BillingDocumentItemPrcgElmnt as ZD02 on ( ZD02.BillingDocument = $projection.BillingDocument and ZD02.BillingDocumentItem = $projection.BillingDocumentItem and ZD02.ConditionType = 'ZD02' and ZD02.ConditionInactiveReason != 'X' )
association [1..*] to I_BillingDocumentItemPrcgElmnt as ZA01 on ( ZA01.BillingDocument = $projection.BillingDocument and ZA01.BillingDocumentItem = $projection.BillingDocumentItem and ZA01.ConditionType = 'ZA01' and ZA01.ConditionInactiveReason != 'X' )
association [1..*] to I_BillingDocumentItemPrcgElmnt as ZC01 on ( ZC01.BillingDocument = $projection.BillingDocument and ZC01.BillingDocumentItem = $projection.BillingDocumentItem and ZC01.ConditionType = 'ZC01' and ZC01.ConditionInactiveReason != 'X' )
association [1..*] to I_BillingDocumentItemPrcgElmnt as ZF01 on ( ZF01.BillingDocument = $projection.BillingDocument and ZF01.BillingDocumentItem = $projection.BillingDocumentItem and ZF01.ConditionType = 'ZF01' and ZF01.ConditionInactiveReason != 'X' )
association [1..*] to I_BillingDocumentItemPrcgElmnt as ZI01 on ( ZI01.BillingDocument = $projection.BillingDocument and ZI01.BillingDocumentItem = $projection.BillingDocumentItem and ZI01.ConditionType = 'ZI01' and ZI01.ConditionInactiveReason != 'X' )
association [1..*] to I_BillingDocumentItemPrcgElmnt as ZP01 on ( ZP01.BillingDocument = $projection.BillingDocument and ZP01.BillingDocumentItem = $projection.BillingDocumentItem and ZP01.ConditionType = 'ZP01' and ZP01.ConditionInactiveReason != 'X' )
association [1..*] to I_BillingDocumentItemPrcgElmnt as ZP02 on ( ZP02.BillingDocument = $projection.BillingDocument and ZP02.BillingDocumentItem = $projection.BillingDocumentItem and ZP02.ConditionType = 'ZP02' and ZP02.ConditionInactiveReason != 'X' )
association [1..*] to I_BillingDocumentItemPrcgElmnt as ZPOS on ( ZPOS.BillingDocument = $projection.BillingDocument and ZPOS.BillingDocumentItem = $projection.BillingDocumentItem and ZPOS.ConditionType = 'ZPOS' and ZPOS.ConditionInactiveReason != 'X' )
association [1..*] to I_BillingDocumentItemPrcgElmnt as JOCG on ( JOCG.BillingDocument = $projection.BillingDocument and JOCG.BillingDocumentItem = $projection.BillingDocumentItem and JOCG.ConditionType = 'JOCG' and JOCG.ConditionInactiveReason != 'X' )
association [1..*] to I_BillingDocumentItemPrcgElmnt as JOSG on ( JOSG.BillingDocument = $projection.BillingDocument and JOSG.BillingDocumentItem = $projection.BillingDocumentItem and JOSG.ConditionType = 'JOSG' and JOSG.ConditionInactiveReason != 'X' )
association [1..*] to I_BillingDocumentItemPrcgElmnt as JOIG on ( JOIG.BillingDocument = $projection.BillingDocument and JOIG.BillingDocumentItem = $projection.BillingDocumentItem and JOIG.ConditionType = 'JOIG' and JOIG.ConditionInactiveReason != 'X' )
association [1..*] to I_BillingDocumentItemPrcgElmnt as JOUG on ( JOUG.BillingDocument = $projection.BillingDocument and JOUG.BillingDocumentItem = $projection.BillingDocumentItem and JOUG.ConditionType = 'JOUG' and JOUG.ConditionInactiveReason != 'X' )
association [1..*] to I_BillingDocumentItemPrcgElmnt as JTC1 on ( JTC1.BillingDocument = $projection.BillingDocument and JTC1.BillingDocumentItem = $projection.BillingDocumentItem and JTC1.ConditionType = 'JTC1' and JTC1.ConditionInactiveReason != 'X' )
association [1..*] to I_BillingDocumentItemPrcgElmnt as JTC2 on ( JTC2.BillingDocument = $projection.BillingDocument and JTC2.BillingDocumentItem = $projection.BillingDocumentItem and JTC2.ConditionType = 'JTC2' and JTC2.ConditionInactiveReason != 'X' )
association [1..*] to I_BillingDocumentItemPrcgElmnt as JTCB on ( JTCB.BillingDocument = $projection.BillingDocument and JTCB.BillingDocumentItem = $projection.BillingDocumentItem and JTCB.ConditionType = 'JTCB' and JTCB.ConditionInactiveReason != 'X' )
association [1..*] to I_BillingDocumentItemPrcgElmnt as ZROF on ( ZROF.BillingDocument = $projection.BillingDocument and ZROF.BillingDocumentItem = $projection.BillingDocumentItem and ZROF.ConditionType = 'ZROF' and ZROF.ConditionInactiveReason != 'X' )
association [1..*] to I_BillingDocumentItemPrcgElmnt as ZBAS on ( ZBAS.BillingDocument = $projection.BillingDocument and ZBAS.BillingDocumentItem = $projection.BillingDocumentItem and ZBAS.ConditionType = 'ZBAS' and ZBAS.ConditionInactiveReason != 'X' )
association [1..*] to I_BillingDocumentItemPrcgElmnt as ZADS on ( ZADS.BillingDocument = $projection.BillingDocument and ZADS.BillingDocumentItem = $projection.BillingDocumentItem and ZADS.ConditionType = 'ZADS' and ZADS.ConditionInactiveReason != 'X' )
association [1..*] to I_BillingDocumentItemPrcgElmnt as ZTCS on ( ZTCS.BillingDocument = $projection.BillingDocument and ZTCS.BillingDocumentItem = $projection.BillingDocumentItem and ZTCS.ConditionType = 'ZTCS' and ZTCS.ConditionInactiveReason != 'X' )


{
    
    key a.BillingDocument ,
    key a.BillingDocumentItem , 
    
      cast(sum(ZR00.ConditionAmount) as abap.dec( 25, 2 ) ) as ZR00_AMT  ,
      cast(sum(ZD01.ConditionAmount) as abap.dec( 25, 2 ) ) as ZD01_AMT  ,
      cast(sum(ZD02.ConditionAmount) as abap.dec( 25, 2 ) ) as ZD02_AMT  ,
      cast(sum(ZA01.ConditionAmount) as abap.dec( 25, 2 ) ) as ZA01_AMT  ,
      cast(sum(ZC01.ConditionAmount) as abap.dec( 25, 2 ) ) as ZC01_AMT  ,
      cast(sum(ZF01.ConditionAmount) as abap.dec( 25, 2 ) ) as ZF01_AMT  ,
      cast(sum(ZI01.ConditionAmount) as abap.dec( 25, 2 ) ) as ZI01_AMT  ,
      cast(sum(ZP01.ConditionAmount) as abap.dec( 25, 2 ) ) as ZP01_AMT  ,
      cast(sum(ZP02.ConditionAmount) as abap.dec( 25, 2 ) ) as ZP02_AMT  ,
      cast(sum(ZPOS.ConditionAmount) as abap.dec( 25, 2 ) ) as ZPOS_AMT  ,
      cast(sum(JOCG.ConditionAmount) as abap.dec( 25, 2 ) ) as JOCG_AMT  ,
      cast(sum(JOSG.ConditionAmount) as abap.dec( 25, 2 ) ) as JOSG_AMT  ,
      cast(sum(JOIG.ConditionAmount) as abap.dec( 25, 2 ) ) as JOIG_AMT  ,
      cast(sum(JOUG.ConditionAmount) as abap.dec( 25, 2 ) ) as JOUG_AMT  ,
      cast(sum(JTC1.ConditionAmount) as abap.dec( 25, 2 ) ) as JTC1_AMT  ,
      cast(sum(JTC2.ConditionAmount) as abap.dec( 25, 2 ) ) as JTC2_AMT  ,
      cast(sum(JTCB.ConditionAmount) as abap.dec( 25, 2 ) ) as JTCB_AMT  ,
      cast(sum(ZROF.ConditionAmount) as abap.dec( 25, 2 ) ) as ZROF_AMT  ,
      cast(sum(ZBAS.ConditionAmount) as abap.dec( 25, 2 ) ) as ZBAS_AMT  ,
      cast(sum(ZADS.ConditionAmount) as abap.dec( 25, 2 ) ) as ZADS_AMT  ,
      cast(sum(ZTCS.ConditionAmount) as abap.dec( 25, 2 ) ) as ZTCS_AMT  ,
      
      cast(sum(ZR00.ConditionRateValue) as abap.dec( 25, 2 ) ) as ZR00_RATE ,
      cast(sum(ZD01.ConditionRateValue) as abap.dec( 25, 2 ) ) as ZD01_RATE  ,
      cast(sum(ZD02.ConditionRateValue) as abap.dec( 25, 2 ) ) as ZD02_RATE  ,
      cast(sum(ZA01.ConditionRateValue) as abap.dec( 25, 2 ) ) as ZA01_RATE  ,
      cast(sum(ZC01.ConditionRateValue) as abap.dec( 25, 2 ) ) as ZC01_RATE  ,
      cast(sum(ZF01.ConditionRateValue) as abap.dec( 25, 2 ) ) as ZF01_RATE  ,
      cast(sum(ZI01.ConditionRateValue) as abap.dec( 25, 2 ) ) as ZI01_RATE  ,
      cast(sum(ZP01.ConditionRateValue) as abap.dec( 25, 2 ) ) as ZP01_RATE  ,
      cast(sum(ZP02.ConditionRateValue) as abap.dec( 25, 2 ) ) as ZP02_RATE  ,
      cast(sum(ZPOS.ConditionRateValue) as abap.dec( 25, 2 ) ) as ZPOS_RATE  ,
      cast(sum(JOCG.ConditionRateValue) as abap.dec( 25, 2 ) ) as JOCG_RATE  ,
      cast(sum(JOSG.ConditionRateValue) as abap.dec( 25, 2 ) ) as JOSG_RATE  ,
      cast(sum(JOIG.ConditionRateValue) as abap.dec( 25, 2 ) ) as JOIG_RATE  ,
      cast(sum(JOUG.ConditionRateValue) as abap.dec( 25, 2 ) ) as JOUG_RATE  ,
      cast(sum(JTC1.ConditionRateValue) as abap.dec( 25, 2 ) ) as JTC1_RATE  ,
      cast(sum(JTC2.ConditionRateValue) as abap.dec( 25, 2 ) ) as JTC2_RATE  ,
      cast(sum(JTCB.ConditionRateValue) as abap.dec( 25, 2 ) ) as JTCB_RATE  ,
      cast(sum(ZROF.ConditionRateValue) as abap.dec( 25, 2 ) ) as ZROF_RATE  ,
      cast(sum(ZADS.ConditionRateValue) as abap.dec( 25, 2 ) ) as ZADS_RATE  ,
      cast(sum(ZTCS.ConditionRateValue) as abap.dec( 25, 2 ) ) as ZTCS_RATE  ,
      cast(sum(ZBAS.ConditionRateValue) as abap.dec( 25, 2 ) ) as ZBAS_RATE  
      
    
    
    
}

 group by 
 a.BillingDocument ,
 a.BillingDocumentItem
 
 
// """""""""""""""""""""""""""""""""""""""""""
//      Condition type  Condition Type Description
//      ZR00    Basic Price
//      ZD01    Discount %
//      ZD02    Discount Fixed Amount
//      ZA01    Agent Commission
//      ZC01    Cartage Charges
//      ZF01    Frieght Charges
//      ZI01    Insurance amount%
//      ZP01    Packing Charges
//      ZP02    Packing fix amount
//      ZPOS    Postage Charges
//      JOCG    IN: Central GST
//      JOIG    IN: Integrated GST
//      JOSG    IN: State GST
//      JOUG    IN: UGST GST
//      JTC1    IN: 206C(1H) Goods
//      JTC2    IN: 206C Others
//      JTCB    IN: TCS Base
//      ZROF    Rounding Off
//      ZBAS    Basic Amount

 
 