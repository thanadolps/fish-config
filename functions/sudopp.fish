function sudopp --wraps='sudo -E env "PATH=$PATH"' --description 'alias sudopp sudo -E env "PATH=$PATH"'
  sudo -E env "PATH=$PATH" $argv
        
end
