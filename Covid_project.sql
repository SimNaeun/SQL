Select *
From PortfolioProject.dbo.CovidDeaths
Where continent is not null -- to exclude location that is continent(world, asia, africa...)
Order by 3, 4

--Select *
--From PortfolioProject..CovidVaccinations$
--Order by 3, 4

--Select data that we are going to use

Select Location, date, total_cases, new_cases, total_deaths, population
From PortfolioProject..CovidDeaths
Where continent is not null
Order by 1, 2

-- Looking at Total Cases vs Total Deaths
-- Shows likelihood od dying if you contract convid in your country
Select Location, date, total_cases, total_deaths, (CONVERT(float, total_deaths)/Nullif(convert(float, total_cases), 0))*100 as DeathPercentage
From PortfolioProject..CovidDeaths
Where Location like '%south korea%'
and continent is not null
Order by 1, 2

-- Looking at Total Cases vs Population
Select Location, date, population, total_cases, (total_cases/population)*100 as PercentagePopulationInfected
From PortfolioProject..CovidDeaths
Where location like '%south korea%'
Order by 1, 2

-- Looking at countries with highest infection rate compared to population
Select Location, population, max(total_cases) as highestinfectioncount, max(total_cases/population)*100 as PercentagePopulationInfected
From PortfolioProject..CovidDeaths
--Where location like '%south korea%'
Group by Location, Population
Order by PercentagePopulationInfected desc


-- Showing countries with highest death count per population
-- transfer data type of total_deaths from nvarchar to integer
Select Location,max(cast(total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
--Where location like '%south korea%'
Where continent is not null
Group by Location
Order by TotalDeathCount desc

--Break things down by continent
Select continent,max(cast(total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
--Where location like '%south korea%'
Where continent is not null
Group by continent
Order by TotalDeathCount desc

--The data upper looks like wrong bc North America just include Unites States and Canada
--This data looks more accurate
Select location, max(cast(total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
--Where location like '%south Korea%'
Where continent is null
Group by location
Order by TotalDeathCount desc

--Global Numbers
Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
--Where location like '%south Korea%'
Where continent is not null
--Group By date
Order by 1, 2

--Use CTE
With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
as
(
--Looking at Total Population vs Vaccinations
--bigint bc int cannot afford the range of new_vaccination values cos it's too large
Select d.continent, d.location, d.date, d.population, v.new_vaccinations
,SUM(convert(bigint, v.new_vaccinations)) over (partition by d.location 
Order by d.location, d.date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/Population)*100 
From PortfolioProject..CovidDeaths as d
JOIN PortfolioProject..CovidVaccinations as v
	ON d.location = v.location
	and d.date = v.date
Where d.continent is not null
--Order by 2, 3
)
Select *, (RollingPeopleVaccinated/Population)*100
From PopvsVac

--Use Temp Table
Drop Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date  datetime,
Population numeric,
New_Vaccinations numeric,
RollingPeopleVaccinated numeric
)

Insert into #PercentPopulationVaccinated
Select d.continent, d.location, d.date, d.population, v.new_vaccinations
,SUM(convert(bigint, v.new_vaccinations)) over (partition by d.location Order by d.location, d.date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/Population)*100 
From PortfolioProject..CovidDeaths as d
JOIN PortfolioProject..CovidVaccinations as v
	ON d.location = v.location
	and d.date = v.date
Where d.continent is not null
--Order by 2, 3

Select *, (RollingPeopleVaccinated/Population)*100 as PercentPopulationVaccinated
From #PercentPopulationVaccinated


--Creating View to store data for later visulization
Create View PercentPopulationVaccinated as
Select d.continent, d.location, d.date, d.population, v.new_vaccinations
,SUM(convert(bigint, v.new_vaccinations)) over (partition by d.location 
Order by d.location, d.date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/Population)*100 
From PortfolioProject..CovidDeaths as d
JOIN PortfolioProject..CovidVaccinations as v
	ON d.location = v.location
	and d.date = v.date
Where d.continent is not null
--Order by 2, 3

Select *
From PercentPopulationVaccinated