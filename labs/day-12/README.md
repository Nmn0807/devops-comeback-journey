# Day 12 - Jenkins Parameters and Environment Variables

## Objectives
- Understand Jenkins built-in environment variables.
- Inspect the Jenkins workspace.
- Define custom environment variables.
- Configure build parameters.
- Use conditional execution with the `when` directive.

## 1. Built-in Jenkins Environment Variables

Explored:
- BUILD_NUMBER
- JOB_NAME
- WORKSPACE

Used `pwd` and `ls -la` to inspect the Jenkins workspace.

## 2. Custom Environment Variables

Defined pipeline-level environment variables:

- APP_NAME = my-java-app

Accessed using:

`env.APP_NAME`

## 3. Build Parameters

Configured a choice parameter:

- Name: DEPLOY_ENV
- Choices: dev, staging, production

Accessed using:

`params.DEPLOY_ENV`

Tested builds with staging and production selections.

## 4. Conditional Deployment

Used the Declarative Pipeline `when` directive:

- If DEPLOY_ENV is production, execute Deploy.
- Otherwise, skip Deploy.

## 5. Testing Results

| Selected Environment | Deploy Stage | Pipeline |
|---|---|---|
| staging | Skipped | SUCCESS |
| production | Executed | SUCCESS |

## 6. Key Learnings

- Parameters provide user-supplied build inputs.
- Environment variables provide pipeline configuration.
- `env` accesses environment variables.
- `params` accesses build parameters.
- `when` controls conditional stage execution.
- Jenkins workspace contains checked-out source files and build-related files.

## Important Note

Build, Test, and Deploy commands in this lab use echo statements
to simulate execution. No real application deployment was performed.

## Day 12 Status

Completed Jenkins environment variables, build parameters,
workspace inspection, and conditional deployment.
