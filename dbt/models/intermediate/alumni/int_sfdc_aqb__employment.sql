with employment as (select * from  {{ ref ('stg_sfdc_aqb__aqb__employment__c')}} where not isdeleted),
owner as (select * from {{ref ('stg_sfdc_aqb__user')}}),
created_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),
last_modified_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),

employment_transform as (
    select employment.AQB__EMPLOYMENT__C_ID as employment_id
-- , employment.ownerid as employment_ownerid
, employment.isdeleted as employment_is_deleted
, employment.name as employment_name
, employment.recordtypeid as employment_record_type_id
-- , employment.createddate as employment_createddate
-- , employment.createdbyid as employment_createdbyid
-- , employment.lastmodifieddate as employment_lastmodifieddate
-- , employment.lastmodifiedbyid as employment_lastmodifiedbyid
-- , employment.systemmodstamp as employment_systemmodstamp
-- , employment.aqb__assistant_s_email__c as employment_ssistant_s_email
-- , employment.aqb__assistant_s_name__c as employment_ssistant_s_name
-- , employment.aqb__assistant_s_phone__c as employment_ssistant_s_phone
, employment.aqb__businessphone__c as employment_business_phone
, employment.aqb__contactid__c as employment_contact_id
-- , employment.aqb__corporate_phone__c as employment_corporate_phone
, employment.aqb__donotarchive__c as employment_donotarchive
-- , employment.aqb__earnings__c as employment_earnings
, employment.aqb__employernamedisplay__c as employment_employer_name_display
-- , employment.aqb__employername__c as employment_employername
, employment.aqb__employmentcomment__c as employment_employment_comment
, employment.aqb__employmentexternalid__c as employment_employment_external_id
, employment.aqb__enddate__c as employment_end_date
, employment.aqb__ended__c as employment_ended
-- , employment.aqb__fax_number__c as employment_fax_number
-- , employment.aqb__industry__c as employment_industry
, employment.aqb__isprimaryemployer__c as employment_is_primary_employer
, employment.aqb__level__c as employment_level
-- , employment.aqb__linkedaddress__c as employment_linkedaddress
, employment.aqb__linkedemployer__c as employment_linked_employer
, employment.aqb__occupation__c as employment_occupation
-- , employment.aqb__ownerunit__c as employment_ownerunit
, employment.aqb__primaryemployment__c as employment_primary_employment
-- , employment.aqb__source__c as employment_source
, employment.aqb__startdate__c as employment_start_date
-- , employment.aqb__started__c as employment_started
, employment.aqb__status__c as employment_status
, employment.aqb__title__c as employment_title
-- , employment.aqcv_conversionid__c as employment_cv_conversionid
-- , employment.aqb__engagementscorecategory__c as employment_engagementscorecategory
-- , employment.aqb__engagementscoreoverride__c as employment_engagementscoreoverride
-- , employment.aqb__engagementscore__c as employment_engagementscore
-- , employment.matillion_batch_id as employment_matillion_batch_id
-- , employment.matillion_updated_timestamp as employment_matillion_updated_timestamp
--          , employment.source_name as employment_source_name
    from employment
    ),

final as (select -- select count(1) as cnt from trans
             employment_transform.*
             , owner.name as employment_owner_name
             , created_by.name as employment_creator_name
             , last_modified_by.name as employment_last_modified_by_name
        from employment_transform
             join owner on employment_transform.employment_owner_id = owner.user_id
             join created_by on employment_transform.employment_created_by_id = created_by.user_id
             join last_modified_by on employment_transform.employment_last_modified_by_id = last_modified_by.user_id
)

/*clean select*/
select * from final
