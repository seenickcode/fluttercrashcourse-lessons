-- create our table, containing a list of names (effectively "users")
CREATE TABLE names (
  id serial primary key,
  fname text,
  lname text
);

-- add an additional column called 'fts' (full text search)
-- which will contain the values "<first name> <last name>", allowing
-- us to query against it using a special full text search query
-- you'll see in the next step
-- BONUS READ: https://supabase.com/docs/guides/database/full-text-search
ALTER TABLE
  names 
ADD COLUMN
  fts tsvector generated always as (to_tsvector('english', fname || ' ' || lname)) stored;
  
-- create an index so we can quickly query by our new column, 'fts'
CREATE INDEX name_fts ON names USING gin (fts);