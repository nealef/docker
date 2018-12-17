#!/bin/sh

#
# If there is an apps subdirectory and there is an App.js in there then we will start it
# otherwise we just use the default app which doesn't do much except show a logo
#
if [ -d "./apps" ]; then
	cd apps
	if [ -f "App.js" ]; then
		env
		REACT_APP_APPLICATION_NAME="${APPLICATION_NAME}" REACT_APP_APPLICATION_NAMESPACE="${APPLICATION_NAMESPACE}" npm start
		exit
	fi
fi
REACT_APP_APPLICATION_NAME="${APPLICATION_NAME}" REACT_APP_APPLICATION_NAMESPACE="${APPLICATION_NAMESPACE}" npm start
