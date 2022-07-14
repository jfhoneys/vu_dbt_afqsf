with employment as (select * from {{ ref('stg_sfdc_aqb__aqb__employment__c')}}),
    owner as (select * from {{ref ('stg_sfdc_aqb__user')}}),
    created_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),
    last_modified_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),
    all_columns as (
    select employment.aqb__employment__c_id as emp_employment_id
         , employment.ownerid as emp_owner_id
         , owner.name as emp_owner_name
         , isdeleted as emp_is_deleted
         , employment.name as emp_name
         , employment.recordtypeid as emp_record_type_id
         , employment.createddate as emp_created_date
         , employment.createdbyid as emp_created_by_id
         , created_by.name as emp_created_by_name
         , employment.lastmodifieddate as emp_last_modified_date
         , employment.lastmodifiedbyid as emp_last_modified_id
         , last_modified_by.name as emp_last_modified_by_name
        --, employment.SYSTEMMODSTAMP
        --, employment.AQB__ASSISTANT_S_EMAIL__C
        --, employment.AQB__ASSISTANT_S_NAME__C
        --, employment.AQB__ASSISTANT_S_PHONE__C
         , employment.aqb__businessphone__c as emp_business_phone
         , employment.aqb__contactid__c as emp_contact_id
        --, employment.AQB__CORPORATE_PHONE__C
         , employment.aqb__donotarchive__c as emp_do_not_archive
        --, employment.AQB__EARNINGS__C
         , employment.aqb__employernamedisplay__c as emp_employer_name
        --, employment.AQB__EMPLOYERNAME__C
         , employment.aqb__employmentcomment__c as emp_comment
         , employment.aqb__employmentexternalid__c as emp_external_id
         , employment.aqb__startdate__c as emp_start_date
         , employment.aqb__enddate__c as emp_end_date
         , employment.aqb__ended__c as emp_ended
        --, employment.AQB__FAX_NUMBER__C
        --, employment.AQB__INDUSTRY__C
         , employment.aqb__isprimaryemployer__c as emp_is_primary_employer
         , employment.aqb__level__c as emp_level
        --, employment.AQB__LINKEDADDRESS__C
         , employment.aqb__linkedemployer__c as emp_linked_employer
         , employment.aqb__occupation__c as emp_occupation
        --, employment.AQB__OWNERUNIT__C
         , employment.aqb__primaryemployment__c as emp_primary_employment
        --, employment.AQB__SOURCE__C
        --, employment.AQB__STARTED__C
         , employment.aqb__status__c as emp_status
         , employment.aqb__title__c as emp_title
        --, employment.AQCV_CONVERSIONID__C
        --, employment.AQB__ENGAGEMENTSCORECATEGORY__C
        --, employment.AQB__ENGAGEMENTSCOREOVERRIDE__C
        --, employment.AQB__ENGAGEMENTSCORE__C
         , employment.matillion_batch_id as emp_matillion_batch_id
         , employment.matillion_updated_timestamp as emp_matillion_updated_timestamp
         , employment.source_name as emp_source_name
    from employment
             join owner on employment.ownerid = owner.user_id
             join created_by on employment.createdbyid = created_by.user_id
             join last_modified_by on employment.lastmodifiedbyid = last_modified_by.user_id
)

select
-- count(*) as cnt /*734184*/
all_columns.*
from all_columns

