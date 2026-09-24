module.exports = [
{
    type: 'input',
    name: 'name',
    message: 'What is the cluster name?',
    validate: (value) => {
      if (!value || !value.trim()) {
        return 'Name is required!';
      }
      return true;
    }
  },  
  {
    type: 'select',
    name: 'region',
    message: 'What region are you using?',
    choices: ['us-east-1', 'us-west-2', 'eu-west-1'],
    default: 'us-east-1'
  },
  {
    type: 'input',
    name: 'kubernetesVersion',
    message: 'What is the Kubernetes version?',
    default: '1.36'
  }
];