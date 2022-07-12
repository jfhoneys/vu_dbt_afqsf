with opportunityteammember as ( select * from {{ source('sfdc_aqb','opportunityteammember') }}
), 
final 
as ( select  
 trim(id) as opportunityteammember_id
,trim(opportunityid) as opportunityid
,trim(userid) as userid
,trim(name) as name
,trim(photourl) as photourl
,trim(title) as title
,trim(teammemberrole) as teammemberrole
,trim(opportunityaccesslevel) as opportunityaccesslevel
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,isdeleted as isdeleted
,aqb__enddate__c as aqb__enddate__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,aqb__percentcredit__c as aqb__percentcredit__c
,aqb__startdate__c as aqb__startdate__c
,trim(aqcv_conversion_id__c) as aqcv_conversion_id__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from opportunityteammember
) 
select * from final 
