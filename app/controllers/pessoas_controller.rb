class PessoasController < ApplicationController
  def index
    pessoas = if params[:t]
      busca_pessoas
    else
      Pessoa.select(:apelido, :nome, :nascimento, :stack)
    end

    render json: pessoas, status: 200
  end

  def show
    pessoa = Pessoa.find_by(id: pessoas_params[:id])

    if pessoa.present?
      render json: pessoa, status: 200
    else
      render status: 400
    end
  end

  def create
    pessoa = Pessoa.new(pessoas_params)

    if pessoa.save
      render json: pessoa, status: 201
    else
      render status: 422
    end
  end

  def busca_pessoas
    condition = params[:t]

    Pessoa.where('nome = ? OR apelido = ? OR ? = ANY(stack)', condition, condition, condition)
  end

  def contagem_pessoas
    count = Pessoa.count

    render json: count, status: 200
  end

  def pessoas_params
    params.require(:pessoa).permit(:apelido, :nascimento, :nome, stack: [])
  end
end
