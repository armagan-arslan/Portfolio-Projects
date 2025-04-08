-- Cleaning Data in SQL Queries
SELECT * FROM PortfolioProject.NashvilleHousing;

-- Standardize Date Format

update NashvilleHousing
set saledate = cast(saledate as date) where saledate is not null;

select saledate from NashvilleHousing;

-- Standardize SalePrice Format

select saleprice from NashvilleHousing;

select saleprice,replace(replace(saleprice, '$',''), ',','') from NashvilleHousing;

update NashvilleHousing
set saleprice=replace(replace(saleprice, '$',''), ',','');

alter table nashvillehousing change column saleprice saleprice int;

select * from nashvillehousing;

-- Changing Data Type as INT

alter table nashvillehousing change column acreage acreage int;
alter table nashvillehousing change column landvalue landvalue int;
alter table nashvillehousing change column buildingvalue buildingvalue int;
alter table nashvillehousing change column totalvalue totalvalue int;
alter table nashvillehousing change column yearbuilt yearbuilt int;
alter table nashvillehousing change column bedrooms bedrooms int;
alter table nashvillehousing change column fullbath fullbath int;
alter table nashvillehousing change column halfbath halfbath int;


-- Populate Property Address Data

select propertyaddress from NashvilleHousing where PropertyAddress ='';

update NashvilleHousing set propertyaddress = null where propertyaddress='';

select * from nashvillehousing where propertyaddress is null;

select * from nashvillehousing order by parcelid;

select a.parcelid, a.propertyaddress, b.parcelid, b.propertyaddress, ifnull(a.propertyaddress, b.propertyaddress)
from nashvillehousing a join nashvillehousing b 
on a.parcelid=b.parcelid and a.uniqueid<>b.uniqueid
where a.propertyaddress is null;

UPDATE nashvillehousing a
JOIN nashvillehousing b ON a.parcelid = b.parcelid AND a.uniqueid <> b.uniqueid
SET a.propertyaddress = IFNULL(a.propertyaddress, b.propertyaddress)
WHERE a.propertyaddress IS NULL;


-- Changing Empty Values as NULL

update NashvilleHousing set ownername = null where ownername='';
select * from nashvillehousing where ownername is null;
update NashvilleHousing set owneraddress = null where owneraddress='';
update NashvilleHousing set taxdistrict = null where taxdistrict='';
update NashvilleHousing set landvalue = null where landvalue='';
update NashvilleHousing set buildingvalue = null where buildingvalue='';
update NashvilleHousing set totalvalue = null where totalvalue='';
update NashvilleHousing set yearbuilt = null where yearbuilt='';
update NashvilleHousing set bedrooms = null where bedrooms='';
update NashvilleHousing set fullbath = null where fullbath='';
update NashvilleHousing set halfbath = null where halfbath='';
update NashvilleHousing set acreage = null where acreage='';

-- Breaking out Address into Individual Columns (Address, City, State)

select propertyaddress from nashvillehousing;

SELECT 
    SUBSTRING(propertyaddress, 1, LOCATE(',', propertyaddress) - 1) AS address,
    SUBSTRING(propertyaddress, LOCATE(',', propertyaddress) + 1) AS address2
FROM nashvillehousing;

alter table NashvilleHousing
add propertysplitaddress nvarchar(255);
update nashvillehousing
set propertysplitaddress = SUBSTRING(propertyaddress, 1, LOCATE(',', propertyaddress) - 1);
    
alter table NashvilleHousing
add propertysplitcity nvarchar(255);
update nashvillehousing
set propertysplitcity = SUBSTRING(propertyaddress, LOCATE(',', propertyaddress) + 1);

select * from nashvillehousing;



select owneraddress from nashvillehousing;

SELECT 
    SUBSTRING_INDEX(SUBSTRING_INDEX(owneraddress, ',', 1), ',', -1) AS part1,
    SUBSTRING_INDEX(SUBSTRING_INDEX(owneraddress, ',', 2), ',', -1) AS part2,
    SUBSTRING_INDEX(SUBSTRING_INDEX(owneraddress, ',', 3), ',', -1) AS part3
FROM nashvillehousing;

alter table NashvilleHousing
add ownersplitaddress nvarchar(255);
update nashvillehousing
set ownersplitaddress = SUBSTRING_INDEX(SUBSTRING_INDEX(owneraddress, ',', 1), ',', -1);
alter table NashvilleHousing
add ownersplitcity nvarchar(255);
update nashvillehousing
set ownersplitcity = SUBSTRING_INDEX(SUBSTRING_INDEX(owneraddress, ',', 2), ',', -1);
alter table NashvilleHousing
add ownersplitstate nvarchar(255);
update nashvillehousing
set ownersplitstate = SUBSTRING_INDEX(SUBSTRING_INDEX(owneraddress, ',', 3), ',', -1);

select * from nashvillehousing;

-- change Y and N to Yes and no to in "SoldAsVacant" Field

select distinct(soldasvacant), count(soldasvacant)
from NashvilleHousing group by SoldAsVacant order by 2;

select soldasvacant,
case when soldasvacant='Y' then 'Yes'
	when soldasvacant='N' then 'No'
    else soldasvacant
    end
    from NashvilleHousing;
    
update nashvillehousing
set soldasvacant=case when soldasvacant='Y' then 'Yes'
	when soldasvacant='N' then 'No'
    else soldasvacant
    end;
    

-- Remove Duplicates

with RowNumCTE as(
select *, 
	row_number() over(
    partition by parcelid,
				propertyaddress,
                saleprice,
                saledate,
                legalreference
                order by
                uniqueid
                ) row_num
from NashvilleHousing)

select * from RowNumCTE where row_num > 1 order by propertyaddress;

DELETE a
FROM NashvilleHousing a
JOIN (
    SELECT uniqueid
    FROM (
        SELECT uniqueid,
               ROW_NUMBER() OVER (PARTITION BY parcelid, propertyaddress, saleprice, saledate, legalreference ORDER BY uniqueid) AS row_num
        FROM NashvilleHousing
    ) AS RowNumCTE
    WHERE row_num > 1
) AS b
ON a.uniqueid = b.uniqueid;

-- Delete Unused Columns

select * from NashvilleHousing;

alter table NashvilleHousing
drop column OwnerAddress, 
drop column propertyaddress, 
drop column taxdistrict;


