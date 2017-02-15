
# android_cache Step
Android cache

### INPUTS
* `FLOW_ENABLE_CACHE` - 

## EXAMPLE 

```yml
steps:
  - name: android_cache
    enable: true
    failure: true
    plugin:
      name: android_cache
      inputs:
        - FLOW_ENABLE_CACHE=$FLOW_ENABLE_CACHE
```
