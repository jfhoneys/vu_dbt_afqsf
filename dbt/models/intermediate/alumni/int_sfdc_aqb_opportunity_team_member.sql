with opportunity_team_member as (select * from  {{ ref ('stg_sfdc_aqb__opportunityteammember')}} where not isdeleted),
owner as (select * from {{ref ('stg_sfdc_aqb__user')}}),
created_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),
last_modified_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),



opportunity_team_member_transform as
(select
 opportunity_team_member.opportunityteammember_id as opportunity_team_member_id
, opportunity_team_member.opportunityid as opportunity_team_member_opportunityid
, opportunity_team_member.userid as opportunity_team_member_userid
, opportunity_team_member.name as opportunity_team_member_team_member_name
-- , opportunity_team_member.photourl as opportunity_team_member_team_member_photourl
-- , opportunity_team_member.title as opportunity_team_member_team_member_title
, opportunity_team_member.teammemberrole as opportunity_team_member_team_member_teammemberrole
-- , opportunity_team_member.opportunityaccesslevel as opportunity_team_member_opportunityaccesslevel
-- , opportunity_team_member.createddate as opportunity_team_member_createddate
, opportunity_team_member.createdbyid as opportunity_team_member_createdbyid
-- , opportunity_team_member.lastmodifieddate as opportunity_team_member_lastmodifieddate
, opportunity_team_member.lastmodifiedbyid as opportunity_team_member_lastmodifiedbyid
-- , opportunity_team_member.systemmodstamp as opportunity_team_member_systemmodstamp
-- , opportunity_team_member.isdeleted as opportunity_team_member_isdeleted
-- , opportunity_team_member.aqb__enddate__c as opportunity_team_member_enddate
, opportunity_team_member.aqb__ownerunit__c as opportunity_team_memberownerunit
, opportunity_team_member.aqb__percentcredit__c as opportunity_team_member_percentcredit
, opportunity_team_member.aqb__startdate__c as opportunity_team_member_startdate
, opportunity_team_member.aqcv_conversion_id__c as opportunity_team_member_aqcv_conversion_id
, opportunity_team_member.aqcv_conversionid__c as opportunity_team_member_aqcv_conversionid
, opportunity_team_member.matillion_batch_id as opportunity_team_member_matillion_batch_id
, opportunity_team_member.matillion_updated_timestamp as opportunity_team_member_matillion_updated_timestamp
, opportunity_team_member.source_name as opportunity_team_member_source_name
    from opportunity_team_member
    ),

final as (select -- select count(1) as cnt from trans
             opportunity_team_member_transform.*
--             , owner.name as opportunity_team_member_owner_name
             , created_by.name as opportunity_team_member_creator_name
             , last_modified_by.name as opportunity_team_member_last_modified_by_name
        from opportunity_team_member_transform
--             join owner on opportunity_team_member_transform.opportunity_team_member_ownerid = owner.user_id
             join created_by on opportunity_team_member_transform.opportunity_team_member_createdbyid = created_by.user_id
             join last_modified_by on opportunity_team_member_transform.opportunity_team_member_lastmodifiedbyid = last_modified_by.user_id
)

/*clean select*/
select * from final