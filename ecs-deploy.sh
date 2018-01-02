#! /bin/bash
# Deploy only if it's not a pull request
if [ -z "$TRAVIS_PULL_REQUEST" ] || [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  # Deploy only if we're testing the master branch
  if [ "true" == "true" ]; then
    echo "Deploying $TRAVIS_BRANCH on $TASK_DEFINITION"
    ./bin/ecs-deploy -c $TASK_DEFINITION -n $SERVICE -i $REMOTE_IMAGE_URL:$TRAVIS_BRANCH
  else
    echo "could potentilly deploy feature branch to a test/qa ECS cluster here"
  fi
else
  echo "Skipping deploy because it's a PR"
fi