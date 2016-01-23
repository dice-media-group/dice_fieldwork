class NotesController < ApplicationController
  def index
    @notable = Account.find( params[:account_id])
    @notes = @notable.notes
  end

  def new
  end
end
