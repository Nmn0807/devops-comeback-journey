
# Day 11 – Jenkins Pipeline and Jenkinsfile

## Objectives
- Understand Jenkins Pipeline as Code.
- Learn Declarative Pipeline syntax.
- Create and execute a Jenkinsfile.
- Integrate Jenkins with GitHub.
- Understand pipeline failure handling.
- Configure post-build actions.

## 1. What is a Jenkinsfile?

A Jenkinsfile is a text file that defines a Jenkins pipeline as code.

It allows us to:
- Store pipeline configuration in Git.
- Track pipeline changes through version control.
- Review pipeline changes through pull requests.
- Maintain consistent CI/CD workflows.

## 2. Declarative Pipeline Structure

Important components:

- `pipeline`: Defines the entire pipeline.
- `agent any`: Allows Jenkins to run on any available agent.
- `stages`: Contains pipeline stages.
- `stage`: Defines an individual stage.
- `steps`: Contains commands executed in a stage.
- `echo`: Prints messages in the Jenkins console.
- `sh`: Executes shell commands on Linux agents.

## 3. Pipeline Stages

Created three stages:

### Build
Simulates application build.

### Test
Simulates application testing.

### Deploy
Simulates application deployment.

Note: The initial pipeline uses echo commands to simulate these activities. It does not perform a real application build or deployment.

## 4. Jenkins Integration with GitHub

Configured a Jenkins Pipeline job using:

- Pipeline definition: Pipeline script from SCM
- SCM: Git
- Repository: devops-comeback-journey
- Branch: feature/jenkins-pipeline
- Script Path: Jenkinsfile
- Repository access: Public HTTPS

Jenkins fetches the Jenkinsfile and executes the pipeline from the selected GitHub branch.

## 5. Pipeline Failure Handling

Tested a deliberate failure using:

`sh 'exit 1'`

Observed:

- Build: SUCCESS
- Test: FAILURE
- Deploy: SKIPPED
- Overall pipeline: FAILURE

This demonstrated that Jenkins prevents later stages from running after an earlier stage fails by default.

## 6. Post Actions

Configured three Declarative Pipeline post conditions:

- `success`: Executes when the pipeline succeeds.
- `failure`: Executes when the pipeline fails.
- `always`: Executes regardless of the pipeline result.

Tested both successful and failed pipeline executions.

## 7. Important Commands

```bash
git switch -c feature/jenkins-pipeline
git add Jenkinsfile
git commit -m "Add Jenkins declarative pipeline"
git push
```

## 8. Key Learnings

- Jenkins Pipeline as Code.
- Declarative Pipeline syntax.
- Jenkinsfile and SCM integration.
- Build, Test and Deploy stages.
- Exit codes and pipeline failure handling.
- Automatic skipping of later stages after failure.
- Jenkins post conditions.
- GitHub feature branch and pull request workflow.

## Completion Status

- [x] Created Jenkinsfile.
- [x] Created Declarative Pipeline.
- [x] Integrated Jenkins with GitHub.
- [x] Executed successful pipeline.
- [x] Tested pipeline failure.
- [x] Verified deployment skipping.
- [x] Configured success, failure and always post actions.
- [x] Tested success and failure post conditions.
- [x] Merged pipeline into main through pull request.
- [x] Documented Day 11.

