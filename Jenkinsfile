pipeline {
  agent any
  environment {
    SHA = sh(returnStdout: true, script: 'git rev-parse HEAD')
    }
  options {
        skipStagesAfterUnstable()
    }
  stages {
    stage('Clone') {
      steps {
        git 'https://github.com/peetasan/guinea-pig'
      }
    }
    stage('Build') {
      steps {
        sh 'pip install --user -r requirements.txt'
        sh "docker build . -t docker.flcn.io/test/guinea-pig:${SHA}"
      }
    }
    stage('Publish') {
      steps {
        sh 'pip install --user -r requirements.txt'
        sh "docker push docker.flcn.io/test/guinea-pig:${SHA}"
      }
    }
  }
}
