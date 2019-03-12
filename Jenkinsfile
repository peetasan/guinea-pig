pipeline {
  agent any
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
        sh 'docker build .'
      }
    }
    stage('Publish') {
      steps {
        def commitId = sh(returnStdout: true, script: 'git rev-parse HEAD')
        sh 'pip install --user -r requirements.txt'
        sh "docker push docker.flcn.io/test/guinea-pig:${commitId}"
      }
    }
  }
}
