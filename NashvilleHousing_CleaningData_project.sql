/*
Cleaning Data in SQL Queries
*/

Select *
From PortfolioProject..NashvilleHousing

-------------------------------------------------------------
--Standardize Data Format

Select SaleDateConverted, CONVERT(Date, SaleDate)
From PortfolioProject..NashvilleHousing

Update NashvilleHousing
SET SaleDate = CONVERT(Date, SaleDate)

ALTER TABLE NashvilleHousing
Add SaleDateConverted Date; 

Update NashvilleHousing
SET SaleDateConverted = CONVERT(Date, SaleDate)

---------------------------------------------------------
-- Populate(Ã¤¿ì´Ù) Property Address data
--PropertyAddress doesn't change 
--ParcelID==PropertyAddress so populate propertyaddress based on parcelID
Select *
From PortfolioProject..NashvilleHousing
--Where PropertyAddress is null
--Order By ParcelID

--join two tables when parcelID is same but uniqueid is different
-- so that same propertyaddresses are put in a row
--ISNULL(NullRow, Row used for populating)
Select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
From PortfolioProject..NashvilleHousing a
JOIN PortfolioProject..NashvilleHousing b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID] <> b.[UniqueID]
Where a.PropertyAddress is null

Update a --Alias should be written
SET a.PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
From PortfolioProject..NashvilleHousing a
JOIN PortfolioProject..NashvilleHousing b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID] <> b.[UniqueID]
Where a.PropertyAddress is null

-----------------------------------------------------

--Breaking out Address into individual  columns( Address, City, State)
Select PropertyAddress
From PortfolioProject..NashvilleHousing
--Where PropertyAddress is null
--Order By ParcelID


--start from first value in propertyaddress and go until before comma
--start from value next to comma and go until last value of propertyaddress
--Charindex shows the index of the comma
SELECT 
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 ) as Address
, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1 , LEN(PropertyAddress)) as Address
From PortfolioProject..NashvilleHousing

ALTER TABLE NashvilleHousing
Add PropertySplitAddress Nvarchar(255);

Update NashvilleHousing
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 )

ALTER TABLE NashvilleHousing
Add PropertySplitCity Nvarchar(255); 

Update NashvilleHousing
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1 , LEN(PropertyAddress))

Select *
From PortfolioProject..NashvilleHousing

--simple but difficult way to split propertyaddress
--Parsename split sth backwards based on a period
Select
PARSENAME(Replace(OwnerAddress, ',', '.'), 3) --Address
,PARSENAME(Replace(OwnerAddress, ',', '.'), 2) --City
,PARSENAME(Replace(OwnerAddress, ',', '.'), 1) --State
From PortfolioProject..NashvilleHousing


ALTER TABLE NashvilleHousing
Add OwnerSplitAddress Nvarchar(255);

Update NashvilleHousing
SET OwnerSplitAddress = PARSENAME(Replace(OwnerAddress, ',', '.'), 3)

ALTER TABLE NashvilleHousing
Add OwnerSplitCity Nvarchar(255); 

Update NashvilleHousing
SET OwnerSplitCity = PARSENAME(Replace(OwnerAddress, ',', '.'), 2)

ALTER TABLE NashvilleHousing
Add OwnerSplitState Nvarchar(255);

Update NashvilleHousing
SET OwnerSplitState = PARSENAME(Replace(OwnerAddress, ',', '.'), 1)

Select *
From PortfolioProject..NashvilleHousing

--------------------------------------------------------------------

-- Change Y and N to Yes and No in "Sold as Vacant' field

-- Find unique value(Y, Yes, N, No) in SoldAsVacant column and aggregate 
Select Distinct(SoldAsVacant), Count(SoldAsVacant)
From PortfolioProject..NashvilleHousing
Group By SoldAsVacant
Order By 2

-- create new column and insert values
-- if value in the column is N, No
-- if it is Y, Yes
-- if it is Yes or No, just leave it 
Select SoldAsVacant
, CASE When SoldAsVacant = 'Y' THEN 'YES'
	   When SoldAsVacant = 'N' THEN 'NO'
	   ELSE SoldAsVacant
	   END
From PortfolioProject..NashvilleHousing

Update NashvilleHousing
SET SoldAsVacant = CASE When SoldAsVacant = 'Y' THEN 'YES'
						When SoldAsVacant = 'N' THEN 'NO'
						ELSE SoldAsVacant
						END

------------------------------------------------------------
--Remove Duplicates

--Create a CTE that assigns the row numbers of each row partitioned by ... (row number of most data is 1 but there are some 2 duplicates so their row number is 1 and 2)
--ROW_NUMBER() assigns row numbers to each row
--each rows onyl have two duplicates, not more than 3
WITH RowNumCTE AS(
Select *,
	ROW_NUMBER() OVER (
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 Order By 
					UniqueID
					) row_num
From PortfolioProject.dbo.NashvilleHousing
--Order By ParcelID
)

SELECT *
From RowNumCTE

--DELECT Duplicates

SELECT *
From RowNumCTE
Where row_num > 1
Order By PropertyAddress

DELETE
From RowNumCTE
Where row_num > 1


----------------------------------------------------------------
-- Delete Unused Columns

ALERT TABLE PortfolioProject.dbo.NashvilleHousing
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress, SaleDate

SELECT *
From PortfolioProject.dbo.NashvilleHousing
