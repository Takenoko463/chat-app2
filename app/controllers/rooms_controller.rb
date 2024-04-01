class RoomsController < ApplicationController
  def new
    #ヘルパーメソッドに渡すinstance変数
    @room = Room.new
  end
end
