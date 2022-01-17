-- NOTE: some 'before and after' queries to show performance of our full text search.
--       we will use the supabase_flutter package in this project to perform the Dart versions
--       of these queries but feel free to run these yourself in a SQL client, such as TablePlus

-- a slow, example query 
select * from names where fname ilike '%nick%' or lname ilike '%nick%';

-- with a 100k records, this take 1/5 of the time vs the first search query above
select * from names
where 
  fts @@ to_tsquery('nick:*');