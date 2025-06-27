@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZSD_SR_Transporter'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSD_SR_Transporter as select from  I_BillingDocumentPartner as a 
                  left outer join I_Address_2  as b on( b.AddressID = a.AddressID )
                  left outer join I_Customer  as c on( c.Customer = a.Customer )
                  left outer join I_RegionText  as d on( d.Region = b.Region and d.Language = 'E' and d.Country = 'IN')
                   
                  
{ key a.BillingDocument,
  key a.Customer,
  key a.AddressID,
      concat(b.OrganizationName1,concat( b.OrganizationName2 ,concat( b.OrganizationName3,b.OrganizationName3  ))) as TransporterName,
      b.Region, 
      b.CityName, 
      b.PostalCode,  
      c.TaxNumber3,
      d.RegionName 
}where a.PartnerFunction = 'ZT'
