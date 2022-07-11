with aqb__affiliation__c as ( select * from {{ source('sfdc_aqb','aqb__affiliation__c') }}
), 
final 
as ( select  
 trim(id) as aqb__affiliation__c_id
,trim(ownerid) as ownerid
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,trim(aqb__accountrolegroup__c) as aqb__accountrolegroup__c
,trim(aqb__accountrole__c) as aqb__accountrole__c
,trim(aqb__account__c) as aqb__account__c
,aqb__awardgiftcredit__c as aqb__awardgiftcredit__c
,trim(aqb__contactid__c) as aqb__contactid__c
,trim(aqb__contactrole__c) as aqb__contactrole__c
,aqb__enddate__c as aqb__enddate__c
,trim(aqb__ended__c) as aqb__ended__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqb__source__c) as aqb__source__c
,aqb__startdate__c as aqb__startdate__c
,trim(aqb__started__c) as aqb__started__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__affiliation__c
) 
select * from final 
