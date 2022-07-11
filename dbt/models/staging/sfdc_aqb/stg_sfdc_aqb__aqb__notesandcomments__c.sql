with aqb__notesandcomments__c as ( select * from {{ source('sfdc_aqb','aqb__notesandcomments__c') }}
), 
final 
as ( select  
 trim(id) as aqb__notesandcomments__c_id
,trim(ownerid) as ownerid
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,lastactivitydate as lastactivitydate
,lastvieweddate as lastvieweddate
,lastreferenceddate as lastreferenceddate
,trim(aqb__account__c) as aqb__account__c
,aqb__amount__c as aqb__amount__c
,trim(aqb__contact__c) as aqb__contact__c
,aqb__dateofpublication__c as aqb__dateofpublication__c
,trim(aqb__gift__c) as aqb__gift__c
,trim(aqb__note__c) as aqb__note__c
,trim(aqb__opportunity__c) as aqb__opportunity__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqb__source__c) as aqb__source__c
,trim(aqb__subtype__c) as aqb__subtype__c
,trim(aqb__type__c) as aqb__type__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,trim(aqc_llchartofaccount__c) as aqc_llchartofaccount__c
,trim(vu_subject_line__c) as vu_subject_line__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__notesandcomments__c
) 
select * from final 
