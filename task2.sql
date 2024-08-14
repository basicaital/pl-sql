CREATE OR REPLACE FUNCTION get_working_days(start_date DATE, end_date DATE)
RETURN NUMBER
IS
    num_days NUMBER;
BEGIN
    -- ������������ ����� ���������� ���� ����� ������
    num_days := end_date - start_date + 1;

    -- �������� �������� (������� � �����������)
    num_days := num_days - 2 * ((num_days + TO_CHAR(start_date, 'D') - 1) / 7);

    -- ��������� �������� ������, ���� ��������� ��� �������� ���� �������� �� ��������
    IF TO_CHAR(start_date, 'D') = 7 THEN
        num_days := num_days - 1;
    END IF;
    IF TO_CHAR(end_date, 'D') = 1 THEN
        num_days := num_days - 1;
    END IF;

    RETURN num_days;
END;
