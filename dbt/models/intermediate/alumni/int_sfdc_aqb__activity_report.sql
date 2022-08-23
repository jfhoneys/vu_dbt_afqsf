
with activity_report as (select * from  {{ ref ('stg_sfdc_aqb__aqb__activityreport__c')}} where not isdeleted),
owner as (select * from {{ref ('stg_sfdc_aqb__user')}}),
created_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),
last_modified_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),
activity_report_transform as
(select
activity_report.aqb__activityreport__c_id as activity_report_id
-- , activity_report.isdeleted as activity_report_isdeleted
, activity_report.name as activity_report_name
, activity_report.recordtypeid as activity_report_recordtypeid
-- , activity_report.createddate as activity_report_createddate
-- , activity_report.lastvieweddate as activity_report_lastvieweddate
-- , activity_report.lastreferenceddate as activity_report_lastreferenceddate
, activity_report.aqb__account__c as activity_report_account
-- , activity_report.aqb__activitydatetime__c as activity_report_activitydatetime
, activity_report.aqb__activitydate__c as activity_report_activitydate
-- , activity_report.aqb__activitysummary__c as activity_report_activitysummary
-- , activity_report.aqb__calldisposition__c as activity_report_calldisposition
-- , activity_report.aqb__calldurationinseconds__c as activity_report_calldurationinseconds
-- , activity_report.aqb__callobject__c as activity_report_callobject
-- , activity_report.aqb__confidentialcomment__c as activity_report_confidentialcomment
, activity_report.aqb__date__c as activity_report_date
, activity_report.aqb__description__c as activity_report_description
-- , activity_report.aqb__durationinminutes__c as activity_report_durationinminutes
-- , activity_report.aqb__enddatetime__c as activity_report_enddatetime
-- , activity_report.aqb__essentialmove__c as activity_report_essentialmove
-- , activity_report.aqb__followup__c as activity_report_followup
-- , activity_report.aqb__isalldayevent__c as activity_report_isalldayevent
-- , activity_report.aqb__isprivate__c as activity_report_isprivate
-- , activity_report.aqb__isvisibleinselfservice__c as activity_report_isvisibleinselfservice
-- , activity_report.aqb__location__c as activity_report_location
-- , activity_report.aqb__objective__c as activity_report_objective
-- , activity_report.aqb__opportunity__c as activity_report_opportunity
-- , activity_report.aqb__ownerunit__c as activity_report_ownerunit
-- , activity_report.aqb__priority__c as activity_report_priority
, activity_report.aqb__purpose__c as activity_report_purpose
, activity_report.aqb__reportstatus__c as activity_report_report_status
, activity_report.aqb__reportsummary__c as activity_report_report_summary
-- , activity_report.aqb__result__c as activity_report_result
-- , activity_report.aqb__startdatetime__c as activity_report_startdatetime
, activity_report.aqb__status__c as activity_report_status
-- , activity_report.aqb__stewardship__c as activity_report_stewardship
-- , activity_report.aqb__subjectaq__c as activity_report_subjectaq
, activity_report.aqb__subject__c as activity_report_subject
, activity_report.aqb__type__c as activity_report_type
-- , activity_report.aqcv_conversionid__c as activity_report_aqcv_conversionid
-- , activity_report.event__c as activity_report_event
-- , activity_report.vu_outcome__c as activity_report_vu_outcome
, activity_report.ownerid as activity_report_ownerid
, activity_report.createdbyid as activity_report_createdbyid
, activity_report.lastmodifieddate as activity_report_lastmodifieddate
, activity_report.lastmodifiedbyid as activity_report_lastmodifiedbyid
, activity_report.systemmodstamp as activity_report_system_modstamp
, activity_report.matillion_batch_id as activity_report_matillion_batch_id
, activity_report.matillion_updated_timestamp as activity_report_matillion_updated_timestamp
, activity_report.source_name as activity_report_source_name
    from activity_report
    ),

final as (select
             activity_report_transform.*
             , owner.name as activity_report_owner_name
             , created_by.name as activity_report_creator_name
             , last_modified_by.name as activity_report_last_modified_by_name
        from activity_report_transform
             join owner on activity_report_transform.activity_report_ownerid = owner.user_id
             join created_by on activity_report_transform.activity_report_createdbyid = created_by.user_id
             join last_modified_by on activity_report_transform.activity_report_lastmodifiedbyid = last_modified_by.user_id
)

select * from final