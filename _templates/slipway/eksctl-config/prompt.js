// _templates/generator/action/prompt.js
module.exports = [
  {
    type: 'input',
    name: 'clusterName',
    message: 'What is the name of the cluster?',
    default: 'demo'
  },
  {
    type: 'input',
    name: 'region',
    message: 'What AWS region?',
    default: 'eu-west-1'
  },
  {
    type: 'input',
    name: 'kubernetesVersion',
    message: 'Kubernetes version?',
    default: '1.36'
  },
  {
    type: 'input',
    name: 'githubOwner',
    message: 'GitHub owner?',
    default: 'myspotontheweb'
  },
  {
    type: 'input',
    name: 'repoName',
    message: 'Repository name?',
    default: 'slipway'
  }
];