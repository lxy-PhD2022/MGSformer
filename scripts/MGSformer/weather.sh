if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi
seq_len=96
model_name=MGSformer


root_path_name=./dataset/
data_path_name=weather.csv
model_id_name=weather
data_name=custom

random_seed=2021
for pred_len in 96 192 336 720
do
    python -u run_longExp.py \
      --random_seed $random_seed \
      --is_training 1 \
      --root_path $root_path_name \
      --data_path $data_path_name \
      --model_id $model_id_name_$seq_len'_'$pred_len \
      --model $model_name \
      --data $data_name \
      --features M \
      --seq_len $seq_len \
      --pred_len $pred_len \
      --enc_in 21 \
      --e_layers 8 \
      --n_heads 9 \
      --x 5\
      --d_model 128 \
      --d_ff 160 \
      --dropout 0.28801281872508566\
      --fc_dropout 0.31935425281318547\
      --head_dropout 0.23228521905588617\
      --patch_len 16\
      --stride 8\
      --des 'Exp' \
      --train_epochs 100\
      --patience 8\
      --accumulation_steps 8\
      --period 65\
      --n 1\
      --momentum 0.9758700119546663 \
      --itr 1 --batch_size 121 --learning_rate 0.000998840061822514 >logs/LongForecasting/$model_name'_'$model_id_name'_'$seq_len'_'$pred_len.log
done