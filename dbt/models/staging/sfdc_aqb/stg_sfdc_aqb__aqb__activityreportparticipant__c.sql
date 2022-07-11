with aqb__activityreportparticipant__c as ( select * from {{ source('sfdc_aqb','aqb__activityreportparticipant__c') }}
), 
final 
as ( select  
 trim(id) as aqb__activityreportparticipant__c_id
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,trim(aqb__activityreport__c) as aqb__activityreport__c
,trim(aqb__userrole__c) as aqb__userrole__c
,trim(aqb__user__c) as aqb__user__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__activityreportparticipant__c
) 
select * from final 
