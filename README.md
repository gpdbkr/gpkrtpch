# Greenplum 5/6/7 테스트를 위한 TPCH 스크립트입니다.

## 설정을 위한 작업

```
1) 스크립트 unzip
소스를 다운 받아 gpkrtpch-main.zip을 마스터 노드의 /data/ 폴더에 copy
[gpadmin@mdw ~]$ cd /data
[gpadmin@mdw data]$ ls -la
-rw-rw-r--   1 gpadmin gpadmin 762536  3월 31 17:53 gpkrtpch-main.zip
[gpadmin@mdw data]$ unzip gpkrtpch-main.zip
[gpadmin@mdw data]$ mv gpkrtpch-main gpkrtpch
[gpadmin@mdw gpkrtpch]$ cd gpkrtpch
[gpadmin@r8g7 gpkrtpch]$ ls -l
1.0_load_hba.sh
1.1_create_db.sh
1.2_create_role.sh
1.3_create_tb.sh
1.4_pk_index.sh
2.0_truncate_tb.sh
2.1_files.sh
2.2_upload.sh
2.3_analyze.sh
2.4_count.sh
2.5_skew1.sh
2.6_skew2.sh
3.1_inc_pre_count.sh
3.2_increment.sh
3.3_inc_after_count.sh
3.4_pk_index.sh
3.5_analyze.sh
3.6_count.sh
3.7_size.sh
4.1_oltp.sh
4.1_oltp_basic.sh
4.1_oltp_lot.sh
4.2_seq.sh
4.3_parallel.sh
4.3_parallel.sh.org
4.4_batch.sh
4.5_ctas.sh
4.6_dml.sh
4.7_dml_parallel.sh
5.1_mixedworkload.sh
6.1_compress.sh
6.2_size.sh
7.1_unload.sh
8.1_oltp_query_tags.sh
8.3_parallel_query_tags.sh
9.1_oltp_withouttags.sh
9.3_parallel_withouttags.sh
all.sh
check.sh
check_log.sh
data
log
query
rg.1_create_rg.sh
rg.2_rg_role.sh
rg.3_rg_config.sh
rg.4_rg_status.sh
rg.5_rg_status_cpu.sh
rg.6_rg_modify_cpu.sh
run.sh
sql
yml
[gpadmin@r8g7 gpkrtpch]$
```

## 실행 
1. 초기 수행
```
[gpadmin@r8g7 gpkrtpch]$ cd /data/gpkrtpch
[gpadmin@r8g7 gpkrtpch]$ chmod 755 *.sh
[gpadmin@r8g7 gpkrtpch]$ ./all.sh
```

2. 재수행
```
[gpadmin@r8g7 gpkrtpch]$ vi ./all.sh
#./1.0_load_hba.sh ## 첫 라인만 주석 처리 후 저장
[gpadmin@r8g7 gpkrtpch]$ ./all.sh
```

## 실행 소요 시간 로그 확인
로그 포맷: 스크립트명|시작시각|종료시각|소요시간(초)
```
[gpadmin@r8g6single gpkrtpch]$ cd /data/gpkrtpch/log
[gpadmin@r8g6single log]$ tail -n 1  ?.?_*.log  | grep "|"
./1.1_create_db.sh|2023-07-05 14:11:36|2023-07-05 14:11:37|1
./1.2_create_role.sh|2023-07-05 14:11:37|2023-07-05 14:11:37|0
./1.3_create_tb.sh|2023-07-05 14:11:37|2023-07-05 14:11:37|0
./1.4_pk_index.sh|2023-07-05 14:11:37|2023-07-05 14:11:37|0
./2.0_truncate_tb.sh|2023-07-05 14:11:37|2023-07-05 14:11:38|1
./2.1_files.sh|2023-07-05 14:11:38|2023-07-05 14:11:45|7
./2.2_upload.sh|2023-07-05 14:11:45|2023-07-05 14:12:06|21
./2.3_analyze.sh|2023-07-05 14:12:06|2023-07-05 14:12:10|4
./2.4_count.sh|2023-07-05 14:12:10|2023-07-05 14:12:13|3
./2.5_skew1.sh|2023-07-05 14:12:13|2023-07-05 14:12:16|3
./2.6_skew2.sh|2023-07-05 14:12:16|2023-07-05 14:12:19|3
./3.1_inc_pre_count.sh|2023-07-05 14:12:19|2023-07-05 14:12:23|4
./3.2_increment.sh|2023-07-05 14:12:23|2023-07-05 14:12:59|36
./3.3_inc_after_count.sh|2023-07-05 14:12:59|2023-07-05 14:13:10|11
./3.4_pk_index.sh|2023-07-05 14:13:10|2023-07-05 14:13:10|0
./3.5_analyze.sh|2023-07-05 14:13:10|2023-07-05 14:13:21|11
./3.6_count.sh|2023-07-05 14:13:21|2023-07-05 14:13:27|6
./3.7_size.sh|2023-07-05 14:13:27|2023-07-05 14:13:27|0
./4.1_oltp_basic.sh|2023-07-05 14:13:27|2023-07-05 14:13:59|32
./4.1_oltp_lot.sh|2023-07-05 14:13:59|2023-07-05 14:14:17|18
./4.1_oltp.sh|2023-07-05 14:14:17|2023-07-05 14:14:24|7
./4.2_seq.sh|2023-07-05 14:14:24|2023-07-05 14:20:16|352
./4.3_parallel.sh|2023-07-05 14:20:16|2023-07-05 14:20:44|28
./4.4_batch.sh|2023-07-05 14:20:44|2023-07-05 14:20:46|2
./4.5_ctas.sh|2023-07-05 14:20:46|2023-07-05 14:21:45|59
./4.6_dml.sh|2023-07-05 14:21:45|2023-07-05 14:22:40|55
./4.7_dml_parallel.sh|2023-07-05 14:22:40|2023-07-05 14:23:09|29
./5.1_mixedworkload.sh|2023-07-05 14:23:09|2023-07-05 14:23:49|40
./6.1_compress.sh|2023-07-05 14:23:49|2023-07-05 14:23:52|3
./6.2_size.sh|2023-07-05 14:23:52|2023-07-05 14:23:52|0
./7.1_unload.sh|2023-07-05 14:23:52|2023-07-05 14:23:52|0
./8.1_oltp_query_tags.sh|2023-07-05 14:23:52|2023-07-05 14:23:59|7
./8.3_parallel_query_tags.sh|2023-07-05 14:23:59|2023-07-05 14:24:28|29
./9.1_oltp_withouttags.sh|2023-07-05 14:24:28|2023-07-05 14:24:35|7
./9.3_parallel_withouttags.sh|2023-07-05 14:24:35|2023-07-05 14:25:03|28
[gpadmin@r8g6single log]$
```
