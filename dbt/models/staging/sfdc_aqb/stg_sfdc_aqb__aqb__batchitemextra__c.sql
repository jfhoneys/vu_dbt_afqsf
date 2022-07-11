with aqb__batchitemextra__c as ( select * from {{ source('sfdc_aqb','aqb__batchitemextra__c') }}
), 
final 
as ( select  
 trim(id) as aqb__batchitemextra__c_id
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,trim(aqb__batchitem__c) as aqb__batchitem__c
,trim(aqb__acknowledgement__c) as aqb__acknowledgement__c
,aqb__amount__c as aqb__amount__c
,trim(aqb__campaignappeal__c) as aqb__campaignappeal__c
,aqb__conditionalpledge__c as aqb__conditionalpledge__c
,aqb__creditedyearoverridedate__c as aqb__creditedyearoverridedate__c
,aqb__currencyexchangerate__c as aqb__currencyexchangerate__c
,aqb__currencyunits__c as aqb__currencyunits__c
,trim(aqb__currency__c) as aqb__currency__c
,aqb__datedue__c as aqb__datedue__c
,aqb__date__c as aqb__date__c
,trim(aqb__description__c) as aqb__description__c
,trim(aqb__designation__c) as aqb__designation__c
,aqb__frequency__c as aqb__frequency__c
,trim(aqb__method__c) as aqb__method__c
,aqb__numberofpayments__c as aqb__numberofpayments__c
,aqb__paymentnumber__c as aqb__paymentnumber__c
,aqb__pledgeenddate__c as aqb__pledgeenddate__c
,trim(aqb__pledgeinterval__c) as aqb__pledgeinterval__c
,trim(aqb__pledgescheduletype__c) as aqb__pledgescheduletype__c
,aqb__pledgestartdate__c as aqb__pledgestartdate__c
,trim(aqb__pledgestipulation__c) as aqb__pledgestipulation__c
,trim(aqb__reference__c) as aqb__reference__c
,aqb__sendpledgereminder__c as aqb__sendpledgereminder__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__batchitemextra__c
) 
select * from final 
