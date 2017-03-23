Gem::Specification.new do |s|
  s.name = 'saytime'
  s.version = '0.2.0'
  s.summary = 'Speaks the local time in English using WAV files stiched together'
  s.authors = ['James Robertson']
  s.files = Dir['lib/saytime.rb','wav/*.wav']
  s.add_runtime_dependency('wavefile', '~> 0.8', '>=0.8.1')   
  s.signing_key = '../privatekeys/saytime.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/saytime'
end
