-- select website.url, company.registeredName
-- from website
-- inner join company
-- where website.companyID=company.companyID;

-- select website.url, websiteMedia.type
-- from website
-- inner join websiteMedia
-- where website.url=websiteMedia.url AND website.url='linkedin.com';

-- select pubDate from website
-- where url='tesla.com';

-- select countryOrigin from company
-- where registeredName='TESLA';

-- select webType from websiteClassified
-- where url='tesla.com';

-- select toolName from websiteTools
-- where url='tesla.com';

-- select language from tools
-- inner join websiteTools
-- where tools.toolName=websiteTools.toolName AND websiteTools.url='tesla.com';

-- select developer.firstName, developer.lastName from developer
-- inner join company
-- where company.companyID=developer.companyID AND company.registeredName='amazon';

-- select url from website
-- order by pubDate;

select registeredName, COUNT(*) as count from developer
inner join company
where company.companyID=developer.companyID
group by company.companyID
order by count asc;
