# Devoxx 2014: Hand's on Labs "TDD for DevOps"

Devoxx 2014 Call for Paper: [Test Driven Infrastructure: TDD pour DevOps](http://tinyurl.com/chef-tdd-for-devops)

## Installation des différents logiciels

- Virtual box 4.3.10
- Ruby 1.9.3
- Vagrant 1.4.3
- Git 1.9
- Chef 11.10.4 (option)

Demander aux speakers l'adresse pour downloader les logiciels.

Ajouter la box 'devoxx' à Vagrant situé [ici](https://www.dropbox.com/s/g2yq8n89rs5us2g/opscode_ubuntu-13.04_devoxx-0.4.0.box).
```bash
% vagrant box add opscode_ubuntu-13.04_devoxx-0.4.0 opscode_ubuntu-13.04_devoxx-0.4.0.box
% vagrant box list
```

NOTE: La box a été créée à l'aide d'un fork du projet [Bento](https://github.com/obazoud/bento/tree/devoxx), branche devoxx.

## Git

Cloner le repository Git depuis Github.

```bash
% git clone http://xxx.xxx.xxx.xxx/devoxx-tdd-for-devops
% cd devoxx-tdd-for-devops
% git checkout step1
```

NOTE: vous pouvez faire une clone de http://github.com/obazoud/devoxx-tdd-for-devops.git si vous avez accès au net.

## Installation des gems

Tous les gems requis sont dans git.

NOTE: ce n'est pas une bonne pratique mais évitons au maximun de dépendre du Wifi de Devoox

```bash
% cd site-cookbooks/stack
% bundle install --local
```

## Instructions

Voici la structure du projet utilisé lors de ce hand's on.

```bash
.
├── cookbooks
│   └── README.md
├── doc                                <-- Ensemble des documents des logiciels de tests
│   ├── bats.pdf
│   ├── ChefResourcesandProvidersReference.pdf
│   ├── ChefSpec.pdf
│   ├── serverspec-Home.pdf
│   ├── serverspec-ResourceTypes.pdf
│   └── serverspec-Tutorial.pdf
├── LICENSE
├── metadata.rb
├── README.md                          <-- Le fichier que vous êtes en train de lire
├── site-cookbooks
│   ├── README.md
│   └── stack                          <-- Cookbook 'Stack'
│       ├── attributes
│       ├── CHANGELOG.md
│       ├── Gemfile
│       ├── Gemfile.lock
│       ├── metadata.rb
│       ├── Rakefile
│       ├── README.md
│       ├── recipes
│       ├── rubocop-todo.yml
│       ├── spec
│       ├── templates
│       ├── test
│       └── vendor
└── Vagrantfile
```

### Stack

Le cookbook 'Stack', qui est à compléter, va regrouper MySQL, Tomcat et Jhipster. 

L'ensemble des commandes seront lancés via [Rake](http://rake.rubyforge.org/).

```bash
% cd site-cookbooks/stack
% rake -T
rake integration          # Run all integration tests
rake integration:kitchen  # Run Test Kitchen with Vagrant (BATS, Serverspec, ...)
rake style                # Run all style checks
rake style:foodcritic     # Lint Chef cookbooks
rake style:knife          # Runs knife cookbook test
rake style:rubocop        # Run Ruby static code analyzer
rake unit                 # Run all unit tests
rake unit:spec            # Run ChefSpec examples
```

NOTE: ce n'est pas une bonne pratique de faire un cookbook "foure tout", mais nous voulons nous focaliser sur les TDD sur le temps imparti.

#### MySQL

Le serveur mysql est à installer par son paquet Ubuntu. 

'Preseeding' est une façon de donner des réponses aux questions posées au cours du processus d'installation, sans avoir à entrer manuellement les réponses alors que l'installation est en cours d'exécution. Cela permet d'automatiser entièrement la plupart des installations.

C'est cette technique que nous allons utiliser ici, en particulier pour renseinger le mot de passe de 'root'. Pour ce faire, le fichier '/var/cache/local/preseeding/mysql-server.seed' sera créé à partir du template 'mysql-server.seed.erb', puis la commande 'debconf-set-selections' sera executée.

#### MySQL: Tests unitaires

- Vérifier que les tests sont en 'pending'.

```bash
% cd site-cookbooks/stack
% rake unit
Pending:
  stack::mysql-server set up preseeding data for debian packages
    # No reason given
    # ./spec/mysql-server_spec.rb:7
  stack::mysql-server put mysql-server preseeding file
    # No reason given
    # ./spec/mysql-server_spec.rb:13
  stack::mysql-server installs mysql-server
    # No reason given
    # ./spec/mysql-server_spec.rb:26
  stack::mysql-server service mysql
    # No reason given
    # ./spec/mysql-server_spec.rb:31
  stack::tomcat7 installs tomcat 7
    # No reason given
    # ./spec/tomcat7_spec.rb:7
  stack::tomcat7 put setenv.sh file
    # No reason given
    # ./spec/tomcat7_spec.rb:12
  stack::tomcat7 service tomcat 7
    # No reason given
    # ./spec/tomcat7_spec.rb:22
  stack::tomcat7 copy jhipster war to tomcat
    # No reason given
    # ./spec/tomcat7_spec.rb:27

Finished in 0.00521 seconds
8 examples, 0 failures, 8 pending
```

- Editer le fichier site-cookbook/stack/spec/mysql-server_spec.rb pour ajouter les tests indiqués
- Puis, éditer le fichier site-cookbook/stack/recipes/mysql-server.rb pour implementer les ressources manquantes
- Editer le fichier site-cookbook/stack/templates/default/mysql-server.erb pour préciser le bon mot de passe
- Vérfier que les tests passent correctement

#### Tomcat

Le serveur Java Tomcat7 sera installé son paquet Ubuntu. Nous souhaitons que le context de l'application soit '/'. Nous devons par conséquent supprimer le répertoire ROOT ainsi que le ROOT.war installé par défaut par le paquet système.

L'application sera visualisable en ouvrant votre navigateur avec [http://localhost:8080/](http://localhost:8080/).

Le fichier WAR de JHipster est déjà présent dans la VM Vagrant fourni à l'emplacement suivant /opt/apps/jhipster.war, il faudra le copier vers /var/lib/tomcat7/webapps/ROOT.war.

#### Tomcat: Tests unitaires

- Vérifier que les tests sont en 'pending'.

```bash
% cd site-cookbooks/stack
% rake unit
Pending:
  stack::tomcat7 installs tomcat 7
    # No reason given
    # ./spec/tomcat7_spec.rb:7
  stack::tomcat7 put setenv.sh file
    # No reason given
    # ./spec/tomcat7_spec.rb:12
  stack::tomcat7 service tomcat 7
    # No reason given
    # ./spec/tomcat7_spec.rb:22
  stack::tomcat7 copy jhipster war to tomcat
    # No reason given
    # ./spec/tomcat7_spec.rb:27

Finished in 0.0938 seconds
8 examples, 0 failures, 4 pending
```

- Editer le fichier site-cookbook/stack/spec/tomcat7-server_spec.rb pour ajouter les tests indiqués
- Puis, éditer le fichier site-cookbook/stack/recipes/tomcat7.rb pour implementer les ressources manquantes
- Editer le fichier site-cookbook/stack/templates/default/setennv.sh.erb pour préciser le bon profile dans JAVA_OPTS
- Vérfier que les tests passent correctement

```bash
% cd site-cookbooks/stack
% rake unit
........

Finished in 0.09749 seconds
8 examples, 0 failures
```

#### Tests intégrations

Vous pouvez continuer avec la branche actuelle 'step1', mais vous pouvez faire un git checkout step2' si vous êtes perdu.

- Vérifier que les tests sont en 'pending'.

```bash
% cd site-cookbooks/stack
% rake integration
-----> Cleaning up any prior instances of <default-ubuntu-1304>
-----> Destroying <default-ubuntu-1304>...
       Finished destroying <default-ubuntu-1304> (0m0.00s).
-----> Testing <default-ubuntu-1304>
-----> Creating <default-ubuntu-1304>...
       Bringing machine 'default' up with 'virtualbox' provider...
       [default] Importing base box 'opscode_ubuntu-13.04_devoxx-0.4.0'...
...
-----> Converging <default-ubuntu-1304>...
       Preparing files for transfer
       Preparing current project directory as a cookbook
...
[2014-04-15T09:55:14+00:00] INFO: Forking chef instance to converge...       
Starting Chef Client, version 11.10.4       
[2014-04-15T09:55:14+00:00] INFO: *** Chef 11.10.4 ***       
[2014-04-15T09:55:14+00:00] INFO: Setting the run_list to ["recipe[stack::default]"] from JSON       
[2014-04-15T09:55:14+00:00] INFO: Run List is [recipe[stack::default]]       
[2014-04-15T09:55:14+00:00] INFO: Run List expands to [stack::default]       
...
[2014-04-15T09:57:08+00:00] INFO: Chef Run complete in 113.717653487 seconds       
...
-----> Setting up Busser       
       Creating BUSSER_ROOT in /tmp/busser       
       Creating busser binstub       
       Plugin bats already installed       
       Plugin minitest already installed       
       Plugin serverspec already installed       
       Finished setting up <default-ubuntu-1304> (0m9.71s).
-----> Verifying <default-ubuntu-1304>...
       Suite path directory /tmp/busser/suites does not exist, skipping.       
Uploading /tmp/busser/suites/minitest/test_mysql-server.rb (mode=0644)       
...
-----> Running bats test suite       
 - it creates mysql data directory (skipped)       
 - it creates mysql user (skipped)       
...
       15 tests, 0 failures
-----> Running minitest test suite
...
4 tests, 2 assertions, 0 failures, 0 errors, 2 skips       
-----> Running serverspec test suite       
Package "mysql-server"       
  example at /tmp/busser/suites/serverspec/localhost/mysql-server_spec.rb:8 (PENDING: No reason given)       
...
Pending:       
  Package "mysql-server"       
    # No reason given       
    # /tmp/busser/suites/serverspec/localhost/mysql-server_spec.rb:8       
...
       Finished in 0.15471 seconds
       11 examples, 0 failures, 11 pending
...
-----> Destroying <default-ubuntu-1304>...
...
```

- Editer le fichier site-cookbook/stack/test/integration/default/bats/mysql-server_installed.bats et tomcat7_installed.bats pour ajouter les tests indiqués
- Editer le fichier site-cookbook/stack/test/integration/default/minitest/test_mysql-server.rb et test_tomcat7.rb pour ajouter les tests indiqués
- Editer le fichier site-cookbook/stack/test/integration/default/serverspec/localhost/mysql-server_spec.rb pour ajouter les tests indiqués
- Vérfier que les tests passent correctement

#### Style

- Vérifier le style et la qualité de votre code, et si besoin corriger en tenant compte des recommandations.

```bash
% cd site-cookbooks/stack
% rake style
```

### Allez plus loin

Si vous êtes en avance, vous pouvez:
- changer les tests et la recette Tomcat pour prendre le WAR en remote via http (deamnder aux speakers le lien)
- faire les tests et les recettes pour installer un serveur Apache devant le Tomcat
