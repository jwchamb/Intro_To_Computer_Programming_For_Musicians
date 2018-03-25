
-- REVOKE will throw an error if the schema has been deleted

REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA final_project FROM final_app;
REVOKE USAGE ON SCHEMA final_project FROM final_app;
REVOKE ALL PRIVILEGES ON DATABASE joel FROM final_app;
DROP USER IF EXISTS final_app;

CREATE USER final_app PASSWORD 'final_app';
GRANT CONNECT ON DATABASE joel TO final_app;
GRANT USAGE ON SCHEMA final_project TO final_app;
GRANT SELECT ON ALL TABLES IN SCHEMA final_project TO final_app;
