function pngquant_dir() {
  if (( $+commands[pngquant] )); then
    # Using 1000 here because OSX does so this gives consistent results
    bytes_per_kb=1000
    total_saved=0

    for file in **/*.png; do
      before_size=`wc -c < $file`
      before_size=$(($before_size / $bytes_per_kb))

      pngquant --iebug --ext .png --force $file

      after_size=$((`wc -c < $file` / $bytes_per_kb))
      diff=$(($before_size - $after_size))
      total_saved=$(($total_saved + $diff))

      echo "$file : $before_size kb -> $after_size kb"
    done

    echo "Total saved: \033[1;32m$total_saved kb\033[m"
  else
    echo "Please install pngquant (e.g. \`brew install pngquant\`)"
  fi
}
