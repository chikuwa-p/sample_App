class TodolistsController < ApplicationController
  def index
    @lists = List.all  
  end
  
  def new
    @list = List.new
  end
  
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to todolist_path(@list.id), notice: "成功しました"
      #flash[:notice] = "successfully"
      #redirect_to todolist_path(@list.id)
    else
      #redirect_to  todolists_new_path
      render :new
    end
  end
  
  def show
    @list = List.find(params[:id])
  end
  
  def edit
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
  
end
