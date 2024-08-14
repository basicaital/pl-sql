UPDATE clients
SET DESCRIPTION = REGEXP_REPLACE(
    DESCRIPTION,
    '(\s)(\S+)(\s\S\.\s*\S\.)',
    ' ' || SUBSTR(fio, 1, INSTR(fio, ' ') - 1) || ' ' || 
    SUBSTR(fio, INSTR(fio, ' ') + 1, 1) || '. ' || 
    SUBSTR(fio, INSTR(fio, ' ', 1, 2) + 1, 1) || '.'
)
WHERE REGEXP_INSTR(DESCRIPTION, '(\s)(\S+)(\s\S\.\s*\S\.)') > 0;

