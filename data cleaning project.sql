-- Data Cleaning

SELECT * 
FROM layoffs;

-- Remove Duplicates
-- Standardize the data
-- Null values or blank values
-- Remove any column

CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT *
FROM layoffs_staging;

INSERT INTO layoffs_staging
SELECT *
FROM layoffs;


WITH duplicates_CTEs as
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY company, location, industry,
total_laid_off, percentage_laid_off, 'date',
stage, industry, funds_raised_millions) as row_num
FROM layoffs_staging
) 
SELECT * 
FROM duplicates_CTEs
WHERE row_num > 1;

SELECT *
FROM layoffs_staging
WHERE company = 'oyster';


WITH duplicates_CTEs as
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY company, location, industry,
total_laid_off, percentage_laid_off, 'date',
stage, industry, funds_raised_millions) as row_num
FROM layoffs_staging
) 
DELETE 
FROM duplicates_CTEs
WHERE row_num > 1;





CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  row_num INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM layoffs_staging2;


INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(PARTITION BY company, location, industry,
total_laid_off, percentage_laid_off, 'date',
stage, industry, funds_raised_millions) as row_num
FROM layoffs_staging;


DELETE
FROM layoffs_staging2
WHERE row_num > 1;


-- standardising data
SELECT company, trim(company)
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company = trim(company);


SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY 1;

SELECT DISTINCT country, trim(trailing '.' from country)
FROM layoffs_staging2
ORDER BY 1;

UPDATE layoffs_staging2
SET country = trim(trailing '.' from country)
WHERE country LIKE 'united states%';

SELECT date,
str_to_date(date, '%m/%d/%Y')
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET date = str_to_date(date, '%m/%d/%Y');

SELECT date
FROM layoffs_staging2;


ALTER TABLE layoffs_staging2
MODIFY COLUMN date DATE;

-- Null values or blank values

SELECT *
FROM layoffs_staging2
WHERE total_laid_off is NULL
AND percentage_laid_off IS NULL;

SELECT *
FROM layoffs_staging2
WHERE industry IS NULL
OR industry = '';

SELECT *
FROM layoffs_staging2
WHERE company LIKE 'Airbnb';

-- Remove any column pr row

SELECT *
FROM layoffs_staging2
WHERE total_laid_off is NULL
AND percentage_laid_off IS NULL;

DELETE 
FROM layoffs_staging2
WHERE total_laid_off is NULL
AND percentage_laid_off IS NULL;

SELECT *
FROM layoffs_staging2;

ALTER TABLE layoffs_staging2
DROP COLUMN row_num;