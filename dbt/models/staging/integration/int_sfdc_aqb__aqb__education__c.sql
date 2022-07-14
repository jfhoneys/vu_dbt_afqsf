with all_columns as ( /*base data set*/
    select *
--   count(*) /*record count 416026*/
    from  {{ ref ('stg_sfdc_aqb__aqb__education__c')}}
    where not isdeleted
)
   , owner as ( /*record owner user info*/
    select user_id as owner_userid
         , username as owner_username
         , lastname as owner_last_name
         , firstname as owner_first_name
         , name as owner_name
         , division as owner_division
         , department as owner_department
         , title as owner_title
         , userroleid as owner_roleid
         , usertype as _owner_user_type
    from {{ref ('stg_sfdc_aqb__user')}}
    
)
   , created_by as ( /*record creator user info*/
    select user_id as creator_userid
         , username as creator_username
         , lastname as creator_last_name
         , firstname as creator_first_name
         , name as creator_name
         , division as creator_division
         , department as creator_department
         , title as creator_title
         , userroleid as creator_roleid
         , usertype as _creator_user_type
    from {{ref ('stg_sfdc_aqb__user')}}
  
)
   , last_update_by as ( /*record last touched user info*/
    select user_id as lastupd_userid
         , username as lastupd_username
         , lastname as lastupd_last_name
         , firstname as lastupd_first_name
         , name as lastupd_name
         , division as lastupd_division
         , department as lastupd_department
         , title as lastupd_title
         , userroleid as lastupd_roleid
         , usertype as _lastupd_user_type
    from {{ref ('stg_sfdc_aqb__user')}}

)
   , edu as (
    select all_columns.aqb__education__c_id as education_key
         , owner.owner_userid
--         , isdeleted
         , owner.owner_name
         , "NAME" /*<<field identification need*/
         , recordtypeid
         , createddate
         , created_by.creator_userid
         , created_by.creator_name
         , all_columns.lastmodifieddate last_modified_date
         , last_update_by.lastupd_userid
         , last_update_by.lastupd_name
--         , all_columns.systemmodstamp
--         , all_columns.lastvieweddate
--         , all_columns.lastreferenceddate
         , aqb__areasofstudy__c as area_of_study
--    , aqb__campus__c
--    , aqb__certificationdescription__c
--    , aqb__certification__c
--    , aqb__conferringentity__c
         , aqb__contactid__c as contact_id_fk
         , aqb__dateissued__c as degree_date
         , aqb__degreediploma__c as degree_diploma
         , aqb__degreelevel__c as degree_level
--         , aqb__department__c
--         , aqb__entryclassyear__c
--         , aqb__expirationdate__c
--         , aqb__firstyearofattendance__c
         , aqb__graduationyear__c as graduation_year
         , aqb__graduation_month__c as graduation_month
         , aqb__granting_school__c as granting_school
         , aqb__honorarydegree__c as honerary_degree
         , aqb__institution__c as institution
--         , aqb__institutionalunit__c
         , aqb__isprimarydegree__c as is_primary_degree
--         , aqb__lastyearofattendance__c
--         , aqb__ownerunit__c
         , aqb__preferredyear__c as preferred_year
         , aqb__school__c as school
--         , aqb__source__c
--         , aqb__specialty__c
--         , aqb__status__c
--         , aqb__subspecialtycategory__c
--         , aqb__subspecialty__c
--         , aqb__type__c
--         , aqb__studentstatus__c
--         , aqcv_conversionid__c
--         , vu_gold_start_year__c
--         , vu_gold_end_year__c
         , matillion_batch_id
         , matillion_updated_timestamp
         , source_name
    from all_columns
             join owner on all_columns.ownerid = owner.owner_userid
             join created_by on all_columns.ownerid = created_by.creator_userid
             join last_update_by on all_columns.ownerid = last_update_by.lastupd_userid
)

/*clean select*/
select *
from edu
