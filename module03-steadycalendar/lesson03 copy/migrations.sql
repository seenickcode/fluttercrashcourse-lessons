-- calendars table
CREATE TABLE calendars (
  id bigint GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  user_id uuid references auth.users NOT NULL,
  name text,
  color text,
  background_slug text,
  updated_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- calendars table row level security
ALTER TABLE calendars ENABLE ROW LEVEL SECURITY;
CREATE POLICY user_access_own_calendars ON calendars
    FOR ALL
    USING (auth.uid() = user_id);

-- calendars table updated_at trigger
CREATE OR REPLACE FUNCTION update_updated_at_timestamp()
RETURNS TRIGGER AS $$
BEGIN
   NEW.updated_at = now(); 
   RETURN NEW;
END;
$$ language 'plpgsql';
CREATE TRIGGER update_calendars_updated_at_timestamp 
  BEFORE UPDATE ON calendars 
  FOR EACH ROW 
  EXECUTE PROCEDURE update_updated_at_timestamp();

-- calendar_dates table
CREATE TABLE calendar_dates (
  id bigint GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  user_id uuid references auth.users NOT NULL,
  calendar_id bigint references calendars (id) ON DELETE CASCADE,
  date date NOT NULL
);

-- calendar_dates table row level security
ALTER TABLE calendar_dates ENABLE ROW LEVEL SECURITY;
CREATE POLICY user_access_own_calendar_dates ON calendar_dates
    FOR ALL
    USING (auth.uid() = user_id);

-- calendar_dates indices
CREATE UNIQUE INDEX calendar_dates_calendar_id_date ON calendar_dates (calendar_id, date);