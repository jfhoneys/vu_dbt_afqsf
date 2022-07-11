with recordtype as ( select * from {{ source('sfdc_aqb','recordtype') }}
), 
final 
as ( select  
 trim(id) as recordtype_id
,trim(name) as name
,trim(developername) as developername
,trim(namespaceprefix) as namespaceprefix
,trim(description) as description
,trim(businessprocessid) as businessprocessid
,trim(sobjecttype) as sobjecttype
,isactive as isactive
,trim(createdbyid) as createdbyid
,createddate as createddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,lastmodifieddate as lastmodifieddate
,systemmodstamp as systemmodstamp
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from recordtype
) 
select * from final 
