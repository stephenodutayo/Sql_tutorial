-- Exploratory Data Analysis

SELECT * 
FROM layoffs_staging2;

SELECT max(total_laid_off), max(percentage_laid_off)
FROM layoffs_staging2;

SELECT * 
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;

SELECT company, sum(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

SELECT industry, sum(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

SELECT country, sum(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;

SELECT year(date), sum(total_laid_off)
FROM layoffs_staging2
GROUP BY year(date)
ORDER BY 2 DESC;

SELECT stage, sum(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;

SELECT *
FROM layoffs_staging2;

SELECT substring(date, 1, 7) as month,
sum(total_laid_off)
FROM layoffs_staging2
GROUP BY month
ORDER BY 1;

WITH rolling_total as
(
SELECT substring(date, 1, 7) as month,
sum(total_laid_off) as dismissed_staff
FROM layoffs_staging2
GROUP BY month
ORDER BY 1
)
SELECT month, dismissed_staff,
sum(dismissed_staff) OVER(ORDER BY month) as rolling_total
FROM rolling_total;


SELECT company, year(date), sum(total_laid_off)
FROM layoffs_staging2
GROUP BY company, year(date)
ORDER BY 3 DESC;

WITH company_year(company, year, total_laid_off) as
(
SELECT company, year(date), sum(total_laid_off)
FROM layoffs_staging2
GROUP BY company, year(date)
), company_year_rank as
(
SELECT *,
DENSE_RANK() OVER(PARTITION BY year ORDER BY total_laid_off DESC) as ranking
FROM company_year
)
SELECT *
FROM company_year_rank
WHERE ranking <= 5;











