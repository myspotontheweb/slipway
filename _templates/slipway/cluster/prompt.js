module.exports = [
{
    type: 'input',
    name: 'name',
    message: 'What is the project name?',
    validate: (value) => {
      if (!value || !value.trim()) {
        return 'Name is required!';
      }
      return true;
    }
  },  
  {
    type: 'select',
    name: 'cloud',
    message: 'What cloud platform are you using?',
    choices: ['aws', 'cloudstack'],
    default: 'aws'
  },
  {
    type: 'input',
    name: 'certManagerVersion',
    message: 'What is the Cert Manager version?',
    default: 'v1.21.2'
  },
  {
    type: 'input',
    name: 'trustManagerVersion',
    message: 'What is the Trust Manager version?',
    default: 'v0.25.0'
  },
  {
    type: 'input',
    name: 'cnpgVersion',
    message: 'What is the CNPG version?',
    default: '0.29.0'
  },
  {
    type: 'input',
    name: 'barmanPluginVersion',
    message: 'What is the Barman Plugin version?',
    default: '0.8.0'
  }
];