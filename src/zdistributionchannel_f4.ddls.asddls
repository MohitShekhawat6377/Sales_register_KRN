@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DistributionChannel F4'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZDistributionChannel_F4
  as select from I_DistributionChannelText as A

{
  key A.DistributionChannel,
      A.DistributionChannelName
}
where
  A.Language = 'E'
