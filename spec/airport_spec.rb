require 'airport'

describe Airport do 

  let(:flying_plane) { double :plane, flying?: true }
  let(:landed_plane) { double :plane, flying?: false }

  describe 'launches planes' do 
    it 'responds to launch_plane' do 
      expect(subject).to respond_to :launch_plane
    end

    it 'launches a plane that flies' do 
      expect(flying_plane).to be_flying
    end

    it 'raises an error when the airport is empty' do 
      expect { subject.launch_plane }.to raise_error('No planes for take off.')
    end
  end

  describe 'lands planes' do 
    it 'responds to land plane' do 
      expect(subject).to respond_to(:land).with(1).argument 
    end

    it 'lands a plane' do 
      expect(subject.land(flying_plane)).to eq [flying_plane] 
    end

    it 'responds to plane' do 
      expect(subject).to respond_to(:planes)
    end

    it 'raises an error when the airport is full' do 
      subject.capacity.times { subject.land(flying_plane) }
      expect { subject.land(flying_plane) }.to raise_error('Airport is full.')
    end

  end

end