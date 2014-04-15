# -*- mode: ruby; coding: utf-8; -*-
require 'minitest/autorun'

describe 'stack::tomcat7' do
  describe 'services' do
    it 'runs as a daemon' do
      # TODO: verifier que le status du service tomcat7 est correct
      # tips utilise assert et system
      assert system('service tomcat7 status')
    end

    it 'boots on startup' do
      # TODO: verifier que le service mysql sera bien lance au boot
      # tips: tester si un fichier de type '/etc/rc5.d/S*mysql' existe
      assert File.exists?(Dir.glob('/etc/rc5.d/S*tomcat7').first)
    end

    # TODO: pour allez plus loin, vous pouvez ajouter des tests complementaires
  end
end
