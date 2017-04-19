# oneskyapp-cli

## Dependencies

The `json` library above will be installed automatically. If you get error because of library not found, please install manually by running command
 
```javascript
	npm i -g json
```

## Configuration

Connecting to `oneskyapp` api, you need 

1. `api_key` and `secret_key`
> Open project setting > API Keys & Usage

2. Source file name that you want to get
> Project dashboard > File > File name

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
 	./translations.sh API_KEY SECRET_KEY PROJECT_ID SOURCE_FILE_NAME path_to_your_folder
 ```