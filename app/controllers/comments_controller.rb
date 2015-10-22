class CommentsController < ApplicationController
  load_and_authorize_resource
  def create
  	@post = Post.find(params[:post_id])
  	# @comments = @post.comments
  	@comment = @post.comments.build(comment_params)
    @comment.user = current_user
  	@comment.save

  	redirect_to @post
  end

  def like
    @post = Post.find(params[:post_id])
    @comment = Post.find(params[:id])
    @like = @comment.likes.build(user: current_user)

    if @comment.liked_by? current_user
      @comment.remove_like current_user
      redirect_to @post, notice: 'Tu like a sido eliminado :('
    elsif @like.save
      redirect_to @post, notice: 'Gracias por tu like :D'
    else
      redirect_to @post, notice: 'Tu like no se ha guardado :('
    end
  end

	private

		def comment_params
			params.require(:comment).permit(:content)
		end

end


# // crear .build de comments, y poner los comments params y redirect_to: post, no olvidar ponerle.save,