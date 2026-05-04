function config () {  
      
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'local';
    karate.log('Switching to:', env);
  }

  var config = {
    env: env
  }

  //Finder url
  config.finderUrl = 'http://localhost:8182';

  //Event loader
  config.eventProducer = 'http://localhost:8180/events/loadSpecificRecord?topic={topic_name}';
  config.command = read('classpath:command.js');

  return config;
}