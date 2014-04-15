# -*- mode: ruby; coding: utf-8; -*-

# TODO: installer le package tomcat7
# et notifier immediatement 'clean-tomcat-root'


# Nettoie le ROOT et ROOT.war pour installer JHipster avec le context '/'
execute 'clean-tomcat-root' do
  command 'rm -rf /var/lib/tomcat7/webapps/ROOT /var/lib/tomcat7/webapps/ROOT.war'
  action :nothing
end

# TODO: Creation du fichier '/usr/share/tomcat7/bin/setenv.sh'
# a parti du template 'setenv.sh.erb', avec le owner et le group 'tomcat7'
# le fichier doit executable
# Et devra notifier en différé le service tomcat7
# JAVA_OPTS doit contenir la '-Dspring.profiles.active=prod' pour activer le profile spring


# service manage par Chef
# TODO: utiliser la resource 'service' pour gerer le service tomcat
# et executer la resource 'wait for tomcat' immediatement


# Attend le demarrage de tomcat
execute 'wait for tomcat' do
  command 'sleep 60'
  action :nothing
end

# TODO: copier le fichier '/opt/apps/jhipster.war'
# vers le fichier '/var/lib/tomcat7/webapps/ROOT.war'
# avec le owner/group 'tomcat7'
# et notifie le service tomcat 7 en différé

