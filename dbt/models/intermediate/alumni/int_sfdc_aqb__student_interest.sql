with student_interest as (select * from {{ ref ('stg_sfdc_aqb__aqb__studentinterest__c')}} ), 
owner as (select * from {{ref ('stg_sfdc_aqb__user')}}),
created_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),
last_modified_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),

student_interest_transform as
(select
    student_interest.aqb__studentinterest__c_id as student_interest_id
    , student_interest.name as student_interest_name
    , student_interest.aqb__contact__c as student_interest_contact_id 
    , student_interest.aqb__educationid__c student_interest_education_id
    , student_interest.aqb__educationalinstitution__c as student_interest_educational_institution
    , student_interest.aqb__interestgroup__c as student_interest_interest_group
    , student_interest.aqb__interesttype__c as student_interest_interest_type
    , student_interest.aqb__ownerunit__c as student_interest_owner_unit
    , student_interest.aqb__position__c as student_interest_position
    , student_interest.aqb__source__c as student_interest_source
    , student_interest.aqb__startday__c as student_interest_start_day
    , student_interest.aqb__startmonth__c as student_interest_start_month
    , student_interest.aqb__startyear__c as student_interest_start_year
    , student_interest.aqb__stopday__c as student_interest_stop_day
    , student_interest.aqb__stopmonth__c as student_interest_stop_month
    , student_interest.aqb__stopyear__c as student_interest_stop_year
    , student_interest.aqcv_conversionid__c as student_interest_aqcv_conversion_id
    , student_interest.ownerid as student_interest_owner_id 
    , student_interest.isdeleted as student_interest_is_deleted
    , student_interest.createddate as student_interest_created_date
    , student_interest.createdbyid as student_interest_created_by_id
    , student_interest.lastmodifieddate as student_interest_last_modified_date
    , student_interest.lastmodifiedbyid as student_interest_last_modified_by_id
    , student_interest.systemmodstamp as student_interest_system_modstamp
    , student_interest.matillion_batch_id as student_interest_matillion_batch_id
    , student_interest.matillion_updated_timestamp as student_interest_matillion_updated_timestamp
    , student_interest.source_name student_interest_source_name
from
     student_interest ),
final as (select 
             student_interest_transform.*
             , owner.name as student_interest_owner_name
             , created_by.name as student_interest_creator_name
             , last_modified_by.name as student_interest_last_modified_by_name
        from student_interest_transform
             inner join owner on student_interest_transform.student_interest_owner_id = owner.user_id
             inner join created_by on student_interest_transform.student_interest_created_by_id = created_by.user_id
             inner join last_modified_by on student_interest_transform.student_interest_last_modified_by_id = last_modified_by.user_id
)
select * from final      