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



if [[ $FLOW_ENABLE_CACHE == 'TRUE' ]]; then
  echo 'start android cache'
  FLOW_CACHE_PATH="$CACHE_BASE_URL/gradle/user_cache"
  FLOW_USER_GRADLE_CACHE="$HOME/.gradle"
  
  if [[ -d $FLOW_CACHE_PATH ]]; then
    echo "cache exists"
  else
    echo "cache not exists"
    mkdir -p $FLOW_CACHE_PATH
  fi
  echo "$(date)" > $FLOW_CACHE_PATH/cache_version
  cp -f $FLOW_USER_GRADLE_CACHE/gradle.properties $FLOW_CACHE_PATH/
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


else
  echo 'cache disabled'
fi
