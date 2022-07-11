with casecomment as ( select * from {{ source('sfdc_aqb','casecomment') }}
), 
final 
as ( select  
 trim(id) as casecomment_id
,trim(parentid) as parentid
,ispublished as ispublished
,trim(commentbody) as commentbody
,trim(createdbyid) as createdbyid
,createddate as createddate
,systemmodstamp as systemmodstamp
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,isdeleted as isdeleted
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from casecomment
) 
select * from final 
