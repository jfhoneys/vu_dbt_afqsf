with aqb__activityreport__c as ( select * from {{ source('sfdc_aqb','aqb__activityreport__c') }}
), 
final 
as ( select  
 trim(id) as aqb__activityreport__c_id
,trim(ownerid) as ownerid
,isdeleted as isdeleted
,trim(name) as name
,trim(recordtypeid) as recordtypeid
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,lastvieweddate as lastvieweddate
,lastreferenceddate as lastreferenceddate
,trim(aqb__account__c) as aqb__account__c
,aqb__activitydatetime__c as aqb__activitydatetime__c
,aqb__activitydate__c as aqb__activitydate__c
,trim(aqb__activitysummary__c) as aqb__activitysummary__c
,trim(aqb__calldisposition__c) as aqb__calldisposition__c
,aqb__calldurationinseconds__c as aqb__calldurationinseconds__c
,trim(aqb__callobject__c) as aqb__callobject__c
,trim(aqb__confidentialcomment__c) as aqb__confidentialcomment__c
,aqb__date__c as aqb__date__c
,trim(aqb__description__c) as aqb__description__c
,aqb__durationinminutes__c as aqb__durationinminutes__c
,aqb__enddatetime__c as aqb__enddatetime__c
,aqb__essentialmove__c as aqb__essentialmove__c
,trim(aqb__followup__c) as aqb__followup__c
,aqb__isalldayevent__c as aqb__isalldayevent__c
,aqb__isprivate__c as aqb__isprivate__c
,aqb__isvisibleinselfservice__c as aqb__isvisibleinselfservice__c
,trim(aqb__location__c) as aqb__location__c
,trim(aqb__objective__c) as aqb__objective__c
,trim(aqb__opportunity__c) as aqb__opportunity__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqb__priority__c) as aqb__priority__c
,trim(aqb__purpose__c) as aqb__purpose__c
,trim(aqb__reportstatus__c) as aqb__reportstatus__c
,trim(aqb__reportsummary__c) as aqb__reportsummary__c
,trim(aqb__result__c) as aqb__result__c
,aqb__startdatetime__c as aqb__startdatetime__c
,trim(aqb__status__c) as aqb__status__c
,trim(aqb__stewardship__c) as aqb__stewardship__c
,trim(aqb__subjectaq__c) as aqb__subjectaq__c
,trim(aqb__subject__c) as aqb__subject__c
,trim(aqb__type__c) as aqb__type__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,trim(event__c) as event__c
,trim(vu_outcome__c) as vu_outcome__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__activityreport__c
) 
select * from final 
