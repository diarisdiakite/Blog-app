<div class="user-list">
  <div class="user">
    <img class="user-image" src="user.photo" alt="User Image" />
    <div class="user-details">
      <h2 class="username"><%= @user.name %></h2>
      <br>
      <p class="post-count">Number of posts: <%= @user.posts.count %></p>
    </div>
  </div>
  <div class="bio">
  </div>
  <ul class="user-posts">
    <% @posts.each do |post| %>
      <li class="user-post">
        <div class="user-post">
          <h3><%= "Post ##{post.id}" %></h3>
          <p><%= post.text %></p>
          <small class="post-count"><%= post.comments.count %> comments</small>
        </div>
        <div class="comments">
          <ul>
            <% post.comments.each do |comment| %>
              <li><%= "#{comment.user.name}: #{comment.text}" %></li>
            <% end %>
          </ul>
        </div>
      </li>
    <% end %>
  </ul>
</div>
<div class="button">
  <button>Pagination</button>
</div>