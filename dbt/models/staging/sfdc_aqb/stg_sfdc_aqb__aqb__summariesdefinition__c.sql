with aqb__summariesdefinition__c as ( select * from {{ source('sfdc_aqb','aqb__summariesdefinition__c') }}
), 
final 
as ( select  
 trim(id) as aqb__summariesdefinition__c_id
,trim(ownerid) as ownerid
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,lastvieweddate as lastvieweddate
,lastreferenceddate as lastreferenceddate
,aqb__activeflag__c as aqb__activeflag__c
,trim(aqb__calculation_field__c) as aqb__calculation_field__c
,trim(aqb__calculation_object__c) as aqb__calculation_object__c
,trim(aqb__calculation_type__c) as aqb__calculation_type__c
,trim(aqb__description__c) as aqb__description__c
,aqb__enddate__c as aqb__enddate__c
,trim(aqb__filter__c) as aqb__filter__c
,aqb__last_run_date__c as aqb__last_run_date__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,aqb__resetday__c as aqb__resetday__c
,trim(aqb__resetmonth__c) as aqb__resetmonth__c
,aqb__schedule_detail_day__c as aqb__schedule_detail_day__c
,trim(aqb__schedule_detail_month__c) as aqb__schedule_detail_month__c
,trim(aqb__schedule_detail__c) as aqb__schedule_detail__c
,trim(aqb__schedule_type__c) as aqb__schedule_type__c
,aqb__startdate__c as aqb__startdate__c
,aqb__year__c as aqb__year__c
,aqb__archivegivingclubs__c as aqb__archivegivingclubs__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__summariesdefinition__c
) 
select * from final 
