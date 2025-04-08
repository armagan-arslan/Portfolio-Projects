select * from coviddeaths order by 3,4;
select * from covidvaccinations order by 3,4;

-- changing the date format
SELECT `date`
FROM `PortfolioProject`.`CovidDeaths`
WHERE STR_TO_DATE(`date`, '%d/%m/%Y') IS NULL;

UPDATE `PortfolioProject`.`CovidDeaths`
SET `date` = STR_TO_DATE(`date`, '%d/%m/%Y')
WHERE STR_TO_DATE(`date`, '%d/%m/%Y') IS NOT NULL;

SELECT `date`
FROM `PortfolioProject`.`CovidDeaths`
WHERE `date` IS NULL OR `date` = '';

ALTER TABLE `PortfolioProject`.`CovidDeaths`
CHANGE COLUMN `date` `date` DATETIME NULL DEFAULT NULL;

SELECT `date`
FROM `PortfolioProject`.`covidvaccinations`
WHERE STR_TO_DATE(`date`, '%d/%m/%Y') IS NULL;

UPDATE `PortfolioProject`.`covidvaccinations`
SET `date` = STR_TO_DATE(`date`, '%d/%m/%Y')
WHERE STR_TO_DATE(`date`, '%d/%m/%Y') IS NOT NULL;

SELECT `date`
FROM `PortfolioProject`.`covidvaccinations`
WHERE `date` IS NULL OR `date` = '';

ALTER TABLE `PortfolioProject`.`covidvaccinations`
CHANGE COLUMN `date` `date` DATETIME NULL DEFAULT NULL;

-- changing empty values as NULL
UPDATE CovidDeaths
SET continent = NULL
WHERE continent = '' OR continent IS NULL;

UPDATE CovidDeaths
SET total_cases = NULL
WHERE total_cases = '' OR total_cases IS NULL;

UPDATE CovidDeaths
SET new_cases = NULL
WHERE new_cases = '' OR new_cases IS NULL;

UPDATE CovidDeaths
SET new_cases_smoothed = NULL
WHERE new_cases_smoothed = '' OR new_cases_smoothed IS NULL;

UPDATE CovidDeaths
SET total_deaths = NULL
WHERE total_deaths = '' OR total_deaths IS NULL;

UPDATE CovidDeaths
SET new_deaths = NULL
WHERE new_deaths = '' OR new_deaths IS NULL;

UPDATE CovidDeaths
SET new_deaths_smoothed = NULL
WHERE new_deaths_smoothed = '' OR new_deaths_smoothed IS NULL;

UPDATE CovidDeaths
SET total_cases_per_million = NULL
WHERE total_cases_per_million = '' OR total_cases_per_million IS NULL;

UPDATE CovidDeaths
SET new_cases_per_million = NULL
WHERE new_cases_per_million = '' OR new_cases_per_million IS NULL;

UPDATE CovidDeaths
SET new_cases_smoothed_per_million = NULL
WHERE new_cases_smoothed_per_million = '' OR new_cases_smoothed_per_million IS NULL;

UPDATE CovidDeaths
SET total_deaths_per_million = NULL
WHERE total_deaths_per_million = '' OR total_deaths_per_million IS NULL;

UPDATE CovidDeaths
SET new_deaths_per_million = NULL
WHERE new_deaths_per_million = '' OR new_deaths_per_million IS NULL;

UPDATE CovidDeaths
SET new_deaths_smoothed_per_million = NULL
WHERE new_deaths_smoothed_per_million = '' OR new_deaths_smoothed_per_million IS NULL;

UPDATE CovidDeaths
SET reproduction_rate = NULL
WHERE reproduction_rate = '' OR reproduction_rate IS NULL;

UPDATE CovidDeaths
SET icu_patients = NULL
WHERE icu_patients = '' OR icu_patients IS NULL;

UPDATE CovidDeaths
SET icu_patients_per_million = NULL
WHERE icu_patients_per_million = '' OR icu_patients_per_million IS NULL;

UPDATE CovidDeaths
SET hosp_patients = NULL
WHERE hosp_patients = '' OR hosp_patients IS NULL;

UPDATE CovidDeaths
SET hosp_patients_per_million = NULL
WHERE hosp_patients_per_million = '' OR hosp_patients_per_million IS NULL;

UPDATE CovidDeaths
SET weekly_icu_admissions = NULL
WHERE weekly_icu_admissions = '' OR weekly_icu_admissions IS NULL;

UPDATE CovidDeaths
SET weekly_icu_admissions_per_million = NULL
WHERE weekly_icu_admissions_per_million = '' OR weekly_icu_admissions_per_million IS NULL;

UPDATE CovidDeaths
SET weekly_hosp_admissions = NULL
WHERE weekly_hosp_admissions = '' OR weekly_hosp_admissions IS NULL;

UPDATE CovidDeaths
SET weekly_hosp_admissions_per_million = NULL
WHERE weekly_hosp_admissions_per_million = '' OR weekly_hosp_admissions_per_million IS NULL;

UPDATE covidvaccinations
SET continent = NULL
WHERE continent = '' OR continent IS NULL;

UPDATE covidvaccinations
SET new_tests = NULL
WHERE new_tests = '' OR new_tests IS NULL;

UPDATE covidvaccinations
SET total_tests = NULL
WHERE total_tests = '' OR total_tests IS NULL;

UPDATE covidvaccinations
SET total_tests_per_thousand = NULL
WHERE total_tests_per_thousand = '' OR total_tests_per_thousand IS NULL;

UPDATE covidvaccinations
SET new_tests_per_thousand = NULL
WHERE new_tests_per_thousand = '' OR new_tests_per_thousand IS NULL;

UPDATE covidvaccinations
SET new_tests_smoothed = NULL
WHERE new_tests_smoothed = '' OR new_tests_smoothed IS NULL;

UPDATE covidvaccinations
SET new_tests_smoothed_per_thousand = NULL
WHERE new_tests_smoothed_per_thousand = '' OR new_tests_smoothed_per_thousand IS NULL;

UPDATE covidvaccinations
SET positive_rate = NULL
WHERE positive_rate = '' OR positive_rate IS NULL;

UPDATE covidvaccinations
SET tests_per_case = NULL
WHERE tests_per_case = '' OR tests_per_case IS NULL;

UPDATE covidvaccinations
SET tests_units = NULL
WHERE tests_units = '' OR tests_units IS NULL;

UPDATE covidvaccinations
SET total_vaccinations = NULL
WHERE total_vaccinations = '' OR total_vaccinations IS NULL;

UPDATE covidvaccinations
SET people_vaccinated = NULL
WHERE people_vaccinated = '' OR people_vaccinated IS NULL;

UPDATE covidvaccinations
SET people_fully_vaccinated = NULL
WHERE people_fully_vaccinated = '' OR people_fully_vaccinated IS NULL;

UPDATE covidvaccinations
SET new_vaccinations= NULL
WHERE new_vaccinations = '' OR new_vaccinations IS NULL;

UPDATE covidvaccinations
SET new_vaccinations_smoothed= NULL
WHERE new_vaccinations_smoothed = '' OR new_vaccinations_smoothed IS NULL;

UPDATE covidvaccinations
SET total_vaccinations_per_hundred= NULL
WHERE total_vaccinations_per_hundred = '' OR total_vaccinations_per_hundred IS NULL;

UPDATE covidvaccinations
SET people_vaccinated_per_hundred= NULL
WHERE people_vaccinated_per_hundred = '' OR people_vaccinated_per_hundred IS NULL;

UPDATE covidvaccinations
SET people_fully_vaccinated_per_hundred= NULL
WHERE people_fully_vaccinated_per_hundred = '' OR people_fully_vaccinated_per_hundred IS NULL;

UPDATE covidvaccinations
SET new_vaccinations_smoothed_per_million= NULL
WHERE new_vaccinations_smoothed_per_million = '' OR new_vaccinations_smoothed_per_million IS NULL;

UPDATE covidvaccinations
SET female_smokers= NULL
WHERE female_smokers = '' OR female_smokers IS NULL;

UPDATE covidvaccinations
SET male_smokers= NULL
WHERE male_smokers = '' OR male_smokers IS NULL;

UPDATE covidvaccinations
SET extreme_poverty= NULL
WHERE extreme_poverty = '' OR extreme_poverty IS NULL;

-- select data we are going to use
select location, date, total_cases, new_cases, total_deaths, population from CovidDeaths where continent is not null order by 1,2;

-- looking at total cases vs total deaths
-- shows likelihood of dying if you contract covid in United States
select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as PercentPopulationInfected
from CovidDeaths where location like '%states%' and continent is not null order by 1,2;


-- looking at total cases vs total deaths
-- shows what percentage of population got Covid
select location, date, population, total_cases, (total_cases/population)*100 as CasePercentage
from CovidDeaths where location like '%states%' and continent is not null order by 1,2;

-- looking at Countries with Highest Infection Rate compared to Population
select location, population, max(total_cases) as HighestInfection, max((total_cases/population))*100 as PercentPopulationInfected
from CovidDeaths where continent is not null group by location, population order by 4 desc;

-- Showing Countries with Highest Death Count per Population
select location, max(cast(total_deaths as signed)) as MaxDeathCount from CovidDeaths
where continent is not null group by location order by MaxDeathCount desc;

-- Breaking into by continent
select continent, max(cast(total_deaths as signed)) as MaxDeathCount from CovidDeaths
where continent is not null group by continent order by MaxDeathCount desc;

-- GLOBAL NUMBERS
select date, sum(new_cases) as total_cases, sum(new_deaths) as total_deaths, sum(new_deaths)/sum(new_cases)*100 as DeathPercentage 
from CovidDeaths
where continent is not null
group by date
order by 1,2;


-- looking at the total population vs vaccinations
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, sum(vac.new_vaccinations) over (partition by dea.location order by dea.location, dea.date) as RollingPplVaccinated
from covidvaccinations vac
join CovidDeaths dea 
on vac.location=dea.location
and dea.date=vac.date
where dea.continent is not null
order by 2,3;

-- USE CTE
with popvsvac (continent, location, date, population, new_vaccinations, RollingPplVaccinated)
as
(
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, sum(vac.new_vaccinations) over (partition by dea.location order by dea.location, dea.date) as RollingPplVaccinated
from covidvaccinations vac
join CovidDeaths dea 
on vac.location=dea.location
and dea.date=vac.date
where dea.continent is not null
order by 2,3)
select *, (RollingPplVaccinated/population)*100
from popvsvac;


-- Using Temp Table to perform Calculation on Partition By in previous query
DROP TEMPORARY TABLE IF EXISTS PercentPopulationVaccinated;

CREATE TEMPORARY TABLE PercentPopulationVaccinated (
    Continent VARCHAR(255),
    Location VARCHAR(255),
    Date DATETIME,
    Population DECIMAL(15, 2),
    New_vaccinations INT,
    RollingPeopleVaccinated INT
);

INSERT INTO PercentPopulationVaccinated
SELECT
    dea.continent,
    dea.location,
    dea.date,
    dea.population,
    vac.new_vaccinations,
    SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.date) AS RollingPeopleVaccinated
FROM PortfolioProject.CovidDeaths dea
JOIN PortfolioProject.CovidVaccinations vac
    ON dea.location = vac.location
    AND dea.date = vac.date;

SELECT *, 
       (RollingPeopleVaccinated / Population) * 100 AS PercentVaccinated
FROM PercentPopulationVaccinated;

-- Creating View to store data for later visualizations
create view PercentPopulationVaccinated as
SELECT
    dea.continent,
    dea.location,
    dea.date,
    dea.population,
    vac.new_vaccinations,
    SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.date) AS RollingPeopleVaccinated
FROM PortfolioProject.CovidDeaths dea
JOIN PortfolioProject.CovidVaccinations vac
    ON dea.location = vac.location
    AND dea.date = vac.date;
SELECT * FROM PortfolioProject.percentpopulationvaccinated;	


