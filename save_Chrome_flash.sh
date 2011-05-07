function save_Chrome_flash {
  #!/bin/bash

  function choose_browser {
    echo -n "which browser (Chromium[1] / Google Chrome[2]): "
    read ans
	  if [[ $ans == 1 ]]; then
      cd ~/.cache/chromium/Default/Cache
      refresh_list

    elif [[ $ans == 2 ]]; then
      cd ~/.cache/google-chrome/Default/Cache
      refresh_list

    elif [[ $ans > 2 ]]; then
      echo "sorry your browser is not supported."
      echo "choose another browser."
      choose_browser
    fi
  }

  function refresh_list {
    ls -clhtrAS --color f_* | tail
    echo -n "refresh list (y/n)? "
    read ans
    if [[ $ans == "y" ]]; then
      clear
      refresh_list
    elif [[ $ans == "n" ]]; then
      choose_flash_cmd
    else
      echo "Did you mean 'y' or 'n'? "
      refresh_list
    fi
  }

  function copy_flash_file {
    echo -n "choose file? "
    read ans
    echo -n "filename: "
    read ans2
    cp $ans ~/Desktop/$ans2.flv
    echo -n "play file (y/n)? "
    read ans
    if [[ $ans == "y" ]]; then
      vlc ~/Desktop/$ans2.flv
    elif [[ $ans == "n" ]]; then
      cd ~/
      clear
    fi
  }

  function play_flash_file {
    echo -n "choose file to play: "
    read ans
    vlc $ans
    choose_flash_cmd
  }

  function choose_flash_cmd {
    echo -n "choose command [copy(1) / play(2) / refresh list(3)]: "
    read ans
    if [[ $ans == 1 ]]; then
      copy_flash_file
    elif [[ $ans == 2 ]]; then
      play_flash_file
    elif [[ $ans == 3 ]]; then
      refresh_list
    else
      echo "Did you mean 'y' or 'n'? "
      choose_flash_cmd
    fi
  }
  choose_browser
}
