with aqb__volunteerposition__c as ( select * from {{ source('sfdc_aqb','aqb__volunteerposition__c') }}
), 
final 
as ( select  
 trim(id) as aqb__volunteerposition__c_id
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
,aqb__activeflag__c as aqb__activeflag__c
,trim(aqb__affiliatedorganization__c) as aqb__affiliatedorganization__c
,trim(aqb__comment__c) as aqb__comment__c
,trim(aqb__contactid__c) as aqb__contactid__c
,aqb__hours__c as aqb__hours__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqb__role__c) as aqb__role__c
,aqb__startdate__c as aqb__startdate__c
,aqb__stopdate__c as aqb__stopdate__c
,trim(aqb__volunteerexternalid__c) as aqb__volunteerexternalid__c
,trim(aqb__volunteer_category__c) as aqb__volunteer_category__c
,trim(aqb__volunteer_position__c) as aqb__volunteer_position__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,trim(aqc_organization_name__c) as aqc_organization_name__c
,trim(aqc_staffmember__c) as aqc_staffmember__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__volunteerposition__c
) 
select * from final 
