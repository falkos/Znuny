-- ----------------------------------------------------------
--  driver: ingres, generated: 2011-02-21 14:12:53
-- ----------------------------------------------------------
-- ----------------------------------------------------------
--  alter table ticket_index
-- ----------------------------------------------------------
ALTER TABLE ticket_index ALTER COLUMN queue VARCHAR(200);\g
-- ----------------------------------------------------------
--  alter table ticket_index
-- ----------------------------------------------------------
ALTER TABLE ticket_index ALTER COLUMN s_state VARCHAR(200);\g
-- ----------------------------------------------------------
--  alter table ticket_index
-- ----------------------------------------------------------
ALTER TABLE ticket_index ALTER COLUMN s_lock VARCHAR(200);\g
CREATE SEQUENCE gi_webservice_config_175;\g
CREATE TABLE gi_webservice_config (
    id INTEGER NOT NULL DEFAULT gi_webservice_config_175.NEXTVAL,
    name VARCHAR(200) NOT NULL,
    config LONG BYTE NOT NULL,
    config_md5 VARCHAR(32) NOT NULL,
    valid_id SMALLINT NOT NULL,
    create_time TIMESTAMP NOT NULL,
    create_by INTEGER NOT NULL,
    change_time TIMESTAMP NOT NULL,
    change_by INTEGER NOT NULL,
    UNIQUE (name)
);\g
MODIFY gi_webservice_config TO btree unique ON id WITH unique_scope = statement;\g
ALTER TABLE gi_webservice_config ADD PRIMARY KEY ( id ) WITH index = base table structure;\g
CREATE SEQUENCE gi_webservice_config_history_678;\g
CREATE TABLE gi_webservice_config_history (
    id BIGINT NOT NULL DEFAULT gi_webservice_config_history_678.NEXTVAL,
    config_id INTEGER NOT NULL,
    config LONG BYTE NOT NULL,
    config_md5 VARCHAR(32) NOT NULL,
    create_time TIMESTAMP NOT NULL,
    create_by INTEGER NOT NULL,
    change_time TIMESTAMP NOT NULL,
    change_by INTEGER NOT NULL
);\g
MODIFY gi_webservice_config_history TO btree unique ON id WITH unique_scope = statement;\g
ALTER TABLE gi_webservice_config_history ADD PRIMARY KEY ( id ) WITH index = base table structure;\g
CREATE SEQUENCE scheduler_task_list_257;\g
CREATE TABLE scheduler_task_list (
    id BIGINT NOT NULL DEFAULT scheduler_task_list_257.NEXTVAL,
    task_data VARCHAR(8000) NOT NULL,
    task_data_md5 VARCHAR(32) NOT NULL,
    task_type VARCHAR(200) NOT NULL,
    create_time TIMESTAMP NOT NULL
);\g
MODIFY scheduler_task_list TO btree unique ON id WITH unique_scope = statement;\g
ALTER TABLE scheduler_task_list ADD PRIMARY KEY ( id ) WITH index = base table structure;\g
CREATE SEQUENCE gi_debugger_entry_620;\g
-- ----------------------------------------------------------
--  create table gi_debugger_entry
-- ----------------------------------------------------------
CREATE TABLE gi_debugger_entry (
    id BIGINT NOT NULL DEFAULT gi_debugger_entry_620.NEXTVAL,
    communication_id VARCHAR(32) NOT NULL,
    communication_type VARCHAR(50) NOT NULL,
    remote_ip VARCHAR(50),
    webservice_id INTEGER NOT NULL,
    create_time TIMESTAMP NOT NULL,
    UNIQUE (communication_id)
);\g
MODIFY gi_debugger_entry TO btree unique ON id WITH unique_scope = statement;\g
ALTER TABLE gi_debugger_entry ADD PRIMARY KEY ( id ) WITH index = base table structure;\g
CREATE INDEX gi_debugger_entry_create_time ON gi_debugger_entry (create_time);\g
CREATE SEQUENCE gi_debugger_entry_content_506;\g
-- ----------------------------------------------------------
--  create table gi_debugger_entry_content
-- ----------------------------------------------------------
CREATE TABLE gi_debugger_entry_content (
    id BIGINT NOT NULL DEFAULT gi_debugger_entry_content_506.NEXTVAL,
    gi_debugger_entry_id BIGINT NOT NULL,
    debug_level VARCHAR(50) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    content LONG BYTE,
    create_time TIMESTAMP NOT NULL
);\g
MODIFY gi_debugger_entry_content TO btree unique ON id WITH unique_scope = statement;\g
ALTER TABLE gi_debugger_entry_content ADD PRIMARY KEY ( id ) WITH index = base table structure;\g
CREATE INDEX gi_debugger_entry_content_debug_level ON gi_debugger_entry_content (debug_level);\g
CREATE INDEX gi_debugger_entry_content_create_time ON gi_debugger_entry_content (create_time);\g
ALTER TABLE gi_webservice_config ADD FOREIGN KEY (create_by) REFERENCES users(id);\g
ALTER TABLE gi_webservice_config ADD FOREIGN KEY (change_by) REFERENCES users(id);\g
ALTER TABLE gi_webservice_config ADD FOREIGN KEY (valid_id) REFERENCES valid(id);\g
ALTER TABLE gi_webservice_config_history ADD FOREIGN KEY (config_id) REFERENCES gi_webservice_config(id);\g
ALTER TABLE gi_webservice_config_history ADD FOREIGN KEY (create_by) REFERENCES users(id);\g
ALTER TABLE gi_webservice_config_history ADD FOREIGN KEY (change_by) REFERENCES users(id);\g
ALTER TABLE gi_debugger_entry ADD FOREIGN KEY (webservice_id) REFERENCES gi_webservice_config(id);\g
ALTER TABLE gi_debugger_entry_content ADD FOREIGN KEY (gi_debugger_entry_id) REFERENCES gi_debugger_entry(id);\g
