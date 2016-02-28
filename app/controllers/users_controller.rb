class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show_table
    table_time = Date.new(params[:table_year].to_i, params[:table_month].to_i).to_time
    @entries = TableEntry.where(user_id: params[:user_id], date: table_time..table_time.end_of_month)
  end
end
