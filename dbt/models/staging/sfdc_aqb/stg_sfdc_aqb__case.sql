with case as ( select * from {{ source('sfdc_aqb','case') }}
), 
final 
as ( select  
 trim(id) as case_id
,isdeleted as isdeleted
,trim(masterrecordid) as masterrecordid
,trim(casenumber) as casenumber
,trim(contactid) as contactid
,trim(accountid) as accountid
,trim(parentid) as parentid
,trim(suppliedname) as suppliedname
,trim(suppliedemail) as suppliedemail
,trim(suppliedphone) as suppliedphone
,trim(suppliedcompany) as suppliedcompany
,trim(type) as type
,trim(recordtypeid) as recordtypeid
,trim(status) as status
,trim(reason) as reason
,trim(origin) as origin
,trim(subject) as subject
,trim(priority) as priority
,trim(description) as description
,isclosed as isclosed
,closeddate as closeddate
,isescalated as isescalated
,trim(ownerid) as ownerid
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,trim(contactphone) as contactphone
,trim(contactmobile) as contactmobile
,trim(contactemail) as contactemail
,trim(contactfax) as contactfax
,trim(comments) as comments
,lastvieweddate as lastvieweddate
,lastreferenceddate as lastreferenceddate
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,trim(audience_for_request__c) as audience_for_request__c
,trim(due_date_flexibility__c) as due_date_flexibility__c
,trim(marital_status__c) as marital_status__c
,trim(new_address__c) as new_address__c
,trim(new_employment__c) as new_employment__c
,trim(new_name__c) as new_name__c
,trim(pm_assignment__c) as pm_assignment__c
,trim(proposed_rating__c) as proposed_rating__c
,trim(proposed_stage__c) as proposed_stage__c
,trim(related_event__c) as related_event__c
,trim(related_gift_pledge__c) as related_gift_pledge__c
,trim(report_exclusions__c) as report_exclusions__c
,trim(report_output_format__c) as report_output_format__c
,trim(report_recipient__c) as report_recipient__c
,trim(report_recurrence__c) as report_recurrence__c
,trim(request_source__c) as request_source__c
,requested_due_date__c as requested_due_date__c
,trim(school_unit__c) as school_unit__c
,trim(spouse_name__c) as spouse_name__c
,trim(vu_secondary_assigned_to__c) as vu_secondary_assigned_to__c
,user_created__c as user_created__c
,trim(vu_requested_by__c) as vu_requested_by__c
,trim(vu_assigned_to__c) as vu_assigned_to__c
,trim(vu_requested_for__c) as vu_requested_for__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from case
) 
select * from final 
