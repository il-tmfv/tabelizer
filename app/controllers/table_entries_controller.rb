class TableEntriesController < ApplicationController
  def index
    @table_entries = current_user.table_entries.limit(60).order(date: :desc)
  end

  def new
    @table_entry = TableEntry.new
  end

  def create
    @table_entry = TableEntry.new(entry_params)
    if @table_entry.save
      flash[:notice] = 'Создана новая запись'
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def edit
    @table_entry = TableEntry.find(params[:id])
  end

  def update
    @table_entry = TableEntry.find(params[:id])
    if @table_entry.update_attributes(entry_params)
      flash[:notice] = 'Изменения сохранены'
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    TableEntry.destroy(params[:id])
    redirect_to action: :index
  end

  private
  def entry_params
    params.require(:table_entry).permit(:user_id, :project_id, :comment, :date, :duration)
  end
end
