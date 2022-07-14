with education as (select * from  {{ ref ('stg_sfdc_aqb__aqb__education__c')}} where not isdeleted),
owner as (select * from {{ref ('stg_sfdc_aqb__user')}}),
created_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),
last_modified_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),

edu_transform as (
    select education.aqb__education__c_id as edu_education_id
         , education.ownerid as edu_owner_id
--         , isdeleted
         , education.name as edu_name /*<<field identification need*/
         , education.recordtypeid as edu_record_type_id
         , education.createddate as edu_created_date
         , education.createdbyid as edu_created_by_id
         , education.lastmodifieddate as edu_last_modified_date
         , education.lastmodifiedbyid as edu_last_modified_by_id
--         , all_columns.systemmodstamp
--         , all_columns.lastvieweddate
--         , all_columns.lastreferenceddate
         , education.aqb__areasofstudy__c as edu_area_of_study
--    , aqb__campus__c
--    , aqb__certificationdescription__c
--    , aqb__certification__c
--    , aqb__conferringentity__c
         , education.aqb__contactid__c as edu_contact_id
         , education.aqb__dateissued__c as edu_degree_date
         , education.aqb__degreediploma__c as edu_degree_diploma
         , education.aqb__degreelevel__c as edu_degree_level
--         , aqb__department__c
--         , aqb__entryclassyear__c
--         , aqb__expirationdate__c
--         , aqb__firstyearofattendance__c
         , education.aqb__graduationyear__c as edu_graduation_year
         , education.aqb__graduation_month__c as edu_graduation_month
         , education.aqb__granting_school__c as edu_granting_school
         , education.aqb__honorarydegree__c as edu_honorary_degree
         , education.aqb__institution__c as edu_institution
--         , aqb__institutionalunit__c
         , education.aqb__isprimarydegree__c as edu_is_primary_degree
--         , aqb__lastyearofattendance__c
--         , aqb__ownerunit__c
         , education.aqb__preferredyear__c as edu_preferred_year
         , education.aqb__school__c as edu_school
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
         , education.matillion_batch_id as edu_matillion_batch_id
         , education.matillion_updated_timestamp as edu_matillion_updated_timestamp
         , education.source_name as edu_source_name
    from education
    ),

final as (select -- select count(1) as cnt from trans
             edu_transform.*
             , owner.name as edu_owner_name
             , created_by.name as edu_creator_name
             , last_modified_by.name as edu_last_modified_by_name
        from edu_transform
             join owner on edu_transform.edu_owner_id = owner.user_id
             join created_by on edu_transform.edu_created_by_id = created_by.user_id
             join last_modified_by on edu_transform.edu_last_modified_by_id = last_modified_by.user_id
)

/*clean select*/
select * from final
