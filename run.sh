#./4.1_oltp.sh
#./4.2_seq.sh
#./4.3_parallel.sh
#./4.4_batch.sh
#./5.1_mixedworkload.sh


./4.1_oltp.sh &
./4.2_seq.sh &
./4.3_parallel.sh &
./4.4_batch.sh &
./4.5_ctas.sh &
#./5.1_mixedworkload.sh
