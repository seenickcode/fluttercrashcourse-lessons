-- create a table called 'names'
create table names (
  id serial primary key,
  fname text,
  lname text
);

-- the 'fts' column we add here stands for 'full text search'
-- source: https://supabase.com/docs/guides/database/full-text-search#search-using-the-new-column
alter table 
  names 
add column 
  fts tsvector generated always as (to_tsvector('english', fname || ' ' || lname)) stored;
  
create index name_fts on names using gin (fts); -- generate the index

-- NOTE: see 'supabase_query_examples.sql' to see how fast our search will be by setting up the index above

-- NOTE: we assume that you'll import the 'supabase_test_fixtures.csv' file via a SQL client
-- such as TablePlus, etc