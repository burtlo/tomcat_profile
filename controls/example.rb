# encoding: utf-8
# copyright: 2018, Franklin Webber

include_controls 'baseline'

title 'Tomcat Correctness'

describe host('localhost', port: 8080, protocol: 'tcp') do
  it { should be_reachable }
end

describe port(8080) do
  it { should be_listening }
  its('protocols') { should cmp('tcp') }
  its('addresses') { should cmp('::') }
end

describe http('http://localhost:8080') do
  its('body') { should match /Tomcat/ }
end

describe service('tomcat') do
  it { should(be_running) }
end

# you add controls here
# control 'tmp-1.0' do                        # A unique ID for this control
#   impact 0.7                                # The criticality, if this control fails.
#   title 'Create /tmp directory'             # A human-readable title
#   desc 'An optional description...'
#   describe file('/tmp') do                  # The actual test
#     it { should be_directory }
#   end
# end
