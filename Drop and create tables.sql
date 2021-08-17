--������� ��������� ����� ������� �������
drop table fact_oper;
drop table plan_oper;
drop table pr_cred;
drop table client;

--������� ������� "�������"
create table client
       (
        ID           number
       ,CL_NAME      varchar(100)
       ,DATE_BIRTH   date
--������� ����� � �������
       ,constraint client_id_pk 
                    primary key(id) 
       )        
;

--������� ������� "��������� ��������"
create table pr_cred
       (
        ID           number
       ,NUM_DOG      varchar2(10)
       ,SUMMA_DOG    number
       ,DATE_BEGIN   date
       ,DATE_END     date
       ,ID_CLIENT    number
       ,COLLECT_PLAN number
       ,COLLECT_FACT number
--������� ����� � �������
       ,constraint pr_cred_id_pk 
                   primary key (ID)
       ,constraint pr_cred_id_cl_fk
                   foreign key (ID_CLIENT)
                           references client(ID)
       ,constraint pr_cred_c_p_fk
                   unique (COLLECT_PLAN)
       ,constraint pr_cred_c_f_fk
                   unique (COLLECT_FACT)
       )
;

--������� ������� "�������� ��������"
create table plan_oper
       (
        COLLECTION_ID number
       ,P_DATE        date
       ,P_SUMMA       number
       ,TYPE_OPER     varchar2(40)
--������� ����� � �������
       ,constraint plan_oper_col_id_fk
                   foreign key (collection_id)
                           references pr_cred(collect_plan)  
       )
;

--������� ������� "����������� ��������"
create table fact_oper
       (
        COLLECTION_ID number
       ,F_DATE        date
       ,F_SUMMA       number
       ,TYPE_OPER     varchar2(40)
--������� ����� � �������
       ,constraint fact_oper_col_id_fk
                   foreign key (collection_id)
                           references pr_cred(collect_fact)
       )
;
