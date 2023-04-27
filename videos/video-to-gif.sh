# https://wizyoung.dogcraft.xyz/video2gif-with-high-quality

ffmpeg -i $1 -vf "scale=768:-1,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -gifflags -transdiff -y $2
# ffmpeg -i $1 -vf "scale=768:-1,split[split1][split2];[split1]palettegen=stats_mode=single[pal];[split2][pal]paletteuse=new=1" -gifflags -transdiff -y $2

# set -e

# # global filter
# fps=8
# scale=768:-1
# interpolation=lanczos

# # for palettegen
# max_colors=256  # up to 256
# reserve_transparent=on
# stats_mode=full  # chosen from [full, diff, single]

# # for paletteuse
# dither=bayer  # chosen from [bayer, heckbert, floyd_steinberg, sierra2, sierra2_4a, none]
# bayer_scale=5  # [0, 5]. only works when dither=bayer. higher means more color banding but less crosshatch pattern and smaller file size
# diff_mode=rectangle  # chosen from [rectangle, none]
# new=off  # when stats_mode=single and new=on, each frame uses different palette

# ffmpeg -i $1 -vf "fps=$fps,scale=$scale:flags=$interpolation,split[split1][split2];[split1]palettegen=max_colors=$max_colors:reserve_transparent=$reserve_transparent:stats_mode=$stats_mode[pal];[split2][pal]paletteuse=dither=$dither:bayer_scale=$bayer_scale:diff_mode=$diff_mode:new=$new" -y $2
