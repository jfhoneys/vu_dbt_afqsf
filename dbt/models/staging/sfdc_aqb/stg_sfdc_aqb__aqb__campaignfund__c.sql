with aqb__campaignfund__c as ( select * from {{ source('sfdc_aqb','aqb__campaignfund__c') }}
), 
final 
as ( select  
 trim(id) as aqb__campaignfund__c_id
,trim(ownerid) as ownerid
,isdeleted as isdeleted
,trim(name) as name
,trim(recordtypeid) as recordtypeid
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,lastactivitydate as lastactivitydate
,lastvieweddate as lastvieweddate
,lastreferenceddate as lastreferenceddate
,trim(aqb__alert__c) as aqb__alert__c
,trim(aqb__all_fundraising_campaigns__c) as aqb__all_fundraising_campaigns__c
,trim(aqb__business_unit__c) as aqb__business_unit__c
,trim(aqb__campaignfundexternalid__c) as aqb__campaignfundexternalid__c
,trim(aqb__description__c) as aqb__description__c
,aqb__donorgoal__c as aqb__donorgoal__c
,aqb__enddate__c as aqb__enddate__c
,aqb__fundbudget__c as aqb__fundbudget__c
,aqb__includeinannualfunddashboard__c as aqb__includeinannualfunddashboard__c
,trim(aqb__institutionalunit__c) as aqb__institutionalunit__c
,aqb__isactive__c as aqb__isactive__c
,trim(aqb__kpichart1__c) as aqb__kpichart1__c
,trim(aqb__kpichart2__c) as aqb__kpichart2__c
,trim(aqb__kpichart3__c) as aqb__kpichart3__c
,trim(aqb__kpichart4__c) as aqb__kpichart4__c
,trim(aqb__kpichart5__c) as aqb__kpichart5__c
,trim(aqb__kpichart6__c) as aqb__kpichart6__c
,trim(aqb__kpichartsize__c) as aqb__kpichartsize__c
,trim(aqb__master_fundraising_campaign__c) as aqb__master_fundraising_campaign__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,aqb__percentcomplete__c as aqb__percentcomplete__c
,aqb__percentofrevenuegoalattained__c as aqb__percentofrevenuegoalattained__c
,aqb__responserategoal__c as aqb__responserategoal__c
,trim(aqb__revenuecalculation__c) as aqb__revenuecalculation__c
,aqb__revenuegoal__c as aqb__revenuegoal__c
,aqb__startdate__c as aqb__startdate__c
,trim(aqb__status__c) as aqb__status__c
,aqb__totalcommitments__c as aqb__totalcommitments__c
,aqb__totalexpenses__c as aqb__totalexpenses__c
,aqb__totalrevenue__c as aqb__totalrevenue__c
,aqb__campaignbudgets__c as aqb__campaignbudgets__c
,aqb__campaignexpenses__c as aqb__campaignexpenses__c
,aqb__conditionalpledgebalance__c as aqb__conditionalpledgebalance__c
,aqb__fundexpenses__c as aqb__fundexpenses__c
,aqb__matchinggiftpaymentsdue__c as aqb__matchinggiftpaymentsdue__c
,aqb__matchinggiftpaymentsmade__c as aqb__matchinggiftpaymentsmade__c
,aqb__payments__c as aqb__payments__c
,aqb__unconditionalpledgebalance__c as aqb__unconditionalpledgebalance__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__campaignfund__c
) 
select * from final 
