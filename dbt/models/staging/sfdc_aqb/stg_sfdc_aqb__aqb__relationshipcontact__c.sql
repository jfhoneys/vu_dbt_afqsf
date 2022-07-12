with aqb__relationshipcontact__c as ( select * from {{ source('sfdc_aqb','aqb__relationshipcontact__c') }}
), 
final 
as ( select  
 trim(id) as aqb__relationshipcontact__c_id
,trim(ownerid) as ownerid
,isdeleted as isdeleted
,trim(name) as name
,trim(recordtypeid) as recordtypeid
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,trim(aqb__contactid__c) as aqb__contactid__c
,trim(aqb__contactrolegroup__c) as aqb__contactrolegroup__c
,trim(aqb__contactrole__c) as aqb__contactrole__c
,aqb__enddate__c as aqb__enddate__c
,trim(aqb__ended__c) as aqb__ended__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqb__relatedcontactrole__c) as aqb__relatedcontactrole__c
,trim(aqb__relatedname__c) as aqb__relatedname__c
,trim(aqb__relatedto__c) as aqb__relatedto__c
,trim(aqb__relationshippair__c) as aqb__relationshippair__c
,trim(aqb__relationship_type__c) as aqb__relationship_type__c
,trim(aqb__relationship__c) as aqb__relationship__c
,trim(aqb__reverserelationship__c) as aqb__reverserelationship__c
,trim(aqb__source__c) as aqb__source__c
,aqb__startdate__c as aqb__startdate__c
,trim(aqb__started__c) as aqb__started__c
,trim(aqb__relatedcontact__c) as aqb__relatedcontact__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,trim(aqc_non_constituent_birthday__c) as aqc_non_constituent_birthday__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__relationshipcontact__c
) 
select * from final 
