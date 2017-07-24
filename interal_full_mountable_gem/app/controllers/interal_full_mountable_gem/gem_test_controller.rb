require_dependency "interal_full_mountable_gem/application_controller"

module InteralFullMountableGem
  class GemTestController < ApplicationController
    def test1
      @something = 'yo'
    end

    def test2
      @something = 'wat'
    end
  end
end
