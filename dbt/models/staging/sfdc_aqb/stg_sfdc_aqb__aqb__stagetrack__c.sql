with aqb__stagetrack__c as ( select * from {{ source('sfdc_aqb','aqb__stagetrack__c') }}
), 
final 
as ( select  
 trim(id) as aqb__stagetrack__c_id
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,trim(aqb__opportunity__c) as aqb__opportunity__c
,aqb__amount__c as aqb__amount__c
,aqb__daysinstage__c as aqb__daysinstage__c
,aqb__enddate__c as aqb__enddate__c
,trim(aqb__owner__c) as aqb__owner__c
,aqb__probability__c as aqb__probability__c
,trim(aqb__stagecomment__c) as aqb__stagecomment__c
,trim(aqb__stage__c) as aqb__stage__c
,aqb__startdate__c as aqb__startdate__c
,trim(aqb__user__c) as aqb__user__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__stagetrack__c
) 
select * from final 
