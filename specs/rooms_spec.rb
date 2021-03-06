require("minitest/autorun")
require("minitest/rg")
require_relative("../room.rb")
require_relative("../song.rb")
require_relative("../guest.rb")

class RoomTest < MiniTest::Test

  def setup()
    @song1 = Song.new("Dancing Queen","Abba")
    @g1 = Guest.new("Ryan B",55)
    @g2 = Guest.new("Dan K",40)
    @g3 = Guest.new("Katie A",45)
    @g4 = Guest.new("Amy B",50)
    @g5 = Guest.new("Nick L",20)
    @room1 = Room.new("Room1")
    @room2 = Room.new("Room2")
  end

  def test_room_has_name
    assert_equal("Room1", @room1.name)
  end

  def test_room_is_empty
    assert_equal(0 , @room1.guest_count)
  end

  def test_add_guest
    @room1.add_guest(@g1)
    assert_equal(1, @room1.guest_count)
    assert_equal(@g1.guest_name, @room1.guests.first().guest_name)
  end

  def test_remove_guest
    @room1.remove_guest(@g1)
    assert_equal(0, @room1.guest_count)
  end


  def test_add_song_to_room
    @room1.add_song(@song1)
    assert_equal(1, @room1.songs.count)

  end

  def test_capacity
    assert_equal(4,@room1.capacity)
  end

def test_room_is_full
  @room1.capacity += 1
  assert_equal("Sorry, Room is full" , @room1.room_capacity)
end

def test_entry_fee
  assert_equal(5, @room1.entry_fee)
end



end
