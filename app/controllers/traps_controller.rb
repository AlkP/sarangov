class TrapsController < ApplicationController
  def index
    @traps = Trap.all
  end
  def save_request
    trap_id = params[:trap_id]
    puts trap_id
    trap = Trap.where('trap_id = ?', trap_id)
    if (trap.length == 0)
      trap_new = Trap.new(:trap_id => trap_id)
      trap_new.save
      trap = Trap.where('trap_id = ?', trap_id)
    end
    respond_to do |format|
      format.json { render json: 'ok '.to_json }
      format.html
    end
  end
end
