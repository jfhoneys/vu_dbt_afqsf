with aqb__education__c as ( select * from {{ source('sfdc_aqb','aqb__education__c') }}
), 
final 
as ( select  
 trim(id) as aqb__education__c_id
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
,trim(aqb__areasofstudy__c) as aqb__areasofstudy__c
,trim(aqb__campus__c) as aqb__campus__c
,trim(aqb__certificationdescription__c) as aqb__certificationdescription__c
,trim(aqb__certification__c) as aqb__certification__c
,trim(aqb__conferringentity__c) as aqb__conferringentity__c
,trim(aqb__contactid__c) as aqb__contactid__c
,aqb__dateissued__c as aqb__dateissued__c
,trim(aqb__degreediploma__c) as aqb__degreediploma__c
,trim(aqb__degreelevel__c) as aqb__degreelevel__c
,trim(aqb__department__c) as aqb__department__c
,trim(aqb__entryclassyear__c) as aqb__entryclassyear__c
,aqb__expirationdate__c as aqb__expirationdate__c
,trim(aqb__firstyearofattendance__c) as aqb__firstyearofattendance__c
,trim(aqb__graduationyear__c) as aqb__graduationyear__c
,trim(aqb__graduation_month__c) as aqb__graduation_month__c
,trim(aqb__granting_school__c) as aqb__granting_school__c
,aqb__honorarydegree__c as aqb__honorarydegree__c
,trim(aqb__institution__c) as aqb__institution__c
,trim(aqb__institutionalunit__c) as aqb__institutionalunit__c
,trim(aqb__isprimarydegree__c) as aqb__isprimarydegree__c
,trim(aqb__lastyearofattendance__c) as aqb__lastyearofattendance__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqb__preferredyear__c) as aqb__preferredyear__c
,trim(aqb__school__c) as aqb__school__c
,trim(aqb__source__c) as aqb__source__c
,trim(aqb__specialty__c) as aqb__specialty__c
,trim(aqb__status__c) as aqb__status__c
,trim(aqb__subspecialtycategory__c) as aqb__subspecialtycategory__c
,trim(aqb__subspecialty__c) as aqb__subspecialty__c
,trim(aqb__type__c) as aqb__type__c
,trim(aqb__studentstatus__c) as aqb__studentstatus__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,trim(vu_gold_start_year__c) as vu_gold_start_year__c
,trim(vu_gold_end_year__c) as vu_gold_end_year__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__education__c
) 
select * from final 
