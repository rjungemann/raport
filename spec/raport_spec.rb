require 'socket'

def port_taken? port
  begin
    TCPSocket.new('127.0.0.1', port)
  rescue Errno::ECONNREFUSED
    return false
  end

  return true
end

describe 'Raport' do
  it 'should exist' do
    File.should exist('bin/raport')
  end

  it 'should return a random port when called' do
    output = `bin/raport`.chomp

    output.should match(/\d+/)
    output.should have_at_least(4).items
    output.should have_at_most(5).items
  end

  describe 'the random port' do
    it 'should not be already taken' do
      port = `bin/raport`.chomp.to_i

      port_taken?(port).should be_false
    end
  end
end
