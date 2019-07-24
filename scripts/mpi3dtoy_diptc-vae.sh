#! /bin/sh

FILENAME=$(basename $0)
FILENAME="${FILENAME%.*}"
NAME=${1:-$FILENAME}

echo "name=$NAME"

python3 main.py \
--aicrowd_challenge=true \
--name=$NAME \
--alg=BetaVAE \
--vae_loss=AnnealedCapacity \
--vae_type DIPVAE BetaTCVAE \
--dip_type=i \
--traverse_z=true \
--encoder=PadlessGaussianConv64 \
--decoder=SimpleConv64 \
--discriminator=SimpleDiscriminator \
--z_dim=20 \
--use_wandb=True \
--w_kld=1.0 \
--w_tc_analytical=1.0 \
--lr_G=0.001 \
--lr_scheduler=ReduceLROnPlateau \
--lr_scheduler_args mode=min factor=0.95 patience=1 min_lr=0.000001 \
--max_iter=30000 \
--iterations_c=2000 \
--ckpt_load=./saved_models/mpi3dtoy_betatc/saved2 \
--ckpt_load_iter=false \
--ckpt_load_optim=false \
--evaluate_metric=mig \

#--ckpt_load=checkpoints/mpi3dtoy_diptc-vae/last \

#--ckpt_load=./saved_models/mpi3dtoy_ae_gaussian/saved2 \
#--ckpt_load_iternum=false \





