with aqb__relationshipaccount__c as ( select * from {{ source('sfdc_aqb','aqb__relationshipaccount__c') }}
), 
final 
as ( select  
 trim(id) as aqb__relationshipaccount__c_id
,trim(ownerid) as ownerid
,isdeleted as isdeleted
,trim(name) as name
,trim(recordtypeid) as recordtypeid
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,trim(aqb__accountid__c) as aqb__accountid__c
,trim(aqb__accountrolegroup__c) as aqb__accountrolegroup__c
,trim(aqb__accountrole__c) as aqb__accountrole__c
,aqb__awardsoftcredit__c as aqb__awardsoftcredit__c
,aqb__enddate__c as aqb__enddate__c
,trim(aqb__ended__c) as aqb__ended__c
,trim(aqb__givesoftcredit__c) as aqb__givesoftcredit__c
,trim(aqb__linkedrelationship__c) as aqb__linkedrelationship__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqb__relatedaccountrole__c) as aqb__relatedaccountrole__c
,trim(aqb__relatedaccount__c) as aqb__relatedaccount__c
,trim(aqb__relatedto__c) as aqb__relatedto__c
,trim(aqb__relationshippair__c) as aqb__relationshippair__c
,trim(aqb__source__c) as aqb__source__c
,aqb__startdate__c as aqb__startdate__c
,trim(aqb__started__c) as aqb__started__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__relationshipaccount__c
) 
select * from final 
