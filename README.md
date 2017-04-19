# oneskyapp-cli

## Dependencies

The `json` library above will be installed automatically. If you get error because of library not found, please install manually by running command
 
```javascript
	npm i -g json
```

## Configuration

Connecting to `oneskyapp` api, you need `api_key` and `secret_key`, get it from 
> Open project setting > API Keys & Usage

## How to use

Get project group id 
```javascript
 	./project_group.sh API_KEY SECRET_KEY 
 ```
 
 Get project ids
```javascript
 	./projects.sh API_KEY SECRET_KEY PROJECT_GROUP_ID
 ```

Get translation jsons
```javascript
 	./translations.sh API_KEY SECRET_KEY PROJECT_ID path_to_your_folder
 ```