with aqb__awardrecipients__c as ( select * from {{ source('sfdc_aqb','aqb__awardrecipients__c') }}
), 
final 
as ( select  
 trim(id) as aqb__awardrecipients__c_id
,trim(ownerid) as ownerid
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,lastactivitydate as lastactivitydate
,aqb__amount__c as aqb__amount__c
,trim(aqb__awarddesignationsource__c) as aqb__awarddesignationsource__c
,trim(aqb__awardid__c) as aqb__awardid__c
,trim(aqb__comments__c) as aqb__comments__c
,trim(aqb__contactid__c) as aqb__contactid__c
,aqb__enddate__c as aqb__enddate__c
,trim(aqb__note__c) as aqb__note__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,aqb__startdate__c as aqb__startdate__c
,trim(aqb__type__c) as aqb__type__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__awardrecipients__c
) 
select * from final 
