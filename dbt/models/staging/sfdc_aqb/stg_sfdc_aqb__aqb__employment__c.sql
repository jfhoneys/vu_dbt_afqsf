with aqb__employment__c as ( select * from {{ source('sfdc_aqb','aqb__employment__c') }}
), 
final 
as ( select  
 trim(id) as aqb__employment__c_id
,trim(ownerid) as ownerid
,isdeleted as isdeleted
,trim(name) as name
,trim(recordtypeid) as recordtypeid
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,trim(aqb__assistant_s_email__c) as aqb__assistant_s_email__c
,trim(aqb__assistant_s_name__c) as aqb__assistant_s_name__c
,trim(aqb__assistant_s_phone__c) as aqb__assistant_s_phone__c
,trim(aqb__businessphone__c) as aqb__businessphone__c
,trim(aqb__contactid__c) as aqb__contactid__c
,trim(aqb__corporate_phone__c) as aqb__corporate_phone__c
,aqb__donotarchive__c as aqb__donotarchive__c
,trim(aqb__earnings__c) as aqb__earnings__c
,trim(aqb__employernamedisplay__c) as aqb__employernamedisplay__c
,trim(aqb__employername__c) as aqb__employername__c
,trim(aqb__employmentcomment__c) as aqb__employmentcomment__c
,trim(aqb__employmentexternalid__c) as aqb__employmentexternalid__c
,aqb__enddate__c as aqb__enddate__c
,trim(aqb__ended__c) as aqb__ended__c
,trim(aqb__fax_number__c) as aqb__fax_number__c
,trim(aqb__industry__c) as aqb__industry__c
,trim(aqb__isprimaryemployer__c) as aqb__isprimaryemployer__c
,trim(aqb__level__c) as aqb__level__c
,trim(aqb__linkedaddress__c) as aqb__linkedaddress__c
,trim(aqb__linkedemployer__c) as aqb__linkedemployer__c
,trim(aqb__occupation__c) as aqb__occupation__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,aqb__primaryemployment__c as aqb__primaryemployment__c
,trim(aqb__source__c) as aqb__source__c
,aqb__startdate__c as aqb__startdate__c
,trim(aqb__started__c) as aqb__started__c
,trim(aqb__status__c) as aqb__status__c
,trim(aqb__title__c) as aqb__title__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,trim(aqb__engagementscorecategory__c) as aqb__engagementscorecategory__c
,aqb__engagementscoreoverride__c as aqb__engagementscoreoverride__c
,aqb__engagementscore__c as aqb__engagementscore__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__employment__c
) 
select * from final 
