class TrapsController < ApplicationController
  def index
    @traps = Trap.all
  end
  def save_request
    @respond = 'ok'
    trap_id = params[:trap_id]
    if (Trap.where('trap_id = ?', trap_id).length == 0)
      trap_new = Trap.new(:trap_id => trap_id)
      @respond = 'error' unless trap_new.save
    end
    trap = Trap.where('trap_id = ?', trap_id).first
    request_new = Request.new(traps_id:       trap.id,
                              remote_ip:      request.remote_ip,
                              request_method: request.method,
                              scheme:         request.scheme,
                              query_string:   request.query_string.inspect,
                              query_params:   request.query_parameters.inspect,
                              cookies:        request.cookies.inspect)
    @respond = 'error' unless request_new.save
    respond_to do |format|
      format.json { render json: @respond.to_json }
      format.html
    end
  end
end
