function fn() {

    var env = karate.env || 'qa';

    var config = {
        env: env
    };

    if (env == 'qa') {
        config.baseUrl = karate.read('classpath:config/env-qa.json').baseUrl;
    }

    if (env == 'uat') {
        config.baseUrl = karate.read('classpath:config/env-uat.json').baseUrl;
    }

    if (env == 'prod') {
        config.baseUrl = 'https://api.example.com';
    }

    return config;
}