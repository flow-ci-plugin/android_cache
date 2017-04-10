# ************************************************************
#
# This step will enable/disable cache
#
#   Variables used:
#     $FLOW_ENABLE_CACHE
#     $FLOW_VERSION
#
#   Outputs:
#     $FLOW_ENABLE_CACHE
#
# ************************************************************

gradle_cache(){
  echo 'start gradle cache'
  FLOW_GRADLE_CACHE_PATH="$CACHE_BASE_URL/gradle/user_cache"
  FLOW_USER_GRADLE_CACHE="$HOME/.gradle"
  
  if [[ -d $FLOW_GRADLE_CACHE_PATH ]]; then
    echo "cache exists"
  else
    echo "cache not exists"
    mkdir -p $FLOW_GRADLE_CACHE_PATH
  fi
  echo "$(date)" > $FLOW_GRADLE_CACHE_PATH/cache_version
  cp -f $FLOW_USER_GRADLE_CACHE/gradle.properties $FLOW_GRADLE_CACHE_PATH/
  rm -rf  $FLOW_USER_GRADLE_CACHE && ln -s  $FLOW_CACHE_PATH $FLOW_USER_GRADLE_CACHE

 FLOW_PROJECT_CACHE_PATH="$CACHE_BASE_URL/gradle/project_cache"
 FLOW_PROJECT_GRADLE_CACHE="$FLOW_CURRENT_PROJECT_PATH/.gradle"

  if [[ -d $FLOW_PROJECT_CACHE_PATH ]]; then
    echo
  else
    mkdir -p $FLOW_PROJECT_CACHE_PATH
  fi
  echo "$(date)" > $FLOW_PROJECT_CACHE_PATH/cache_version
  rm -rf  $FLOW_PROJECT_GRADLE_CACHE && ln -s $FLOW_PROJECT_CACHE_PATH $FLOW_PROJECT_GRADLE_CACHE
}
npm_cache(){
  echo 'start npm cache'
  FLOW_NPM_CACHE_PATH="$CACHE_BASE_URL/$FLOW_VERSION/modules"
  if [[ -d $FLOW_NPM_CACHE_PATH ]]; then
    echo "cache exists"
  else
    echo "cache not exists"
    mkdir -p $FLOW_NPM_CACHE_PATH
  fi

  ln -s $FLOW_NPM_CACHE_PATH $FLOW_CURRENT_PROJECT_PATH
}

if [[ $FLOW_ENABLE_CACHE == 'TRUE' ]]; then
  
  if [[ $ENABLE_GRADLE_CACHE == 'TRUE' ]]; then
    gradle_cache
  fi
  if [[ $ENABLE_NPM_CACHE == 'TRUE' ]]; then
    npm_cache
  fi
else
  echo 'cache disabled'
fi
