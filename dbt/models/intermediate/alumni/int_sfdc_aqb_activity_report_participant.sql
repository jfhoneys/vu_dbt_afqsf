with activity_report_participant as (select * from  {{ ref ('stg_sfdc_aqb__aqb__activityreportparticipant__c')}} where not isdeleted),
owner as (select * from {{ref ('stg_sfdc_aqb__user')}}),
created_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),
last_modified_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),



activity_report_participant_transform as
(select
activity_report_participant.aqb__activity_report_participant__c_id as activity_report_participant_id
-- , activity_report_participant.isdeleted as activity_report_participant_isdeleted
, activity_report_participant.name as activity_report_participant_name
, activity_report_participant.createddate as activity_report_participant_createddate
, activity_report_participant.createdbyid as activity_report_participant_createdbyid
-- , activity_report_participant.lastmodifieddate as activity_report_participant_lastmodifieddate
, activity_report_participant.lastmodifiedbyid as activity_report_participant_lastmodifiedbyid
-- , activity_report_participant.systemmodstamp as activity_report_participant_systemmodstamp
, activity_report_participant.aqb__activityreport__c as activity_report_participant_activityreport
-- , activity_report_participant.aqb__userrole__c as activity_report_participant_userrole
, activity_report_participant.aqb__user__c as activity_report_participant_user
-- , activity_report_participant.aqcv_conversionid__c as activity_report_participant_aqcv_conversionid
, activity_report_participant.matillion_batch_id as activity_report_participant_matillion_batch_id
, activity_report_participant.matillion_updated_timestamp as activity_report_participant_matillion_updated_timestamp
, activity_report_participant.source_name as activity_report_participant_source_name
    from activity_report
    ),

final as (select -- select count(1) as cnt from trans
             activity_report_participant_transform.*
             , owner.name as activity_report_participant_owner_name
             , created_by.name as activity_report_participant_creator_name
             , last_modified_by.name as activity_report_participant_last_modified_by_name
        from activity_report_participant_transform
             join owner on activity_report_participant_transform.activity_report_participant_ownerid = owner.user_id
             join created_by on activity_report_participant_transform.activity_report_participant_createdbyid = created_by.user_id
             join last_modified_by on activity_report_participant_transform.activity_report_participant_lastmodifiedbyid = last_modified_by.user_id
)

/*clean select*/
select * from final