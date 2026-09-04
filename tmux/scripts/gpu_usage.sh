#!/usr/bin/env bash
# setting the locale, some users have issues with different locales, this forces the correct one
export LC_ALL=en_US.UTF-8

# function for getting the refresh rate
get_tmux_option() {
  local option=$1
  local default_value=$2
  local option_value=$(tmux show-option -gqv "$option")
  if [ -z $option_value ]; then
    echo $default_value
  else
    echo $option_value
  fi
}

get_platform() {
  case $(uname -s) in
  Linux)
    gpu=$(lspci -v | grep VGA | head -n 1 | awk '{print $5}')
    ;;

  Darwin)
    gpu=$(system_profiler SPDisplaysDataType | grep "Chipset" | awk '{print $3}')
    ;;

  CYGWIN* | MINGW32* | MSYS* | MINGW*)
    # TODO - windows compatability
    ;;
  esac
  echo "$gpu"
}
get_gpu() {
  gpu=$(get_platform)
  if [[ "$gpu" == NVIDIA ]]; then
    usage=$(nvidia-smi | grep '%' | awk '{ sum += $13 } END { printf("%d%%\n", sum / NR) }')
  elif [[ "$gpu" == Apple ]]; then
    usage=$(macmon pipe -s 1 | jq -r '((.gpu_usage[1] // 0) * 100 | round | tostring) + "%"')
  else
    usage='unknown'
  fi
  echo "$usage"
}
main() {
  # storing the refresh rate in the variable RATE, default is 5
  RATE=$(get_tmux_option "@gruvbox-refresh-rate" 5)
  gpu_usage=$(get_gpu)
  echo "GPU $gpu_usage "
  sleep "$RATE"
}
# run the main driver
main
