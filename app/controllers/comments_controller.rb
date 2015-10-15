class CommentsController < ApplicationController
  def create
  	@post = Post.find(params[:post_id])
  	# @comments = @post.comments


  	@comments = @post.comments.build(comment_params)
  	@comments.save

  	redirect_to @post
  end

	private

		def comment_params
			params.require(:comment).permit(:content)
		end

end


# // crear .build de comments, y poner los comments params y redirect_to: post, no olvidar ponerle.save,