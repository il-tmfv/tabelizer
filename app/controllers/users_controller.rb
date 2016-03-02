class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show_table
    @current_year = Date.current.year
    requested_date = Date.new(params[:table_year].to_i, params[:table_month].to_i )
    table_time = check_table_date requested_date
    @entries = TableEntry.where(user_id: params[:user_id], date: table_time..table_time.end_of_month)
    @table_user_id = params[:user_id]
    @table_year_start = @table_year.to_i - 2
    @table_year_end = @table_year.to_i + 2 > @current_year ? @current_year : @table_year.to_i + 2
  end

  private
  
  def check_table_date requested_date
    if requested_date.past?
      @table_year = params[:table_year]
      @table_month = params[:table_month]
      table_time = requested_date.to_time
    else
      table_time = Date.current.to_time
      @table_year = table_time.year
      @table_month = table_time.month
    end
    return table_time
  end
end
